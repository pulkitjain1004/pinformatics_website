/*-------------------------
 |   Assignment 6: Macros
 |   Hye-Chung Kum (3/31/2014)
 |   Hospital level Tx quarterly discharge data
 |   http://www.dshs.state.tx.us/thcic/hospitals/Inpatientpudf.shtm   
 |-------------------------*/ 
%include 'config_a6.sas';

%let cnty='Bexar', 'Dallas', 'Travis', 'Harris';

proc print data=data.ipstatw(obs=10);    

data data.myipstatw;
set data.ipstatw(drop=hospname rename=(THCIC_ID=hid hospcity=hcity county=cntyname));

where cntyname in (&CNTY);

* P8.1: label the 12 discharge variables in the same format as the example below for dc20101 using regular sas code;
* P8.2: Now modify the macro concatQ provided to complete the same task;
label
    hid = 'Texas Health Care Information Collection ID'
    hcity = 'Hospital City'
    cntyname = 'Hospital County'
    dc20101 = 'Inpatient Discharge in 20101'
    ;

array dc{*} %concatQ(dc, 20101, 20124);

first=1;
do while (dc{first}=. & first<=dim(dc));
    first=first+1;
end;
if first<=dim(dc) then do;
  yr=int((first-1)/4)+2010;
  qtr=mod(first-1,4)+1;
  first=yr*10+qtr;
end;

proc contents data=data.myipstatw;

proc print data=data.myipstatw(obs=10);

proc summary;
    var dc20101-dc20104 dc20111-dc20114 dc20121-dc20124;
    output out=stats;

proc print data=stats(obs=10);    

data stats;
set stats;

if _STAT_='MEAN' then call symput('avg20112', dc20112);

proc freq data=data.myipstatw;
    title "The mean for 2011QTR2 was &avg20112";
    where dc20112> &avg20112;
    tables cntyname;
        
proc freq data=data.myipstatw;
    format dc20101-dc20104 dc20111-dc20114 dc20121-dc20124 miss.;
    tables dc20101-dc20104 dc20111-dc20114 dc20121-dc20124;

run; 

    
