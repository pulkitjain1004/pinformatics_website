<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Projects - Population Informatics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="../css/bootswatch.css">
    <link rel="stylesheet" href="../css/tamu.css">
    <link rel="stylesheet" href="../css/print.css" type="text/css" media="print">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../bower_components/html5shiv/dist/html5shiv.js"></script>
      <script src="../bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->
    <script src="../js/ga.js" async="" type="text/javascript"></script>
    
  </head>
  <body>
    <?php include("../includes/header-sub-menu.html"); ?>


    <div class="container">
        <div class="row">
			<div class="col-lg-12">
				
			<h1 class="entry-title">SAS Sample Code</h1>
								</header><!-- .entry-header -->

				<div class="entry-content">
			<h3>Create a tiny database method 1</h3>
<p>data test;<br>
do var1=1 to 10;<br>
output;<br>
end;</p>
<p>proc print data=test(obs=20);</p>
<h3>Create a tiny database method 2</h3>
<p>data test;<br>
    infile datalines;<br>
    * input varname [vartype];<br>
    input id2010 id2001 charid $5.;</p>
<p>    * Add rows of data under datalines;<br>
    datalines;<br>
1633900 1129771 one<br>
78161 50892 two<br>
14805 7785 three<br>
;</p>
<p>proc print data=test(obs=10);<br>
run;</p>
<h3>Read in csv file method 1</h3>
<p>data data.outfn;<br>
	infile “data/file.txt” missover lrecl=2000;</p>
<p>	* The two numbers at the end of the line indicates the starting position and ending position of the var;<br>
	* For example, record_id can be read from postion 1 to position 12;<br>
	* $ indicates string variables;</p>
<p>	input<br>
		RECORD_ID $ 1-12<br>
		UNITS_OF_SERVICE 34-40<br>
	run; </p>
<p>proc print data=data.outfn(obs=10);<br>
run;</p>
<h3>Read in xlsx file</h3>
<p>%macro readxlsx(infn, sht, outfn);<br>
PROC IMPORT OUT= &amp;outfn<br>
            DATAFILE= “raw/&amp;infn”<br>
            DBMS=XLSX REPLACE;<br>
     SHEET=”&amp;sht”;<br>
     GETNAMES=YES;<br>
RUN;</p>
<p>proc print data=&amp;outfn(obs=10);<br>
proc contents data=&amp;outfn;<br>
%mend;</p>
<h3>Write out xlsx file </h3>
<p>%macro writexlsx(infn, outfn);<br>
PROC EXPORT DATA= &amp;infn<br>
            OUTFILE= “raw/&amp;outfn”<br>
            DBMS=XLSX REPLACE;<br>
RUN;<br>
%mend;</p>
<h3>Write out html files</h3>
<p>ods html body=”file.html”;</p>
<p>.. sas code ..</p>
<p>run;<br>
ods html close;</p>
					</div>
				
			</div>

            <?php include("../includes/footer-sub-menu.html"); ?>

		</div>
	</div>

    <script src="../js/jquery-1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootswatch.js"></script>

</body></html>

