*------------------------------------------------------------*;
* EM Version: 15.1;
* SAS Release: 9.04.01M6P110718;
* Host: odaws03-usw2.oda.sas.com;
* Project Path: ~;
* Project Name: KMC;
* Diagram Id: EMWS2;
* Diagram Name: KMC;
* Generated by: u59406283;
* Date: 12APR2022:21:25:08;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =KMC;
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
%let Ids_data = EXAMPLE.CLUSTERING;
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
id= "Ids";
component="DataSource";
description= "CLUSTERING";
diagramID="_ROOT_";
parentID="";
X=47;
Y=38;
output;
id= "Clus";
component="Cluster";
description= "Cluster";
diagramID="_ROOT_";
parentID="";
X=216;
Y=61;
output;
run;
*------------------------------------------------------------*;
* DataSource Properties;
*------------------------------------------------------------*;
data WORK.clustering_P;
  length   Property                         $ 32
           Value                            $ 200
           ;

Property="Name";
Value="CLUSTERING";
output;
Property="CreateDate";
Value="1965338895.9";
output;
Property="ModifyDate";
Value="1965338896";
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
* EMNOTES File for Clus;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Clus_EMNOTES.txt";
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
id= "Ids";
property="DataSource";
value= "clustering";
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
value= "5";
output;
id= "Ids";
property="NObs";
value= "200";
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
value= "clustering";
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
value= "1965338895.9";
output;
id= "Ids";
property="DsModifiedBy";
value= "u59406283";
output;
id= "Ids";
property="DsModifyDate";
value= "1965338896";
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
property="EM_FILE_EMNOTES";
value= "Ids_EMNOTES.txt";
output;
id= "Clus";
property="Bins";
value= "100";
output;
id= "Clus";
property="Clusvar";
value= "_SEGMENT_";
output;
id= "Clus";
property="ClusvarLabel";
value= "Segment Variable";
output;
id= "Clus";
property="ClusvarRole";
value= "SEGMENT";
output;
id= "Clus";
property="MaxC";
value= "10";
output;
id= "Clus";
property="NominalEncoding";
value= "GLM";
output;
id= "Clus";
property="OrdinalEncoding";
value= "RANK";
output;
id= "Clus";
property="MissingInterval";
value= "DEFAULT";
output;
id= "Clus";
property="MissingNominal";
value= "DEFAULT";
output;
id= "Clus";
property="MissingOrdinal";
value= "DEFAULT";
output;
id= "Clus";
property="ImputationMethod";
value= "NONE";
output;
id= "Clus";
property="HideVariable";
value= "Y";
output;
id= "Clus";
property="TrainDefaults";
value= "Y";
output;
id= "Clus";
property="Learn";
value= ".";
output;
id= "Clus";
property="LearnInitial";
value= "0.5";
output;
id= "Clus";
property="LearnFinal";
value= "0.02";
output;
id= "Clus";
property="LearnSteps";
value= "1000";
output;
id= "Clus";
property="MaxIter";
value= "10";
output;
id= "Clus";
property="MaxSteps";
value= "1200";
output;
id= "Clus";
property="XConv";
value= "0.0001";
output;
id= "Clus";
property="Initial";
value= "DEFAULT";
output;
id= "Clus";
property="Drift";
value= "N";
output;
id= "Clus";
property="Radius";
value= "0";
output;
id= "Clus";
property="Stdize";
value= "STD";
output;
id= "Clus";
property="Summary";
value= "N";
output;
id= "Clus";
property="TreeProfile";
value= "Y";
output;
id= "Clus";
property="ClusterGraphs";
value= "Y";
output;
id= "Clus";
property="NumberClusterMethod";
value= "AUTOMATIC";
output;
id= "Clus";
property="DistancePlot";
value= "Y";
output;
id= "Clus";
property="FinalMaxNum";
value= "20";
output;
id= "Clus";
property="AutomaticMaxNum";
value= "50";
output;
id= "Clus";
property="AutomaticMinNum";
value= "2";
output;
id= "Clus";
property="AutomaticMethod";
value= "WARD";
output;
id= "Clus";
property="CCCCutOff";
value= "3";
output;
id= "Clus";
property="ForceRun";
value= "N";
output;
id= "Clus";
property="RunAction";
value= "Train";
output;
id= "Clus";
property="Component";
value= "Cluster";
output;
id= "Clus";
property="EM_FILE_EMNOTES";
value= "Clus_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Ids";
to="Clus";
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
id="Clus";
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
