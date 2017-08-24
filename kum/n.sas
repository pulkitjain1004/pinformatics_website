libname data '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\assign4';

data data.phy2010 (rename =(pop2010=pop));
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\phy2010';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.phy2010 ;
run;
proc contents data=data.phy2010 ;
run;
data data.phy2010;
set data.phy2010;
newrank = input(rank,8.); 
 drop rank; 
 rename newrank=rank; 
 run;

data data.phy2011 (rename =(pop2011=pop));
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\phy2011';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.phy2011;
run;
proc contents data=data.phy2011;
run;

data data.phy2012 (rename =(pop2012=pop));
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\phy2012';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.phy2012;
run;
proc contents data=data.phy2012;
run;

data data.ipstat2010;
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\ipstat2010';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.ipstat2010;
run;
proc contents data=data.ipstat2010;
run;

data data.ipstat2011;
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\ipstat2011';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.ipstat2011;
run;
proc contents data=data.ipstat2011;
run;


data data.ipstat2012;
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\ipstat2012';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.ipstat2012;
run;
proc contents data=data.ipstat2012;
run;

data data.txhealthregions;
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\txhealthregions';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.txhealthregions;
run;

data data.txdeaths;
set '\\blender\homes\n\o\nonyeaku\nt\AccountSettings\Desktop\phpm\src\txdeaths';
where county in ('Brazos', 'Brewster', 'Austin', 'Childress');
run;
proc print data=data.txdeaths;
run;

/*Combining 8 src tables ino 4 sets of tables*/
/*a. Appending  phy2010, phy2011 & phy2012*/

 data data.phy ;
 set data.phy2010(in=a) data.phy2011(in=b) data.phy2012(in=c);
 if a then year=2010; 
 if b then year=2011; 
 if c then year=2012;
 run;
 proc print data=data.phy;
 run;
/*b. Appending ipstat2010, ipstat2011, ipstat2012*/
 data data.ipstat;
 set data.ipstat2010(in=a) data.ipstat2011(in=b) data.ipstat2012(in=c);
 if a then year=2010; 
 if b then year=2011; 
 if c then year=2012;
 run;
 proc print data=data.ipstat;
 run;

/*c.Tranposing txdeaths*/
 data data.txdeaths;
 set data.txdeaths;
 drop total;
 run;

 proc transpose data=data.txdeaths out=data.txdeathstrans (drop= _label_ rename=(_name_=Year1 col1= Deaths));
 by county;
 run;

 proc print data=data.txdeathstrans;
 run;

 data data.txdeathstrans;
 set data.txdeathstrans;
 year= input(substr(year1,3,4),8.0) ;
drop year1;
run;
proc sort data=data.txdeathstrans out=data.txdeathstrans;
 by county year;
 run;

 proc print data=data.txdeathstrans;
 run;


 data data.phy;
 set data.phy;
 run;
 proc sort data=data.phy out=data.phy;
 by county year;
 run;
 proc print data=data.phy;
 run;
 
data data.ipstat;
set data.ipstat;
run;
 proc sort data=data.ipstat out=data.ipstat;
 by county year;
 run;
 proc print data=data.ipstat;
 run;
/*d. Summary procedure of ipstat*/ 
proc summary data=data.ipstat;									
    by county year;									
    var _1qtrdisc _2qtrdisc _3qtrdisc _4qtrdisc;									
    output out=data.ipstatsumm(drop=_type_) sum= mean(_1qtrdisc)=qtr1avdisc mean(_2qtrdisc)=qtr2avdisc
               mean(_3qtrdisc)=qtr3avdisc mean(_4qtrdisc)=qtr4avdisc;									
run;
data data.ipstatsumm;
set data.ipstatsumm;
drop _freq_ _1qtrdisc _2qtrdisc _3qtrdisc _4qtrdisc;
run;
proc print data=data.ipstatsumm;
 run;

 /*Linking resulting 4 tables: Matching variable is County*/
 data data.txintmerge;
 merge data.txdeathstrans data.phy data.ipstatsumm;
 by county year;
 run;
 proc print data=data.txintmerge;
 run;


 data data.txmerge;
 merge data.txintmerge data.txhealthregions;
 by county;
 run;
 proc print data=data.txmerge;
 run;
 /*How many total observations do you have when the merge is complete?*/
 proc contents data=data.txmerge;
 run;

 
/*How many observations are missing patient data?*/
data missingobs;
set data.txmerge;
numMiss= cmiss( of county--lapazborder);
if numMiss =0 then missnum=0;
else missnum=1;
run;

proc summary data=missingobs;
var missnum;
output out=missingobs sum=sum(missnum)=missnum;
run;
proc print data=missingobs;
run;

/*How many counties in your dataset are missing patient data for AT LEAST 1 year?*/
data data.misscounty;
set data.txmerge;
sumdisc= sum (of qtr1avdisc qtr2avdisc qtr3avdisc qtr4avdisc); 
avdisc= mean (of qtr1avdisc qtr2avdisc qtr3avdisc qtr4avdisc);
drop qtr1avdisc qtr2avdisc qtr3avdisc qtr4avdisc;
if deaths=. or pop=. or dpctotal=. or ratppdpc=. or ratdpcpp=. or rank=. or avdisc=. then misscount=1; else misscount=0;
run;
proc print data=data.misscounty;
run;

data data.missyr;
set data.misscounty;
where misscount=1;
run;

proc sort data=data.missyr out=data.missyr nodupkey;
by county ;	
run;
proc summary data=data.missyr;
var misscount;
output out=data.missyr sum=sum(misscount)=misscount;
run;
proc print data=data.missyr;
run;


/*What is the average size (in terms of the population variable) of all observations (county/years) that have missing patient data?*/
data data.misspop;
set data.misscounty;
where misscount=1;
run;

proc sort data=data.misspop out=data.misspop;
by county ;	
run;
proc summary data=data.misspop;
by county;
var pop;
output out=data.misspop sum=mean(pop)=popavg;
run;
proc print data=data.misspop;
run;

data data.misspop1;
set data.misscounty;
where misscount=1;
run;

proc sort data=data.misspop1 out=data.misspop1;
by county ;	
run;
proc summary data=data.misspop1;
var pop;
output out=data.misspop1 sum=mean(pop)=popavg;
run;
proc print data=data.misspop1;
run;

/*Which observations (which county/years) have more deaths than inpatient discharges?*/
data data.deathsdisc;
set data.misscounty;
keep county year deaths avdisc;
where deaths > avdisc;
run;
proc print data=data.deathsdisc;
run;
/*How many observations have more deaths than physicians ?*/
data data.deathsdpctotal;
set data.misscounty;
keep county year deaths dpctotal;
where deaths > dpctotal;
run;
proc print data=data.deathsdpctotal;
run;

/*How does the Ratio of DPC per 100,000 Population variable differ by border and non-border counties; that is, which has a higher average Ratio of DPC per 100,000 Population?*/
data data.ratborder;
set data.txmerge;
keep ratdpcpp lapazborder;
run;

proc sort data=data.ratborder out=data.ratborder1;
by lapazborder;
run;
proc print data=data.ratborder1;
run;

proc summary data=data.ratborder1;
by lapazborder;
var ratdpcpp;
output out=data.ratborder2 sum=mean(ratdpcpp)=ratdpcppavg;
run;
proc print data=data.ratborder2;
run;
