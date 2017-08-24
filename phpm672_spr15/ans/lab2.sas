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
if cigever=1 then bcigever=1;
else if cigever=2 then bcigever=0;

if alcever=1 then balcever=1;
else if alcever=2 then balcever=0;

if cocever=1 then bcocever=1;
else if cocever=2 then bcocever=0;

if mjever=1 then bmjever=1;
else if mjever=2 then bmjever=0;

if medicare=1 then bmedicare=1;
else if medicare=2 then bmedicare=0;

if caidchip=1 then bcaidchip=1;
else if caidchip=2 then bcaidchip=0;

if champus=1 then bchampus=1;
else if champus=2 then bchampus=0;

if prvhltin=1 then bprvhltin=1;
else if prvhltin=2 then bprvhltin=0;

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
    
    
    
