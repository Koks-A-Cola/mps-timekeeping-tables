package Timekeeping.editor;

/*Generated by MPS */

import javax.swing.table.AbstractTableModel;
import java.util.List;
import org.jetbrains.mps.openapi.model.SNode;
import org.jetbrains.mps.openapi.module.ModelAccess;
import org.jetbrains.mps.openapi.module.SRepository;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import javax.swing.JTable;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.BorderFactory;
import javax.swing.AbstractCellEditor;
import javax.swing.table.TableCellEditor;
import javax.swing.table.TableCellRenderer;
import java.util.Map;
import java.util.LinkedList;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import java.util.HashMap;

public class DTR__TableModel extends AbstractTableModel {
  /*package*/ List<SNode> rows;
  /*package*/ final ModelAccess modelAccess;
  private Object runnableReturn;
  private TableDataProvider tdp;
  public DTR__TableModel(List<SNode> rows, SRepository repository, TableDataProvider tdp) {
    this.rows = rows;
    this.modelAccess = repository.getModelAccess();
    this.tdp = tdp;
  }

  @Override
  public int getRowCount() {
    return ListSequence.fromList(rows).count();
  }
  @Override
  public int getColumnCount() {
    return this.tdp.getColumnCount();
  }

  private int getButtonIndex() {
    return this.getColumnCount() - 1;
  }

  public void initialize(JTable table) {
    DTR__TableModel.TableButton buttons = new DTR__TableModel.TableButton();
    buttons.addMyHandler();
    table.getColumnModel().getColumn(this.getButtonIndex()).setCellRenderer(buttons);
    table.getColumnModel().getColumn(this.getButtonIndex()).setCellEditor(buttons);
    DTR__TableModel.ValidatedCellRenderer renderer = new DTR__TableModel.ValidatedCellRenderer();
    for (int i = 0; i < this.getButtonIndex(); i++) {
      table.getColumnModel().getColumn(i).setCellRenderer(renderer);
    }
  }
  @Override
  public String getColumnName(int i) {
    String[] columns = tdp.getColumnNames();
    if (i < columns.length) {
      return columns[i];
    }
    return "Invalid column index";
  }
  @Override
  public boolean isCellEditable(int i, int i1) {
    return true;
  }
  @Override
  public Object getValueAt(final int i, final int i1) {
    runnableReturn = "Invalid column index";
    modelAccess.runReadAction(new Runnable() {
      public void run() {
        if (i1 == getButtonIndex()) {
          JButton button = new JButton("Delete");
          button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent p0) {
              modelAccess.executeCommand(new Runnable() {
                public void run() {
                  rows.get(i).delete();
                }
              });
            }
          });
          runnableReturn = button;
        } else {
          runnableReturn = tdp.getColumn(ListSequence.fromList(rows).getElement(i), i1);
        }
      }
    });
    return runnableReturn;
  }
  @Override
  public void setValueAt(final Object object, final int i, final int i1) {
    modelAccess.executeCommand(new Runnable() {
      public void run() {
        tdp.setColumn(ListSequence.fromList(rows).getElement(i), i1, object);
      }
    });
  }

  public Class<?> getColumnClass(int c) {
    if (c == getButtonIndex()) {
      return JButton.class;
    } else {
      return String.class;
    }
  }

  public boolean validateCell(final SNode n, final int i, final Object o) {
    runnableReturn = new Boolean(false);
    modelAccess.executeCommand(new Runnable() {
      public void run() {
        runnableReturn = new Boolean(tdp.validColumnValue(n, i, o));
      }
    });
    return (boolean) runnableReturn;
  }
  public class ValidatedCellRenderer extends DefaultTableCellRenderer {
    @Override
    public JComponent getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int col) {
      // Cells are by default rendered as a JLabel. 
      JLabel l = (JLabel) super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, col);
      // Get the status for the current row. 

      if (!(validateCell(ListSequence.fromList(rows).getElement(row), col, value))) {
        l.setBorder(BorderFactory.createBevelBorder(1));
      }
      // Return the JLabel which renders the cell. 
      return l;
    }
  }

  public interface TableButtonPressedHandler {
    /**
     * Called when the button is pressed.
     * @param row The row in which the button is in the table.
     * @param column The column the button is in in the table.
     */
    void onButtonPress(int row, int column);
  }

  /**
   * An implementation of an embeddable Button component that fits into a JTable
   * <p/>
   * Copyright (C) 2010 by Ilya Volodarsky
   * <p/>
   * Licensed under the Apache License, Version 2.0 (the "License");
   * you may not use this file except in compliance with the License. 
   * You may obtain a copy of the License at
   * <p/>
   * http://www.apache.org/licenses/LICENSE-2.0
   * <p/>
   * Unless required by applicable law or agreed to in writing, software 
   * distributed under the License is distributed on an "AS IS" BASIS,
   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   * See the License for the specific language governing permissions and
   * limitations under the License.
   */
  public class TableButton extends AbstractCellEditor implements TableCellEditor, TableCellRenderer {

    private List<DTR__TableModel.TableButtonPressedHandler> handlers;
    private Map<Integer, JButton> buttons;
    public TableButton() {
      handlers = ListSequence.fromList(new LinkedList<DTR__TableModel.TableButtonPressedHandler>());
      buttons = MapSequence.fromMap(new HashMap<Integer, JButton>());
    }
    /**
     * Add a slide callback handler
     * @param handler
     */
    public void addHandler(DTR__TableModel.TableButtonPressedHandler handler) {
      if (handlers != null) {
        ListSequence.fromList(handlers).addElement(handler);
      }
    }
    /**
     * Remove a slide callback handler
     * @param handler
     */
    public void removeHandler(DTR__TableModel.TableButtonPressedHandler handler) {
      if (handlers != null) {
        ListSequence.fromList(handlers).removeElement(handler);
      }
    }
    /**
     * Removes the component at that row index
     * @param row The row index which was just removed
     */
    public void removeRow(int row) {
      if (MapSequence.fromMap(buttons).containsKey(row)) {
        MapSequence.fromMap(buttons).removeKey(row);
      }
    }
    /**
     * Moves the component at oldRow index to newRow index
     * @param oldRow The old row index
     * @param newRow THe new row index
     */
    public void moveRow(int oldRow, int newRow) {
      if (MapSequence.fromMap(buttons).containsKey(oldRow)) {
        JButton button = MapSequence.fromMap(buttons).removeKey(oldRow);
        MapSequence.fromMap(buttons).put(oldRow, button);
      }
    }
    public JComponent getTableCellRendererComponent(JTable table, Object value, boolean selected, boolean focus, final int row, final int column) {
      JButton button = null;
      if (MapSequence.fromMap(buttons).containsKey(row)) {
        button = MapSequence.fromMap(buttons).get(row);
      } else {
        button = new JButton();
        if (value != null && value instanceof String) {
          button.setText((String) value);
        }
        button.setText("Delete");
        button.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent e) {
            if (handlers != null) {
              for (DTR__TableModel.TableButtonPressedHandler handler : handlers) {
                handler.onButtonPress(row, column);
              }
            }
          }
        });
        MapSequence.fromMap(buttons).put(row, button);
      }
      return button;
    }
    public JComponent getTableCellEditorComponent(JTable table, Object value, boolean selected, int row, int column) {
      JButton button = null;
      if (MapSequence.fromMap(buttons).containsKey(row)) {
        button = MapSequence.fromMap(buttons).get(row);
      } else {
        button = new JButton();
        if (value != null && value instanceof String) {
          button.setText((String) value);
        }
        MapSequence.fromMap(buttons).put(row, button);
      }
      return button;
    }
    public void setButtonText(int row, String text) {
      JButton button = null;
      if (MapSequence.fromMap(buttons).containsKey(row)) {
        button = MapSequence.fromMap(buttons).get(row);
        button.setText(text);
      }
    }
    public Object getCellEditorValue() {
      return null;
    }
    public void dispose() {
      if (handlers != null) {
        ListSequence.fromList(handlers).clear();
      }
    }


    public void addMyHandler() {
      this.addHandler(new DTR__TableModel.TableButtonPressedHandler() {
        /**
         * Called when the button is pressed.
         * @param row The row in which the button is in the table.
         * @param column The column the button is in in the table.
         */
        public void onButtonPress(final int row, final int column) {
          modelAccess.executeCommand(new Runnable() {
            public void run() {
              rows.get(row).delete();
            }
          });
        }
      });
    }
  }


}