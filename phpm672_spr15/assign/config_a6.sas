libname data 'data/';

proc format;
    value bool
        0='No' 1='Yes';
    value miss
        .='Missing'
        low-<0='-'
        0='0'
        0<-high='+';

/*@---------------------------------------------------------------------------
  @ %macro concat?(file, start, end, tag); 
  @     - build a string of filenames for specified start and end values with 
  @       appropriate tags. No semicolon between filenames.
  @     ?=M(onth) start and end have the format YYMM
  @     ?=Q(uarter) start and end have the format YYQ
  @     ?=I(nteger) start and end have the format 1, 2, 3, 4, etc 
  @	- if file=fn, start=982, end=984, tag=4. => fn982 4. fn983 4. fn984 4. 
  @-------------------------------------------------------------------------*/
%macro concatM(file, start, end, tag); 
%* start and end have the format YYMM;
%do i = &start %to &end;  
  %let Y=%eval(&i/100);
  %let M=%eval(&i-&Y*100);

  %if ((0<&M) and (&M<13)) %then %do;
     &file&i &tag
  %end;
  %else %let i=%eval(&Y+1)00;
%end;
%mend concatM;
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

%macro concatQ (file, start, end, tag); 
%* start and end have the format YYQ;
%do i = &start %to &end; 
  %let Y=%eval(&i/10);
  %let Q=%eval(&i-&Y*10);
  %if ((0<&Q) and (&Q<5)) %then %do;
     &file&i &tag
  %end;
  %else %let i=%eval(&Y+1)0;
%end;
%mend concatQ;
 /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

%macro concatI (file, start, end, by, tag) ; 
%* start & end have the format 1,2,3; 
  %do i = &start %to &end %by &by; 
    &file&i &tag
  %end;
%mend concatI;
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

/* builds a string of filenameMMMYY.  ex: fnjan95 fnfeb95 fnmar95 etc. */
%macro concatMC(file, start, end);
%let months=janfebmaraprmayjunjulaugsepoctnovdec;

%do i = &start %to &end;  
  %let Y=%eval(&i/100);
  %let M=%eval(&i-&Y*100);

  %if ((0<&M) and (&M<13)) %then %do; 
    &file%substr(&months, 3*(&M-1)+1 , 3)%substr(&Y,3,2)
  %end;
  %else %let i=%eval(&Y+1)00;
%end;
%mend;

%macro mfreq(infn, var, byvar, ntest);
   proc freq data=&infn;
   tables &var*&byvar /nocol norow nopercent &ntest;
%mend;
