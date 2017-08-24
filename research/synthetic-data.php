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
				
						<h1>Synthetic Data</h1><p>Many privacy related concerns are raised while working on the record linkage problem, especially with the record linkage of personal data. Personal data contains attributes like SSN, DOB, and ZIP CODE which can be used to uniquely identify the person during linkage process. But at the same time, these attributes help towards identity disclosure or identity inference of a person.</p>
<p>As the real public data sets hide DOB or SSN information, those data sets are not much useful for the research on record linkage. We realized the need of “Synthetic data generation” which will help us add realistic attributes in the available public data sets. This will help graduate students to continue working on record linkage and data visualization problems without compromising the privacy while maintaining the accuracy and complexity of the problem. However, synthetic data generation can also be as complex as the record linkage problem because of the characteristics of real data such as missing data, erroneous data, changing data.</p>
<p>To simulate the real world data, we started with the voters registration data of one of the large counties in the US. This public data obviously does not have DOB and SSN of voters, but it has the age of voters. Our goal is to be able to generate realistic data for DOBs of voters in this dataset. We did this in two steps:<br>
1. Populate a DOB column:<br>
1.1. As we have age of a voter in public data set, we used that age to get the year of birth.</p>
<p>Year of Birth (YYYY) = Current year (2012) – Age(XXX)</p>
<p>1.2 We extracted only DD and MM values from the DOB column of an existing real data set (which is far different from voter’s registration data set.) We randomly attached these DD and MM values to the YYYY generated in step 1.1.</p>
<p>2. Perturb DOB column to make it realistic:</p>
<p>2.1 Make some DOB values missing.<br>
2.2 Introduce substitution errors by replacing some digits in DOB by other digits.<br>
2.3 Introduce transposition errors.</p>
<p>We need to investigate and do more research on following:<br>
1. Try to figure out various data error patterns for DOB in real world data.<br>
2. The average approximate percentage of different data errors such as missing data, transposed data.<br>
3. Way to find out how closer the synthetic data model is to the real data.</p>
<p>&nbsp;</p>
<p><a href="http://pinformatics.web.unc.edu/source-of-synthetic-data/" title="Data Source">Information about real data sets used for this research</a></p>
				
			</div>

            <?php include("../includes/footer-sub-menu.html"); ?>

		</div>
	</div>

    <script src="../js/jquery-1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootswatch.js"></script>

</body></html>

