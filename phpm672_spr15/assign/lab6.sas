%include './config_l6.sas';

%LET DY=2;

%macro readin(ifrm, ito );
  %do j=&ifrm %to &ito;
    %do i=2 %to 4;
      %readxlsx(infn=rhp&j._dy&DY, sht=DY&DY.IGT&i, outfn=data.dy&DY.igt&i.rhp&j);

      data data.dy&DY.igt&i.rhp&j;
      set data.dy&DY.igt&i.rhp&j;
      where rhp~='';

      if igt_tpi='1379213608' then igt_tpi='137921608';
      igt_tpi=compress(igt_tpi,"- ");
   
      nrhp=1*put(fips, rhp.);
      nprov_tpi=prov_tpi*1;
      nigt_tpi=igt_tpi*1;
      format nprov_tpi nigt_tpi z9.;

      drop prov_tpi igt_tpi;
      
      proc print data=data.dy&DY.igt&i.rhp&j(obs=10);
          title "DATASET: dy&DY.igt&i.rhp&j";
          
      run;  
      title;
      
    %end;  
  %end;
%mend;

%readin(ifrm=1, ito=2);
