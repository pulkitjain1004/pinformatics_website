<!DOCTYPE html>
<html lang="en"><head>
<!-- MENU START ID=1 -->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>PPIRL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="../css/bootswatch.css">
    <link rel="stylesheet" href="../css/tamu.css">
    <link href="../css/print.css" rel="stylesheet" type="text/css" media="print">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../bower_components/html5shiv/dist/html5shiv.js"></script>
      <script src="../bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->
    <script src="../js/ga.js" async="" type="text/javascript"></script>
   
   
  </head>
  <body>
    <?php include("includes/header.html"); ?>
	

    <div class="container">
			<h3>Privacy Preserving Interactive Record Linkage (PPIRL) via Information Suppression</h3>	
            <p class="lead"></p>

            <div class="panel panel-primary">
                <div class="panel-heading">
					
					
					<p style="text-align:left;">
						<span style="float:right;">
							<a href="news.php" style="color:white;text-align:right">See All News and Annoucements </a>
						</span>
					</p>

					<h3 class="panel-title">Recent Annoucements</h3>
										
                </div>
                <div class="panel-body">
					<font color='red'>
					<li><strong>Methods committee meeting is scheduled for Aug 14, 2017 (Monday) 1pm-3pm (central time)
					</strong></li>
					</font>
                </div>
            </div>
			<!-- MENU END  -->

            <h2>Project Overview</h2>
            <div>
				<!--p>
					Population data at the patient level can inform PCOR/CER studies. However, such data is often collected through different systems, resulting in data distributed across separate, unconnected databases. Linking data from disparate databases can enable clear benefits such as improvements for individual treatments, studies on comparative effectiveness of different policies and treatments, and decision making for how to best invest limited resources to improve health. As one example, a National Institute on Drug Abuse (NIDA) study integrated data from multiple state agency databases on 56,923 Medicaid beneficiaries with opioid dependency to conclude that buprenorphine was cheaper and safer than alternative treatments. Analyzing linked cancer registries, Medicare, and Medicaid data has yielded significant results describing the patterns and outcomes of cancer care, including the health disparity in cancer care. Further, innovations in novel uses of mobile and personal devices have the potential to improve PCOR/CER, but such methods will require integration of patient-generated data and EHR data to ensure meaningful use. 
				</p-->
				<p>
					Integrating data from diverse, heterogeneous systems is essential for meaningful use of available data, but this requires an effective means of linking records. The goal of record linkage (RL) is how to match rows in multiple tables that represent the same real world entity. Also called entity resolution, record linkage allows identifying the same real world entity in multiple databases (record linkage) as well as in a single database (de-duplication). Key challenges are the lack of a common, error-free, unique identifiers across data sources and the need to use patient-level identifying information to ensure proper linkage. Accurate record linkage is critical for building data research networks and replicable science.
				</p>
				<p>
					While automated methods can help integrate many records from heterogeneous data systems, high-quality record linkage requires human interaction to manage the inevitable errors and discrepancies resulting from imperfect and complex real world data. Errors that are not properly managed in machine-only data integration systems propagate to subsequent data analyses, which can lead to potential problems with invalid results and poor decision making. Thus, researchers need a means of providing direct control over the record linkage process to limit and bound errors. However, due to the personal and often sensitive nature of human data, privacy becomes a serious concern. <b> The goal of this research is to investigate secure techniques and develop effective tools to accurately integrate heterogeneous data while still protecting human confidentiality by using a hybrid human-machine system that securely and strictly controls information disclosure.</b>
				</p>
				<p>
				<img src="img/aim.png" width=900>
				<br><br>
				This study focuses on improving 1) methods to support data research networks, 2) methods to improve the validity and replicability of data-intensive studies, and 3) research related to the ethical conduct of PCOR/CER. The long-term goal in PPIRL research is to develop open source software, documentation, and training material that allow users to securely and accurately integrate biomedical data from heterogeneous systems to support PCOR/CER (Fig B2 Phase 3). Our preliminary results indicate that we can guarantee against sensitive attribute disclosure by decoupling (i.e., separating the identifying information from the sensitive information) and chaffing (i.e., adding fake data). We now need to investigate how to minimize the identity disclosure while still obtaining high quality record linkage and quantify any remaining risks. In so doing, we can properly inform all stakeholders of this risk. Our central hypothesis is that there is a level of identifying information that can be partially disclosed incrementally during record linkage which is sufficient for high quality linkage decisions while minimizing information disclosure to acceptably low levels of privacy risk. This hypothesis is based on our preliminary research findings that indicate manual linkage decisions mainly rely on the discrepancies in potentially matched pairs (Fig B1b) rather than the raw data (Fig B1a). Given the high levels of similarity is potential match pairs, one can code and disclose only the discrepancies of the potential matches and block the rest of the information without loss to linkage quality. Thus, the specific aims of this proposal are as follows.
				<ul>
				<li> Aim 1. Develop an effective incremental information disclosure model to support high quality record linkage while providing the needed privacy protection for data intensive PCOR/CER that requires data integration. 
				<li> Aim 2. Develop a computational (i.e., mathematical) model for privacy risk analysis based on the total amount of information disclosed to quantify the remaining risk in any given PCOR/CER that used SDLink. 
				<li> Aim 3. Engage, educate, and build consensus on the use of PPIRL framework for PCOR/CER that requires record linkage with patients and stakeholders to collaboratively write the following template documents for PPIRL: 1) privacy statement, 2) IRB application, and 3) DUA. 
				</ul>
				</p>
			</div>
			<br>
			<h4>Acknowledgement</h4>
			<div>
				We acknowledge the generous support of a <a href="http://www.pcori.org/research-results/2016/privacy-preserving-interactive-record-linkage-ppirl-information-suppression">PCORI Methods grant</a> from the Patient Centered Outcomes Research Institute.
				<br><br>Any opinions, findings, and conclusions or recommendations expressed in the project material are those of the authors and do not necessarily reflect the views of the sponsors.				
			</div>
			<footer>
			<div class="row">
				<div class="col-lg-12">
					<ul class="list-unstyled">
					<li class="pull-right"><a href="#top">Back to top</a></li>
			  
					</ul>
					<div align='center'>
						<br>
						<hr>
					</div>
					<p>&copy; Hye-Chung Kum 
					(<a href="http://pinformatics.org/">Population Informatics Research Group</a>) 2017</p>
					<p>Code released under the <a href="https://github.com/thomaspark/bootswatch/blob/gh-pages/LICENSE">MIT License</a>.</p>
					<p>Based on <a href="http://getbootstrap.com/" rel="nofollow">Bootstrap</a>. Icons from <a href="http://fortawesome.github.io/Font-Awesome/" rel="nofollow">Font Awesome</a>. Web fonts from <a href="http://www.google.com/webfonts" rel="nofollow">Google</a>.</p>
				</div>
			</div>
			</footer>
    </div>

    <script src="../js/jquery-1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootswatch.js"></script>
	<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-104121882-1', 'auto');
	ga('send', 'pageview');

	</script>

</body></html>

