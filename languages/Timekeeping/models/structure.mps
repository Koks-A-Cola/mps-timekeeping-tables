<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:069c894f-154c-4238-a338-f810181c3225(Timekeeping.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="6" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="dxuu" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:javax.swing(JDK/)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1082978164219" name="jetbrains.mps.lang.structure.structure.EnumerationDataTypeDeclaration" flags="ng" index="AxPO7">
        <reference id="1083171729157" name="memberDataType" index="M4eZT" />
        <child id="1083172003582" name="member" index="M5hS2" />
      </concept>
      <concept id="1082978499127" name="jetbrains.mps.lang.structure.structure.ConstrainedDataTypeDeclaration" flags="ng" index="Az7Fb">
        <property id="1083066089218" name="constraint" index="FLfZY" />
      </concept>
      <concept id="1083171877298" name="jetbrains.mps.lang.structure.structure.EnumerationMemberDeclaration" flags="ig" index="M4N5e">
        <property id="1083923523172" name="externalValue" index="1uS6qo" />
        <property id="1083923523171" name="internalValue" index="1uS6qv" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="3Ql0dP_WSql">
    <property role="EcuMT" value="4437453958741722773" />
    <property role="TrG5h" value="MonthlyTimeRecord" />
    <property role="34LRSv" value="month" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="3Ql0dP_WSqm" role="1TKVEl">
      <property role="IQ2nx" value="4437453958741722774" />
      <property role="TrG5h" value="month" />
      <ref role="AX2Wp" node="3Ql0dP_WSqr" resolve="Month" />
    </node>
    <node concept="1TJgyi" id="3Ql0dP_WSrP" role="1TKVEl">
      <property role="IQ2nx" value="4437453958741722869" />
      <property role="TrG5h" value="year" />
      <ref role="AX2Wp" node="3Ql0dP_WSqq" resolve="Year" />
    </node>
    <node concept="1TJgyj" id="3Ql0dP_WSrZ" role="1TKVEi">
      <property role="IQ2ns" value="4437453958741722879" />
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="days" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="3Ql0dP_WSrS" resolve="DailyTimeRecord" />
    </node>
  </node>
  <node concept="Az7Fb" id="3Ql0dP_WSqq">
    <property role="TrG5h" value="Year" />
    <property role="FLfZY" value="^(19|20)\\d{2}$" />
  </node>
  <node concept="AxPO7" id="3Ql0dP_WSqr">
    <property role="TrG5h" value="Month" />
    <ref role="M4eZT" to="tpck:fKAOsGN" resolve="string" />
    <node concept="M4N5e" id="3Ql0dP_WSqs" role="M5hS2">
      <property role="1uS6qv" value="1" />
      <property role="1uS6qo" value="January" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSqt" role="M5hS2">
      <property role="1uS6qv" value="2" />
      <property role="1uS6qo" value="February" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSqw" role="M5hS2">
      <property role="1uS6qv" value="3" />
      <property role="1uS6qo" value="March" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSq$" role="M5hS2">
      <property role="1uS6qv" value="4" />
      <property role="1uS6qo" value="April" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSqD" role="M5hS2">
      <property role="1uS6qv" value="5" />
      <property role="1uS6qo" value="May" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSqJ" role="M5hS2">
      <property role="1uS6qv" value="6" />
      <property role="1uS6qo" value="June" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSqQ" role="M5hS2">
      <property role="1uS6qo" value="Jule" />
      <property role="1uS6qv" value="7" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSqY" role="M5hS2">
      <property role="1uS6qo" value="August" />
      <property role="1uS6qv" value="8" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSr7" role="M5hS2">
      <property role="1uS6qo" value="September" />
      <property role="1uS6qv" value="9" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSrh" role="M5hS2">
      <property role="1uS6qo" value="October" />
      <property role="1uS6qv" value="10" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSrs" role="M5hS2">
      <property role="1uS6qo" value="November" />
      <property role="1uS6qv" value="11" />
    </node>
    <node concept="M4N5e" id="3Ql0dP_WSrC" role="M5hS2">
      <property role="1uS6qo" value="December" />
      <property role="1uS6qv" value="12" />
    </node>
  </node>
  <node concept="1TIwiD" id="3Ql0dP_WSrS">
    <property role="EcuMT" value="4437453958741722872" />
    <property role="TrG5h" value="DailyTimeRecord" />
    <property role="34LRSv" value="day" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="3Ql0dP_WSrV" role="1TKVEl">
      <property role="IQ2nx" value="4437453958741722875" />
      <property role="TrG5h" value="day" />
      <ref role="AX2Wp" node="3Ql0dP_WSrU" resolve="Day" />
    </node>
    <node concept="1TJgyj" id="3Ql0dP_WSs3" role="1TKVEi">
      <property role="IQ2ns" value="4437453958741722883" />
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="intervals" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="3Ql0dP_WSs1" resolve="WorkInterval" />
    </node>
  </node>
  <node concept="Az7Fb" id="3Ql0dP_WSrU">
    <property role="TrG5h" value="Day" />
    <property role="FLfZY" value="^(31|30|[012]\\d|\\d)$" />
  </node>
  <node concept="1TIwiD" id="3Ql0dP_WSs1">
    <property role="EcuMT" value="4437453958741722881" />
    <property role="TrG5h" value="WorkInterval" />
    <property role="34LRSv" value="interval" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="3Ql0dP_WSsR" role="1TKVEl">
      <property role="IQ2nx" value="4437453958741722935" />
      <property role="TrG5h" value="begin" />
      <ref role="AX2Wp" node="3Ql0dP_WSs2" resolve="Time" />
    </node>
    <node concept="1TJgyi" id="3Ql0dP_WSsT" role="1TKVEl">
      <property role="IQ2nx" value="4437453958741722937" />
      <property role="TrG5h" value="end" />
      <ref role="AX2Wp" node="3Ql0dP_WSs2" resolve="Time" />
    </node>
    <node concept="1TJgyi" id="3Ql0dP_WSsW" role="1TKVEl">
      <property role="IQ2nx" value="4437453958741722940" />
      <property role="TrG5h" value="description" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="Az7Fb" id="3Ql0dP_WSs2">
    <property role="TrG5h" value="Time" />
    <property role="FLfZY" value="^([01]?\\d|2[0-3]):([0-5]?\\d)$" />
  </node>
</model>

