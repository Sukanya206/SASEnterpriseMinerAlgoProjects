*------------------------------------------------------------*;
* EM Version: 15.1;
* SAS Release: 9.04.01M6P110718;
* Host: odaws04-usw2.oda.sas.com;
* Project Path: ~;
* Project Name: KNN;
* Diagram Id: EMWS1;
* Diagram Name: KNN;
* Generated by: u59406283;
* Date: 12APR2022:21:22:05;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =KNN;
%let EM_SUMMARY =WORK.SUMMARY;
%let EM_NUMTASKS =SINGLE;
%let EM_EDITMODE =R;
%let EM_DEBUGVAL =;
%let EM_ACTION =run;
*------------------------------------------------------------*;
%macro em_usedatatable;
%if ^%symexist(EM_USEDATATABLE) %then %do;
%let EM_USEDATATABLE = Y;
%end;
%if "&EM_USEDATATABLE" ne "N" %then %do;
%global Ids_data Ids_newdata;
*------------------------------------------------------------*;
* Data Tables;
*------------------------------------------------------------*;
%let Ids_data = EXAMPLE.KNN;
%let Ids_newdata =;
*------------------------------------------------------------*;
%end;
%global Ids_source;
%if "&Ids_newdata" ne "" %then %do;
%let Ids_source = USERTABLE;
%end;
%else %do;
%let Ids_source = DATASOURCE;
%end;
%mend em_usedatatable;
%em_usedatatable;
*------------------------------------------------------------*;
* Run Startup and Property Code;
*------------------------------------------------------------*;
%macro em_runstartupCode;
%if ^%symexist(EM_RUNSTARTUP) %then %do;
%let EM_RUNSTARTUP = Y;
%end;
%if "&EM_RUNSTARTUP" ne "N" %then %do;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"RUNSTARTUP.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put '*------------------------------------------------------------* ;';
put '* Project Startup Code';
put '*------------------------------------------------------------* ;';
put '%let path=/home/u59406283/Aproject;';
put ' ';
put 'libname example "&path";';
put ' ';
put 'run;';
run;
%end;
%mend em_runstartupCode;
%em_runstartupCode;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $200;
property= 'PROJECTLOCATION';
value= "&EM_PROJECT";
output;
property= 'PROJECTNAME';
value= "&EM_PROJECTNAME";
output;
property= 'WORKSPACENAME';
value= "&EM_WSNAME";
output;
property= 'WORKSPACEDESCRIPTION';
value= "&EM_WSDESCRIPTION";
output;
property= 'SUMMARYDATASET';
value= "&EM_SUMMARY";
output;
property= 'NUMTASKS';
value= "&EM_NUMTASKS";
output;
property= 'EDITMODE';
value= "&EM_EDITMODE";
output;
property= 'DEBUG';
value= "&EM_DEBUGVAL";
output;
run;
*------------------------------------------------------------*;
* Create nodes data set;
*------------------------------------------------------------*;
data nodes;
length id $12 component $32 description $64 X 8 Y 8 diagramID $32 parentID $32;
id= "Part";
component="Partition";
description= "Data Partition";
diagramID="_ROOT_";
parentID="";
X=171;
Y=38;
output;
id= "MBR";
component="MBR";
description= "MBR";
diagramID="_ROOT_";
parentID="";
X=327;
Y=56;
output;
id= "Ids";
component="DataSource";
description= "KNN";
diagramID="_ROOT_";
parentID="";
X=33;
Y=41;
output;
run;
*------------------------------------------------------------*;
* DataSource Properties;
*------------------------------------------------------------*;
data WORK.knn_P;
  length   Property                         $ 32
           Value                            $ 200
           ;

Property="Name";
Value="KNN";
output;
Property="CreateDate";
Value="1965339921.7";
output;
Property="ModifyDate";
Value="1965339921.8";
output;
Property="CreatedBy";
Value="u59406283";
output;
Property="ModifiedBy";
Value="u59406283";
output;
Property="SampleSizeType";
Value="";
output;
Property="SampleSize";
Value="";
output;
;
run;
*------------------------------------------------------------*;
* EMNOTES File for Part;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Part_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for MBR;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"MBR_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for Ids;
*------------------------------------------------------------*;
data WORK.Ids_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='Outcome';
AttributeName="ROLE";
AttributeValue='TARGET';
Output;
run;
*------------------------------------------------------------*;
* EMNOTES File for Ids;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Ids_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Part";
property="Method";
value= "DEFAULT";
output;
id= "Part";
property="TrainPct";
value= "40";
output;
id= "Part";
property="ValidatePct";
value= "30";
output;
id= "Part";
property="TestPct";
value= "30";
output;
id= "Part";
property="RandomSeed";
value= "12345";
output;
id= "Part";
property="OutputType";
value= "DATA";
output;
id= "Part";
property="IntervalDistribution";
value= "Y";
output;
id= "Part";
property="ClassDistribution";
value= "Y";
output;
id= "Part";
property="ForceRun";
value= "N";
output;
id= "Part";
property="RunAction";
value= "Train";
output;
id= "Part";
property="Component";
value= "Partition";
output;
id= "Part";
property="EM_FILE_EMNOTES";
value= "Part_EMNOTES.txt";
output;
id= "MBR";
property="NumberOfNeighbors";
value= "5";
output;
id= "MBR";
property="Epsilon";
value= "0";
output;
id= "MBR";
property="Buckets";
value= "8";
output;
id= "MBR";
property="Method";
value= "SCAN";
output;
id= "MBR";
property="Weighted";
value= "Y";
output;
id= "MBR";
property="ShowNodes";
value= "N";
output;
id= "MBR";
property="Neighbors";
value= "Y";
output;
id= "MBR";
property="ForceRun";
value= "N";
output;
id= "MBR";
property="RunAction";
value= "Train";
output;
id= "MBR";
property="Component";
value= "MBR";
output;
id= "MBR";
property="EM_FILE_EMNOTES";
value= "MBR_EMNOTES.txt";
output;
id= "Ids";
property="DataSource";
value= "knn";
output;
id= "Ids";
property="Scope";
value= "LOCAL";
output;
id= "Ids";
property="Role";
value= "RAW";
output;
%let Ids_lib = %scan(&Ids_data, 1, .);
id= "Ids";
property="Library";
value= "&Ids_lib";
output;
%let Ids_member = %scan(&Ids_data, 2, .);
id= "Ids";
property="Table";
value= "&Ids_member";
output;
id= "Ids";
property="NCols";
value= "9";
output;
id= "Ids";
property="NObs";
value= "768";
output;
id= "Ids";
property="NBytes";
value= "132096";
output;
id= "Ids";
property="Segment";
value= "";
output;
id= "Ids";
property="DataSourceRole";
value= "RAW";
output;
id= "Ids";
property="OutputType";
value= "VIEW";
output;
id= "Ids";
property="ForceRun";
value= "N";
output;
id= "Ids";
property="ComputeStatistics";
value= "N";
output;
id= "Ids";
property="DataSelection";
value= "&Ids_source";
output;
id= "Ids";
property="NewTable";
value= "&Ids_newdata";
output;
id= "Ids";
property="MetaAdvisor";
value= "BASIC";
output;
id= "Ids";
property="ApplyIntervalLevelLowerLimit";
value= "Y";
output;
id= "Ids";
property="IntervalLowerLimit";
value= "20";
output;
id= "Ids";
property="ApplyMaxPercentMissing";
value= "Y";
output;
id= "Ids";
property="MaxPercentMissing";
value= "50";
output;
id= "Ids";
property="ApplyMaxClassLevels";
value= "Y";
output;
id= "Ids";
property="MaxClassLevels";
value= "20";
output;
id= "Ids";
property="IdentifyEmptyColumns";
value= "Y";
output;
id= "Ids";
property="VariableValidation";
value= "STRICT";
output;
id= "Ids";
property="NewVariableRole";
value= "REJECT";
output;
id= "Ids";
property="DropMapVariables";
value= "Y";
output;
id= "Ids";
property="DsId";
value= "knn";
output;
id= "Ids";
property="DsSampleName";
value= "";
output;
id= "Ids";
property="DsSampleSizeType";
value= "";
output;
id= "Ids";
property="DsSampleSize";
value= "";
output;
id= "Ids";
property="DsCreatedBy";
value= "u59406283";
output;
id= "Ids";
property="DsCreateDate";
value= "1965339921.7";
output;
id= "Ids";
property="DsModifiedBy";
value= "u59406283";
output;
id= "Ids";
property="DsModifyDate";
value= "1965339921.8";
output;
id= "Ids";
property="DsScope";
value= "LOCAL";
output;
id= "Ids";
property="Sample";
value= "D";
output;
id= "Ids";
property="SampleSizeType";
value= "PERCENT";
output;
id= "Ids";
property="SampleSizePercent";
value= "20";
output;
id= "Ids";
property="SampleSizeObs";
value= "10000";
output;
id= "Ids";
property="DBPassThrough";
value= "Y";
output;
id= "Ids";
property="RunAction";
value= "Train";
output;
id= "Ids";
property="Component";
value= "DataSource";
output;
id= "Ids";
property="Description";
value= "";
output;
id= "Ids";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.Ids_VariableAttribute";
output;
id= "Ids";
property="EM_FILE_EMNOTES";
value= "Ids_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Part";
to="MBR";
output;
from="Ids";
to="Part";
output;
run;
*------------------------------------------------------------*;
* Create actions to run data set;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="MBR";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, nodes=nodes, connect=connect, datasources=datasources, nodeprops=nodeprops, action=actions);
