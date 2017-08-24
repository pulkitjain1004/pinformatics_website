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
				
				<h1 class="entry-title">Record Linkage Basics</h1>
								</header><!-- .entry-header -->

				<div class="entry-content">
			<h2>What’s Record Linkage</h2>
<p>Record linkage (RL), also named as to “duplicate detection”, “record matching”, “data matching” or “object identity problem”, refers to the task of finding entries that refer to the same individual in two or more files. It is an appropriate technique when you have to join data sets that do not have a unique database key in common. A data set that has undergone record linkage is said to be linked.</p>
<p>For example, in a table that belongs to University of North Carolina at Chapel Hill, one entry keeps one student’s information, contains a column “onyen” , a column “First Name”, and a column “Last Name”, and a column “SSN”. The last three items also maintained by a table from Bank of America to record its customers. Now we pick up one pair contained two entries, one from the first table and the other from the second one. If the 10 digital number SSN in two entries’ SSN are same, and the student’s name from both tables matches each other, we could determine this bank’s customer is the student from UNC; this pair is linked.</p>
<h2>Record Linkage in Research</h2>
<p>When research requires linking data between historical records and current survey or records, people use record linkage to build connection between old and new data sets. This is normal since information from records is updated during periods with the status changes. For longitudinal records research, reconstruct one data set must link each period data sets to track series of records.</p>
<p>We also need to use record linkage to link data between different agencies. Each agency, for their purpose, use specific formats to store data information. When people research among different areas, one need to link data sets from each of them. However, different agency information systems do not share a common ID. Without common IDs, linking data records reliably and accurately across different data sources is an important issue.</p>
<h2>Basic Algorithm of Record Linkage</h2>
<p>There are two basic methods of record linkage: deterministic record linkage and probabilistic record linkage.&nbsp; Deterministic record linkage is defined as linking two (or more) tables based on agreement rules (exact, approximate, and partial) for matching variables, which are often structured hierarchically.&nbsp; That is deterministic record linkage compares a group of identifiers or one identifier across databases; a link is made if all of the fields in record agree to an acceptable level. In practice, people use common IDs, like Social Security Number, birth dates, first and last names of individuals as basic fields to compare. Using combinations of different fields of identifying information could increase the validity of the link made.</p>
<p>Probabilistic Record Linkage is based on the assumption that no single match between variables common to the source databases will identify a client with complete reliability. One probability function indicates two records belong to one same client through calculation of identifying information, such as last and first name, birth date, Social Security Number or other fields existed at the same time in different data sets.</p>
<p>The process of record linkage can be conceptualized as identifying matched pairs among all possible pairs of observations from two data sets. People definite the set of true matches(M set) and the set of true nonmatches(U set) in practice, and also denoted in m probability and u probability. The m probability is the probability that a field agrees given that the record pair being examined is a matched pair, and the u probability is the probability that a field agrees given that the record pair being examined is not a matched pair. Although there are many methods to calculate M and U probabilities, maximum-likelihood-based methods such as the Expectation-Maximization(EM) algorithm is, as the recent studies shows, the most effective of all existed algorithms.</p>
<p>Using m and u probabilities, weight is defined to measure the contribution of each field to the probability of making an accurate classification of each pair into M or U sets. The “agreement” weight when a field agrees between the two records being examined is calculated as log2(m/u); the “disagreement” weight when a field does not agree is calculated as log2((1-m)/(1-u)). These weights will vary based on the distribution of values of the identifiers and indicate how powerful a particular variable is in determining whether two records are from the same individual.</p>
<p>Using the composite weights, calculated by summing the individual data field’s weights, one can classify each pair of records into three groups: a link when the composite weight is above a threshold value(U), a non link when the composite weight is below a threshold value(L), and a possible link for clerical review when the composite weight is between U and L. The threshold values can be calculated bythe accepted probability of false matches and the probability of false nonmatchs.</p>
<p>Based on the theory above, the main focus of record linkage research has been how to matching fields and how to determine the threshold values of U and L to improve the accuracy of determining what the threshold weight is for a certain link or non-link.</p>
<h2>Fields Matching Methods</h2>
<h2>Records Matching Techniques</h2>
<h2>Conclusion</h2>
<h2>References:</h2>
<p>Dunn, Halbert L. (December 1946). “Record Linkage” American Journal of Public Health 36 pp. 1412–1416.</p>
<p>Studies of Welfare Populations: Data Collection and Research Issues (Editors M. Ver Ploeg, A. Moffit, and C. Citro, National Academy Press) titled Matching and Cleaning Administrative Data. Author Bong-Ju Lee.</p>
<p>Ahmed K. Elmagarmid, Panagiotis G. Ipeirotis, Vassilios S. Verykios. Duplicate Record Detection: A Survey. IEEE TRANSACTIONS ON KNOWLEDGE AND DATA ENGINEERING, VOL. 19 JANUARY 2007</p>
					</div>
				
			</div>

            <?php include("../includes/footer-sub-menu.html"); ?>

		</div>
	</div>

    <script src="../js/jquery-1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootswatch.js"></script>

</body></html>

