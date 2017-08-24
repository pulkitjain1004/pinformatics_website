libname data 'data';

proc format;
    value health
        1='(01) Excellent' 2='(02) Very good' 3='(03) Good'
        4='(04) Fair' 5='(05) Poor' 94='(94) DON''T KNOW'
        97='(97) REFUSED' ;

proc format;
    value tinsur
        0="None"
        1="Public"
        2="Private"
        3="Both";

* subset vars;    
data data.mynsduh;
    set data.nsduh(keep=caseid cigever alcever cocever mjever txever medicare caidchip
        champus prvhltin income health irsex catage newrace2 coutyp2 wrkhrsw2
        rename=( wrkhrsw2=wrkhrs));

* P3.2 checking & coding missing;
if (mjever>2) then mjever = .;
if wrkhrs>=994 then wrkhrs=.;

* P3.3 create boolean variables;
array v{*} cigever alcever cocever mjever medicare caidchip champus prvhltin;
array bvar{*} bcigever balcever bcocever bmjever bmedicare bcaidchip bchampus bprvhltin;

i=1;
do while( i<=dim(bvar) );
  if v{i}=1 then bvar{i}=1;
  else if v{i}=2 then bvar{i}=0;
  i=i+1;
end;

drop i;

* P3.1 create new vars;    
if bcigever=1 or balcever=1 or bcocever=1 or bmjever=1 then
    subst=1;
else subst=0;

if bmedicare=1 or bcaidchip=1 or bchampus=1 then type_insur=1;
if type_insur=1 and bprvhltin=1 then type_insur=3;
else if bprvhltin=1 then type_insur=2;
if type_insur=. then type_insur=0;

* Label var & value;
label
   subst   = 'Substance Use' 
   type_insur='Type of Insturance'
    ;
format health health. type_insur tinsur.;

* P3.4 two different ways to convert numeric to string;
ccaseid=caseid;
ccaseid2=put(caseid, $6.);
rename caseid=ncaseid;

proc freq;
    tables cigever alcever cocever mjever;    

* Dropped vars here in a new datastep, so I could do frequencies above;    
data data.mynsduh2(drop=cigever alcever cocever mjever medicare caidchip champus prvhltin);
    set data.mynsduh;
    
* basic testing;
proc contents data=data.mynsduh;
proc print data=data.mynsduh(obs=10);    
proc freq;
    tables bcigever balcever bcocever bmjever bmedicare bcaidchip bchampus bprvhltin subst type_insur;

* subset obs;    
proc print data=data.mynsduh(obs=10);
    var subst bcigever balcever bcocever bmjever;    
    where subst=0;

proc print data=data.mynsduh(obs=10);
    var subst bcigever balcever bcocever bmjever;    
    where subst=1;    

proc print data=data.mynsduh(obs=10);
    var type_insur bmedicare bcaidchip bchampus bprvhltin;
    where type_insur=0;

proc print data=data.mynsduh(obs=10);
    var type_insur bmedicare bcaidchip bchampus bprvhltin;
    where type_insur=1;

proc print data=data.mynsduh(obs=10);
    var type_insur bmedicare bcaidchip bchampus bprvhltin;
    where type_insur=2;

proc print data=data.mynsduh(obs=10);
    var type_insur bmedicare bcaidchip bchampus bprvhltin;
    where type_insur=3;        
    
* P4. answer some interesting questions;    
proc means data=data.mynsduh;    
proc freq data=data.mynsduh;
    tables subst*health/nocol norow nopercent;

proc freq data=data.mynsduh;
    tables income*txever/nocol norow nopercent;
    where subst=1;
    
proc freq data=data.mynsduh;
    tables health*newrace2/nocol norow nopercent;    
    where irsex=2 & catage>2 & subst=1 & wrkhrs>24;
    
    
    
