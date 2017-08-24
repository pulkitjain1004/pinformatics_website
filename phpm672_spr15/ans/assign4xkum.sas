libname data "data";

proc print data=data.txhealthregions(obs=5) label;
format ismsa;
proc print data=data.phy2010(obs=5) label;

data data.phy;
set data.phy2010(in=aa rename=(rank=crank pop2010=pop)) 
	data.phy2011(in=bb rename=(pop2011=pop)) 
	data.phy2012(in=cc rename=(pop2012=pop));
if aa then do;
  year=2010; 
  rank=crank;
end; else if bb then do;
  year=2011;
end; else if cc then year=2012;

idcnty='                  ';
idcnty=county;

drop crank;

proc print data=data.phy(obs=10);

proc freq data=data.phy;
tables county*year/norow nocol nopercent;

data data.ipstat;
set data.ipstat2010(in=aa) data.ipstat2011(in=bb) data.ipstat2012(in=cc);
if aa then year=2010;
else if bb then year=2011;
else if cc then year=2012;
idcnty='                  ';
idcnty=county;

proc print data=data.ipstat(obs=10);

proc print data=data.ipstat(obs=10);
where county='';

proc sort;
by idcnty year;

proc summary;
by idcnty year;
where county~='';
var _1qtrdisc _2qtrdisc _3qtrdisc _4qtrdisc; 
output out=data.ipstatc(drop=_type_) sum=;

proc print data=data.ipstatc(obs=10);

proc freq data=data.ipstat;
tables county*year/norow nocol nopercent;

proc sort data=data.txdeaths out=txdeaths;
by county;

proc transpose data=txdeaths out=data.deatht prefix=dth;
by county;
var yr2006-yr2010;

data data.deatht;
set data.deatht;

idcnty=county;

year=.;
year=substr(_name_, 3);

drop _name_ _label_;
rename dth1=death;

proc print data=data.deatht(obs=10);
where county='Bexar';

proc sort data=data.phy;
by idcnty year;

proc sort data=data.deatht;
by idcnty year;

data data.assign4;
merge data.phy(in=aa) data.ipstatc(in=bb) data.deatht(in=cc);
by idcnty year;
where year>=2010;

discharge=sum (of _1qtrdisc _2qtrdisc _3qtrdisc _4qtrdisc);

insrc=aa*100+bb*10+cc;
if year>2010 then insrc=insrc+2;
if discharge=. then insrc=insrc+20;

if .<discharge<death then dthmdisch=1;
if .<dpctotal<death then dthmpc=1;

proc print data=data.assign4(obs=30);
where insrc<111;

data data.txreg;
set data.txhealthregions;
idcnty=county;

proc sort;
by idcnty;

data data.assign4;
merge data.assign4(in=aa) data.txreg(in=bb);
by idcnty;

insrc=insrc*10+bb;

proc print data=data.assign4(obs=30);
where insrc~=11;

proc freq;
tables insrc;

proc print data=data.assign4(obs=30);
where insrc=111;

proc print data=data.assign4(obs=30);
where insrc=1110;

proc print data=data.assign4(obs=30);
where insrc=1100;

proc freq data=data.assign4;
tables county*year/norow nocol nopercent;
where discharge=. and year>=2010;

proc sort data=data.assign4 out=assign4 nodupkey;
by county;
where discharge=. and year>=2010;

proc print data=data.assign4(obs=10);
where discharge=. and year>=2010;

proc sort data=data.assign4;
by year lapazborder;

proc summary data=data.assign4;
by year;
var pop discharge death dpctotal;
where discharge=. and year>=2010;
output out=res mean=;

proc print data=res(obs=100);

proc summary data=data.assign4;
by year lapazborder;
var pop discharge death dpctotal dthmdisch dthmpc ratdpcpp;
where year>=2010;
output out=res mean(ratdpcpp)=mrdcpp sum=;

proc print data=res(obs=100);
proc print data=data.assign4(obs=10);
where .<discharge<death;

proc print data=data.assign4(obs=10);
where .<dpctotal<death;

proc sort data=data.assign4;
by pubhlt year;

proc sort data=data.assign4;
by pubhlt year;

proc summary data=data.assign4;
by pubhlt year;
var dpctotal discharge;
output out=res mean=;

data res;
set res;

rtio=dpctotal/discharge;

proc sort;
by descending rtio;

proc print data=res(obs=10);

proc sort data=data.assign4 out=msa;
by msaname lapazborder year;
where ismsa='Yes';

proc summary data=msa;
by msaname lapazborder year;
var dpctotal discharge;
output out=res sum=;

proc transpose data=res out=res(drop=_name_);
by msaname lapazborder;
var discharge;
id year;

data res;
set res;

array dc{*}_2010-_2012;
array inc{*} inc2010-inc2012;

do i=1 to dim(dc)-1;
	inc{i+1}=(dc{i+1}-dc{i})/dc{i};	
end;

proc sort;
by inc2012;

proc print data=res(obs=100);
run;
