*------------------------------------------------------------*;
* EM Version: 15.1;
* SAS Release: 9.04.01M6P110718;
* Host: odaws04-usw2.oda.sas.com;
* Project Path: ~;
* Project Name: DecTree;
* Diagram Id: EMWS1;
* Diagram Name: DecisionTree;
* Generated by: u59406283;
* Date: 12APR2022:21:21:03;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =DecisionTree;
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
%let Ids_data = NEW.DECTREE;
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
put 'libname new "&path";';
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
id= "Tree";
component="DecisionTree";
description= "Decision Tree";
diagramID="_ROOT_";
parentID="";
X=501;
Y=153;
output;
id= "Stat";
component="StatExplore";
description= "StatExplore";
diagramID="_ROOT_";
parentID="";
X=164;
Y=36;
output;
id= "Part";
component="Partition";
description= "Data Partition";
diagramID="_ROOT_";
parentID="";
X=306;
Y=37;
output;
id= "Ids";
component="DataSource";
description= "DECTREE";
diagramID="_ROOT_";
parentID="";
X=21;
Y=33;
output;
id= "CNTRL";
component="ControlPoint";
description= "Control Point";
diagramID="_ROOT_";
parentID="";
X=447;
Y=38;
output;
run;
*------------------------------------------------------------*;
* DataSource Properties;
*------------------------------------------------------------*;
data WORK.dectree_P;
  length   Property                         $ 32
           Value                            $ 200
           ;

Property="Name";
Value="DECTREE";
output;
Property="CreateDate";
Value="1965334694.4";
output;
Property="ModifyDate";
Value="1965334694.4";
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
* USERTRAINCODE File for Tree;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Tree_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for Tree;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Tree_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* CROSSTAB Data Set for Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* EMNOTES File for Stat;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Stat_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
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
* Variable Attributes for Ids;
*------------------------------------------------------------*;
data WORK.Ids_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='Drug';
AttributeName="ROLE";
AttributeValue='TARGET';
Output;
run;
*------------------------------------------------------------*;
* Decmeta Data Set for Ids;
*------------------------------------------------------------*;
data WORK.Ids_Drug_DM;
  length   _TYPE_                           $ 32
           VARIABLE                         $ 32
           LABEL                            $ 256
           LEVEL                            $ 32
           EVENT                            $ 32
           ORDER                            $ 10
           FORMAT                           $ 32
           TYPE                             $ 1
           COST                             $ 32
           USE                              $ 1
           ;

  label    _TYPE_="Type"
           VARIABLE="Variable"
           LABEL="Label"
           LEVEL="Measurement Level"
           EVENT="Target Event"
           ORDER="Order"
           FORMAT="Format"
           TYPE="Type"
           COST="Cost"
           USE="Use"
           ;
_TYPE_="MATRIX";
VARIABLE="";
LABEL="";
LEVEL="PROFIT";
EVENT="";
ORDER="";
FORMAT="";
TYPE="";
COST="";
USE="N";
output;
_TYPE_="TARGET";
VARIABLE="Drug";
LABEL="";
LEVEL="NOMINAL";
EVENT="DRUGY";
ORDER="";
FORMAT="$5.";
TYPE="C";
COST="";
USE="";
output;
_TYPE_="DECISION";
VARIABLE="DECISION1";
LABEL="DRUGY";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DECISION";
VARIABLE="DECISION2";
LABEL="DRUGX";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DECISION";
VARIABLE="DECISION3";
LABEL="DRUGC";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DECISION";
VARIABLE="DECISION4";
LABEL="DRUGB";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DECISION";
VARIABLE="DECISION5";
LABEL="DRUGA";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DATAPRIOR";
VARIABLE="DATAPRIOR";
LABEL="Data Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="TRAINPRIOR";
VARIABLE="TRAINPRIOR";
LABEL="Training Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="DECPRIOR";
VARIABLE="DECPRIOR";
LABEL="Decision Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="PREDICTED";
VARIABLE="P_DrugdrugY";
LABEL="Predicted: Drug=drugY";
LEVEL="DRUGY";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_DrugdrugY";
LABEL="Residual: Drug=drugY";
LEVEL="DRUGY";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="PREDICTED";
VARIABLE="P_DrugdrugX";
LABEL="Predicted: Drug=drugX";
LEVEL="DRUGX";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_DrugdrugX";
LABEL="Residual: Drug=drugX";
LEVEL="DRUGX";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="PREDICTED";
VARIABLE="P_DrugdrugC";
LABEL="Predicted: Drug=drugC";
LEVEL="DRUGC";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_DrugdrugC";
LABEL="Residual: Drug=drugC";
LEVEL="DRUGC";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="PREDICTED";
VARIABLE="P_DrugdrugB";
LABEL="Predicted: Drug=drugB";
LEVEL="DRUGB";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_DrugdrugB";
LABEL="Residual: Drug=drugB";
LEVEL="DRUGB";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="PREDICTED";
VARIABLE="P_DrugdrugA";
LABEL="Predicted: Drug=drugA";
LEVEL="DRUGA";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_DrugdrugA";
LABEL="Residual: Drug=drugA";
LEVEL="DRUGA";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="FROM";
VARIABLE="F_Drug";
LABEL="From: Drug";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
_TYPE_="INTO";
VARIABLE="I_Drug";
LABEL="Into: Drug";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
;
run;
*------------------------------------------------------------*;
* Decdata Data Set for Ids;
*------------------------------------------------------------*;
data WORK.Ids_Drug_DD;
  length   Drug                             $ 32
           COUNT                              8
           DATAPRIOR                          8
           TRAINPRIOR                         8
           DECPRIOR                           8
           DECISION1                          8
           DECISION2                          8
           DECISION3                          8
           DECISION4                          8
           DECISION5                          8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="DRUGY"
           DECISION2="DRUGX"
           DECISION3="DRUGC"
           DECISION4="DRUGB"
           DECISION5="DRUGA"
           ;
  format   COUNT 10.
           ;
Drug="DRUGY";
COUNT=91;
DATAPRIOR=0.455;
TRAINPRIOR=0.455;
DECPRIOR=.;
DECISION1=1;
DECISION2=0;
DECISION3=0;
DECISION4=0;
DECISION5=0;
output;
Drug="DRUGX";
COUNT=54;
DATAPRIOR=0.27;
TRAINPRIOR=0.27;
DECPRIOR=.;
DECISION1=0;
DECISION2=1;
DECISION3=0;
DECISION4=0;
DECISION5=0;
output;
Drug="DRUGC";
COUNT=16;
DATAPRIOR=0.08;
TRAINPRIOR=0.08;
DECPRIOR=.;
DECISION1=0;
DECISION2=0;
DECISION3=1;
DECISION4=0;
DECISION5=0;
output;
Drug="DRUGB";
COUNT=16;
DATAPRIOR=0.08;
TRAINPRIOR=0.08;
DECPRIOR=.;
DECISION1=0;
DECISION2=0;
DECISION3=0;
DECISION4=1;
DECISION5=0;
output;
Drug="DRUGA";
COUNT=23;
DATAPRIOR=0.115;
TRAINPRIOR=0.115;
DECPRIOR=.;
DECISION1=0;
DECISION2=0;
DECISION3=0;
DECISION4=0;
DECISION5=1;
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
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Tree";
property="Location";
value= "CATALOG";
output;
id= "Tree";
property="Catalog";
value= "SASHELP.EMMODL.TREE.SOURCE";
output;
id= "Tree";
property="ToolType";
value= "MODEL";
output;
id= "Tree";
property="TrainMode";
value= "BATCH";
output;
id= "Tree";
property="ImportModel";
value= "N";
output;
id= "Tree";
property="Freeze";
value= "N";
output;
id= "Tree";
property="UseMultipleTarget";
value= "N";
output;
id= "Tree";
property="Precision";
value= "4";
output;
id= "Tree";
property="IntervalCriterion";
value= "PROBF";
output;
id= "Tree";
property="NominalCriterion";
value= "PROBCHISQ";
output;
id= "Tree";
property="OrdinalCriterion";
value= "ENTROPY";
output;
id= "Tree";
property="SigLevel";
value= "0.2";
output;
id= "Tree";
property="Splitsize";
value= ".";
output;
id= "Tree";
property="LeafSize";
value= "5";
output;
id= "Tree";
property="MinCatSize";
value= "5";
output;
id= "Tree";
property="Maxbranch";
value= "2";
output;
id= "Tree";
property="Maxdepth";
value= "6";
output;
id= "Tree";
property="Nrules";
value= "5";
output;
id= "Tree";
property="Nsurrs";
value= "0";
output;
id= "Tree";
property="MissingValue";
value= "USEINSEARCH";
output;
id= "Tree";
property="UseVarOnce";
value= "N";
output;
id= "Tree";
property="SplitPrecision";
value= "4";
output;
id= "Tree";
property="Subtree";
value= "ASSESSMENT";
output;
id= "Tree";
property="NSubtree";
value= "1";
output;
id= "Tree";
property="AssessMeasure";
value= "PROFIT/LOSS";
output;
id= "Tree";
property="AssessPercentage";
value= "0.25";
output;
id= "Tree";
property="NodeSample";
value= "20000";
output;
id= "Tree";
property="Exhaustive";
value= "5000";
output;
id= "Tree";
property="Kass";
value= "Y";
output;
id= "Tree";
property="KassApply";
value= "BEFORE";
output;
id= "Tree";
property="Depth";
value= "Y";
output;
id= "Tree";
property="Inputs";
value= "N";
output;
id= "Tree";
property="NumInputs";
value= "1";
output;
id= "Tree";
property="VarSelection";
value= "Y";
output;
id= "Tree";
property="Leafid";
value= "Y";
output;
id= "Tree";
property="NodeRole";
value= "SEGMENT";
output;
id= "Tree";
property="Performance";
value= "DISK";
output;
id= "Tree";
property="CV";
value= "N";
output;
id= "Tree";
property="CVNIter";
value= "10";
output;
id= "Tree";
property="CVRepeat";
value= "1";
output;
id= "Tree";
property="CVSeed";
value= "12345";
output;
id= "Tree";
property="ObsImportance";
value= "N";
output;
id= "Tree";
property="NumSingleImp";
value= "5";
output;
id= "Tree";
property="UseDecision";
value= "N";
output;
id= "Tree";
property="UsePriors";
value= "N";
output;
id= "Tree";
property="ClassColorBy";
value= "PERCENTCORRECT";
output;
id= "Tree";
property="IntColorBy";
value= "AVG";
output;
id= "Tree";
property="ShowNodeId";
value= "Y";
output;
id= "Tree";
property="ShowValid";
value= "Y";
output;
id= "Tree";
property="Pred";
value= "N";
output;
id= "Tree";
property="Target";
value= "ALL";
output;
id= "Tree";
property="Count";
value= "Y";
output;
id= "Tree";
property="ProfitLoss";
value= "NONE";
output;
id= "Tree";
property="PercentCorrect";
value= "N";
output;
id= "Tree";
property="AVG";
value= "Y";
output;
id= "Tree";
property="RASE";
value= "N";
output;
id= "Tree";
property="CreateSample";
value= "DEFAULT";
output;
id= "Tree";
property="SampleMethod";
value= "RANDOM";
output;
id= "Tree";
property="SampleSize";
value= "10000";
output;
id= "Tree";
property="SampleSeed";
value= "12345";
output;
id= "Tree";
property="ForceRun";
value= "N";
output;
id= "Tree";
property="RunAction";
value= "Train";
output;
id= "Tree";
property="Component";
value= "DecisionTree";
output;
id= "Tree";
property="Criterion";
value= "DEFAULT";
output;
id= "Tree";
property="Dummy";
value= "N";
output;
id= "Tree";
property="Predict";
value= "Y";
output;
id= "Tree";
property="ImportedTreeData";
value= "";
output;
id= "Tree";
property="ToolPrefix";
value= "Tree";
output;
id= "Tree";
property="EM_FILE_USERTRAINCODE";
value= "Tree_USERTRAINCODE.sas";
output;
id= "Tree";
property="EM_FILE_EMNOTES";
value= "Tree_EMNOTES.txt";
output;
id= "Stat";
property="BySegment";
value= "N";
output;
id= "Stat";
property="Correlation";
value= "Y";
output;
id= "Stat";
property="Spearman";
value= "N";
output;
id= "Stat";
property="Pearson";
value= "Y";
output;
id= "Stat";
property="ChiSquare";
value= "Y";
output;
id= "Stat";
property="ChiSquareInterval";
value= "N";
output;
id= "Stat";
property="ChiSquareIntervalNBins";
value= "5";
output;
id= "Stat";
property="MaximumVars";
value= "1000";
output;
id= "Stat";
property="HideVariable";
value= "Y";
output;
id= "Stat";
property="DropRejected";
value= "Y";
output;
id= "Stat";
property="UseValidate";
value= "N";
output;
id= "Stat";
property="UseTest";
value= "N";
output;
id= "Stat";
property="UseScore";
value= "N";
output;
id= "Stat";
property="NObs";
value= "100000";
output;
id= "Stat";
property="IntervalDistribution";
value= "Y";
output;
id= "Stat";
property="ClassDistribution";
value= "Y";
output;
id= "Stat";
property="LevelSummary";
value= "Y";
output;
id= "Stat";
property="ForceRun";
value= "N";
output;
id= "Stat";
property="RunAction";
value= "Train";
output;
id= "Stat";
property="Component";
value= "StatExplore";
output;
id= "Stat";
property="EM_FILE_EMNOTES";
value= "Stat_EMNOTES.txt";
output;
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
id= "Ids";
property="DataSource";
value= "dectree";
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
value= "6";
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
value= "dectree";
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
value= "1965334694.4";
output;
id= "Ids";
property="DsModifiedBy";
value= "u59406283";
output;
id= "Ids";
property="DsModifyDate";
value= "1965334694.4";
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
property="EM_DECMETA_Drug";
value= "WORK.Ids_Drug_DM";
output;
id= "Ids";
property="EM_DECDATA_Drug";
value= "WORK.Ids_Drug_DD";
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
from="CNTRL";
to="Tree";
output;
from="Part";
to="CNTRL";
output;
from="Stat";
to="Part";
output;
from="Ids";
to="Stat";
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
id="Tree";
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
