/*-------------------------
 |   Assignment 2: No loops
 |   Hye-Chung Kum (2/12/2014)   
 |   Hospital leve Tx quarterly discharge data
 |   http://www.dshs.state.tx.us/thcic/hospitals/Inpatientpudf.shtm
 |   REQUIRED assignment: 3.1, 3.2, 3.3;
 |   Optional Advanced Excercise: 3.4-3.8;
 |-------------------------*/ 

* Make sure to change the libname to point to the correct data folder that has the data;
libname data 'data/';

* P1.5 label values for at least 3 variables;
proc format;
    value bool
        0='No' 1='Yes';
    value miss
        .='Missing'
        low-<0='-'
        0='0'
        0<-high='+';

* take a quick look at the input data set;    
proc print data=data.ipstatw(obs=10);    

* P1.1 Subset vars - create a new data subset named myipstatw;
* Dropped Hospital name to protect identity of hospital;    
* P1.3 rename at least 3 variables ;
* P1.9 Save out your new data permanently;
data data.myipstatw;
set data.ipstatw(drop=hospname rename=(THCIC_ID=hid hospcity=hcity county=cntyname));

* P1.2 subset obs;
* Only look at hospitals in the major cities;
where cntyname in ('Bexar', 'Dallas', 'Travis', 'Harris');

* P1.4 label at least 3 variables ;
* Note: label statement can not use arrays;
label
   hid = 'Texas Health Care Information Collection ID'
   hcity = 'Hospital City'
   cntyname = 'Hospital County'
   dc20101 = 'Inpatient Discharge'
   dc20102 = 'Inpatient Discharge'
   dc20103 = 'Inpatient Discharge'
   dc20104 = 'Inpatient Discharge'
   dc20111 = 'Inpatient Discharge'
   dc20112 = 'Inpatient Discharge'
   dc20113 = 'Inpatient Discharge'
   dc20114 = 'Inpatient Discharge'
   dc20121 = 'Inpatient Discharge'
   dc20122 = 'Inpatient Discharge'
   dc20123 = 'Inpatient Discharge'
   dc20124 = 'Inpatient Discharge'
  ;

* ASSIGNMENT 3.3: Find the first time period (YYYYQ) each hospital had data using arrays & condtional loops;
* Do this LAST!!! Do 3.1 & 3.2 below first, then do this one;
* Why MUST this code be here (i.e. located here)?;
if dc20101~=. then first=20101;
else if dc20102~=. then first=20102;
else if dc20103~=. then first=20103;
else if dc20104~=. then first=20104;
else if dc20111~=. then first=20111;
else if dc20112~=. then first=20112;
else if dc20113~=. then first=20113;
else if dc20114~=. then first=20114;
else if dc20121~=. then first=20121;
else if dc20122~=. then first=20122;
else if dc20123~=. then first=20123;
else if dc20124~=. then first=20124;

* OPTIONAL ADVANCED 3.4: Find the last time period (YYYYQ) each hospital had data;

* P1.7 Recode at least 3 variables (use your imagination, if not essential to your analysis);
* ASSIGNMENT 3.1: recode the discharge variables using arrays and counting loop;
if dc20101=. then dc20101=0;
if dc20102=. then dc20102=0;
if dc20103=. then dc20103=0;
if dc20104=. then dc20104=0;
if dc20111=. then dc20111=0;
if dc20112=. then dc20112=0;
if dc20113=. then dc20113=0;
if dc20114=. then dc20114=0;
if dc20121=. then dc20121=0;
if dc20122=. then dc20122=0;
if dc20123=. then dc20123=0;
if dc20124=. then dc20124=0;

* P1.8 Construct at least 3 new variables (use your imagination, if not essential to your analysis);
* Annual discharge;
* ASSIGNMENT 3.2: Create annual discharge variables using arrays and counting loop;
* OPTIONAL ADVANCED 3.5 Try using a two dimensional array with a nested do loop;
* OPTIONAL ADVANCED 3.6: If two dimensional arrays are confusing, setup multiple arrays and use a nested do loop;
tot2010 = dc20101+dc20102+dc20103+dc20104;
tot2011 = dc20111+dc20112+dc20113+dc20114;
tot2012 = dc20121+dc20122+dc20123+dc20124;

* OPTIONAL ADVANCED 3.7: Find the annual average discharge;
* (HINT: first count how many quarters of data there is per hospital, then sum, then divide, then multply by 4);

* OPTIONAL ADVANCED 3.8: Overall interesting question to try to answer;
* Q: Which hospital had the largest(or smallest) percentage increase in year 2012;
* We do not have any indication of size of hospital in the data, so percentage increase;
* is the only way we can adjust for size;

* P2.1 List each type of variable (continuous, categorical, binary, id). (see P3.3) ;
* id: hid;
* continuous: dcYYYYQ (20101-20124);
* categorical: hcity cntyname;
* binary: NA;
proc contents data=data.myipstatw;

* P2.2 Create summary statistics for all your continuous & binary variables ;
proc print data=data.myipstatw(obs=10);
proc means;

* P2.3 Create tabulations for each categorical variables ;
proc freq data=data.myipstatw;
    tables hcity*cntyname/nocol norow nopercent;

proc freq data=data.myipstatw;
    * P1.5 label values for at least 3 variables;
    * Using temporary formatting to check for missing;
    format dc20101-dc20104 dc20111-dc20114 dc20121-dc20124 miss.;
    tables dc20101-dc20104 dc20111-dc20114 dc20121-dc20124;
    
run; 

    
