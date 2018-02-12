<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:7622636f-5db6-49ba-9b56-f76895f4f2a3(TestSolution)">
  <persistence version="9" />
  <languages>
    <use id="d3ca43b8-01a7-4083-ba4e-9769ab8f1643" name="Timekeeping" version="0" />
  </languages>
  <imports />
  <registry>
    <language id="d3ca43b8-01a7-4083-ba4e-9769ab8f1643" name="Timekeeping">
      <concept id="4437453958741722872" name="Timekeeping.structure.DailyTimeRecord" flags="ng" index="1opCo_">
        <property id="4437453958741722875" name="day" index="1opCoA" />
        <child id="4437453958741722883" name="intervals" index="1opCvu" />
      </concept>
      <concept id="4437453958741722773" name="Timekeeping.structure.MonthlyTimeRecord" flags="ng" index="1opCp8">
        <property id="4437453958741722869" name="year" index="1opCoC" />
        <property id="4437453958741722774" name="month" index="1opCpb" />
        <child id="4437453958741722879" name="days" index="1opCoy" />
      </concept>
      <concept id="4437453958741722881" name="Timekeeping.structure.WorkInterval" flags="ng" index="1opCvs">
        <property id="4437453958741722940" name="description" index="1opCvx" />
        <property id="4437453958741722937" name="end" index="1opCv$" />
        <property id="4437453958741722935" name="begin" index="1opCvE" />
      </concept>
    </language>
  </registry>
  <node concept="1opCp8" id="3Ql0dP_XdMx">
    <property role="1opCoC" value="2017" />
    <property role="1opCpb" value="11" />
    <node concept="1opCo_" id="3Ql0dP_XdMy" role="1opCoy">
      <property role="1opCoA" value="17" />
      <node concept="1opCvs" id="3CcsRtNsWTr" role="1opCvu">
        <property role="1opCvx" value="blablabla" />
        <property role="1opCvE" value="foo" />
        <property role="1opCv$" value="16:00" />
      </node>
      <node concept="1opCvs" id="52Q4vtUxwra" role="1opCvu" />
      <node concept="1opCvs" id="1rRG9EyPqpl" role="1opCvu" />
      <node concept="1opCvs" id="3JNW8yYehPm" role="1opCvu" />
    </node>
    <node concept="1opCo_" id="3JNW8yYehPL" role="1opCoy">
      <property role="1opCoA" value="18" />
      <node concept="1opCvs" id="3JNW8yYehPS" role="1opCvu" />
      <node concept="1opCvs" id="3JNW8yYehPU" role="1opCvu" />
      <node concept="1opCvs" id="2j$QpAB2a2E" role="1opCvu" />
      <node concept="1opCvs" id="2j$QpAB2a2I" role="1opCvu" />
    </node>
    <node concept="1opCo_" id="2j$QpAB2a2N" role="1opCoy">
      <property role="1opCoA" value="20" />
      <node concept="1opCvs" id="2j$QpAB2a2Z" role="1opCvu" />
      <node concept="1opCvs" id="2j$QpAB2a31" role="1opCvu" />
      <node concept="1opCvs" id="2j$QpAB2a34" role="1opCvu" />
      <node concept="1opCvs" id="2j$QpAB2a38" role="1opCvu" />
    </node>
  </node>
</model>

