libname data '/home/TAMHSC/kum/phpm672/assign4/data';

ods html body='demo.html';

*---------- Append: add more rows for same columns;
proc print data=data.flu10(obs=100);
proc print data=data.flu9(obs=100);            
    
data data.append;
set data.flu10 data.flu9;    

proc print data=data.append(obs=100);

* Using proc copy & proc append;
* more efficient, but less flexible;    
proc copy in=data out=work memtype=data;
    select flu10;

proc append base=flu10 data=data.flu9;

proc print data=flu10 (obs=100);
    
*---------- Append: add more rows for diff columns;    
proc print data=data.flu10(obs=100);
proc print data=data.flu9d(obs=100);
    
data data.append2;
set data.flu10(in=aa) data.flu9d(in=bb);
if aa then month='Oct';
else if bb then month='Sep';

proc print data=data.append2(obs=100);

*---------- add more columns, matching up (1-to-1) rows by key(=date) no shared col;    
proc sort data=data.flu10;
by date;

proc sort data=data.flu109d;
by date;

proc print data=data.flu10(obs=100);
proc print data=data.flu109d(obs=100);
    
data data.addcol;
merge data.flu10(in=aa) data.flu109d(in=bb);
by date;

proc print data=data.addcol(obs=100);

*---------- add more columns, matching up (1-to-1) rows by key(=date) w/ shared col;        
data flu109;
set data.flu109;
usa=100;

proc sort data=data.flu10;
by date;

proc sort data=flu109;
by date;

proc print data=data.flu10(obs=100);
proc print data=flu109(obs=100);
    
data data.addcol2;
merge data.flu10(in=aa) flu109(in=bb);
by date;

src=aa*10+bb;

proc print data=data.addcol2(obs=100);

proc freq;
    tables src;
   
*---------- add more columns, matching up (1-to-N) rows by key(=qtr) no shared col;    
data flu109;
    set data.flu109;
    qtr=qtr(date);

proc sort data=flu109;
by qtr;

proc sort data=data.qtr;
by qtr;

proc print data=flu109(obs=100);
proc print data=data.qtr(obs=100);
    
data data.addcol3;
merge data.qtr(in=aa) flu109(in=bb);
by qtr;

if bb;

proc print data=data.addcol3(obs=100);

*---------- add more columns, matching up (N-to-N) rows by key(=qtr) no shared col;
*---------- Do not do using merge. Use proc sql;    
* NOTE: MERGE statement has more than one data set with repeats of BY values.;
    
proc sort data=flu109;
by qtr;

proc sort data=data.dqtr;
by qtr;

proc print data=flu109(obs=100);
proc print data=data.dqtr(obs=100);
    
data data.addcol4;
merge data.dqtr(in=aa) flu109(in=bb);
by qtr;

if bb;

proc print data=data.addcol4(obs=100);

*---------- combine rows by key(=yyyymm);
data append;
    set data.append;

    yyyymm=year(date)*100+month(date);
    
proc sort data=append;
by yyyymm;

proc print data=append(obs=100);

proc summary data=append;
    by yyyymm;
    var usa california florida texas;
    output out=data.sum sum=;
    
proc print data=data.sum(obs=100);

proc summary data=append;
    by yyyymm;
    var usa california florida texas;
    output out=sum(drop=_type_ rename=(_freq_=nrows))
        sum(california)=sca
        max(florida)=maxfl
        min(texas)=mintx
        sum(texas)=stx;
    
proc print data=sum(obs=100);

proc summary data=append;
    var usa california florida texas;
    output out=data.sum sum=;
    
proc print data=data.sum(obs=100);

*---------- proc transpose: flip row & col; 
proc print data=append(obs=100);

proc transpose data=append out=data.tappend;

proc print data=data.tappend(obs=100);

proc transpose data=append out=data.tappend;
    id date;

proc print data=data.tappend(obs=100);

proc transpose data=append out=data.tappend(rename=(_name_=state));
    id date;
    var usa california florida texas;

proc print data=data.tappend(obs=100);
    
*---------- proc transpose: by group(key=yyyymm). consolidate first then transpose;
*---------- there must be only 1 row per key;
* ERROR: The ID value "_201309" occurs twice in the input data set;
* The following section must be commented out to run;    
/*
proc sort data=append;
by yyyymm;

proc transpose data=append out=data.tappend(rename=(_name_=state));
    id yyyymm;
    var usa california florida texas;

proc print data=data.tappend(obs=100);
*/

* Dangerous unless you know what you are doing;
* Using sort nodupkey to make it one record per key;    
proc print data=append(obs=100);

* Estimates in first week of each month;    
proc sort data=append out=xdup nodupkey;
by yyyymm;

proc print data=xdup(obs=100);
    
proc transpose data=xdup out=data.tappend(rename=(_name_=state));
    id yyyymm;
    var usa california florida texas;

proc print data=data.tappend(obs=100);
    
* Using summary to combine records to make it one record per key;
* best option, when in doubt;
proc print data=append(obs=100);
proc sort data=append;
by yyyymm;

proc summary data=append;
    by yyyymm;    
    var usa california florida texas;
    output out=sum sum=;
            
proc print data=sum(obs=100);
    
proc transpose data=sum out=data.tappend(rename=(_name_=state)) prefix=flu;
    id yyyymm;
    var usa california florida texas;

proc print data=data.tappend(obs=100);

* transpose back;    
proc transpose data=data.tappend out=back;
    id state;
    var flu201309-flu201310;
    
proc print data=back(obs=100);

data back;
    set back;

yyyymm=.;
yyyymm=substr(_name_, 4);

proc print data=back(obs=100);

*---------- proc transpose: flip row & col by group(key=yyyymm);
proc print data=data.wkappend(obs=100);    
    
proc transpose data=data.wkappend out=data.tappend(rename=(_name_=state));
    by yyyymm;
    id week;
    var usa california florida texas;

proc print data=data.tappend(obs=100);

* transpose back by key;        
proc transpose data=data.tappend out=back(rename=(_name_=week));
    by yyyymm;
    id state;
    var wk1-wk5;

proc print data=back(obs=100);
    
data back;
set back;
*ERROR: Syntax error while parsing WHERE clause.;    
*where sum (of usa california florida texas)>.;
if sum (of usa california florida texas)>.;

proc print data=back(obs=100);
    
run;
ods html close;
    
    
    
    

    
