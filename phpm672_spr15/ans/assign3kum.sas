/*-------------------------
 |   Assignment 2: No loops
 |   Hye-Chung Kum (2/12/2014)
 |   Hospital leve Tx quarterly discharge data
 |   http://www.dshs.state.tx.us/thcic/hospitals/Inpatientpudf.shtm   
 |-------------------------*/ 

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
array dc{*} dc20101-dc20104 dc20111-dc20114 dc20121-dc20124;

first=1;
do while (dc{first}=. & first<=dim(dc));
    first=first+1;
end;
if first<=dim(dc) then do;
  yr=int((first-1)/4)+2010;
  qtr=mod(first-1,4)+1;
  first=yr*10+qtr;
end;

* OPTIONAL ADVANCED 2.4: Find the last time period (YYYYQ) each hospital had data;

* P1.7 Recode at least 3 variables (use your imagination, if not essential to your analysis);
* ASSIGNMENT 3.1: recode the discharge variables using arrays and counting loop;
array dc10{*} dc20101-dc20104; * dc20111-dc20114 dc20121-dc20124;
do i=1 to dim(dc10);
    if dc10{i}=. then dc10{i}=0;
end;

* P1.8 Construct at least 3 new variables (use your imagination, if not essential to your analysis);
* Annual discharge;
* ASSIGNMENT 3.2: Create annual discharge variables using arrays and counting loop;
* OPTIONAL ADVANCED 2.1: Try using a two dimensional array with a nested do loop;
* OPTIONAL ADVANCED 2.2: If two dimensional arrays are confusing, setup multiple arrays and use a nested do loop;
array tot{*} tot2010-tot2012;
do i=1 to dim(tot);
    tot{i}=0;
    do j=1 to 4;
        tot{i}=tot{i}+dc{(i-1)*4+j};
    end;
end;

drop i j yr qtr;
    
* OPTIONAL ADVANCED 2.5: Find the annual average discharge;
* (HINT: first count how many quarters of data there is per hospital, then sum, then divide);

* OPTIONAL ADVANCED 2.6: Overall interesting question to try to answer;
* Q: What was the largest(smallest) percentage increase in year 2012 for any hospital;
* We do not have any indication of size of hospital in the data, so percentage increase;
* is the only way we can adjust for size;
/*
if tot2012>0 and tot2011>0 then
    pdelta=(tot2012-tot2011)/tot2011;
format pdelta percent10.1;
*/
    
* P2.1 List each type of variable (continuous, categorical, binary, id). (see P3.3) ;
* id: hid;
* continuous: dcYYYYQ (20101-20124);
* categorical: hcity cntyname;
* binary: NA;
proc contents data=data.myipstatw;

* P2.2 Create summary statistics for all your continuous & binary variables ;
proc print data=data.myipstatw(obs=10);
    
*proc print data=data.myipstatw(obs=10);
*    where ((pdelta>15 or pdelta<=-1) and pdelta>.) or dc20114=21;
    
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

    
