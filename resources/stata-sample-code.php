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
				
			<h1 class="entry-title">STATA Sample Code</h1>
								</header><!-- .entry-header -->

				<div class="entry-content">
			<h3>Set up Log </h3>
<p>clear all<br>
capture log close<br>
set more off<br>
log using filename.log, replace<br>
…Program…<br>
log close</p>
<h3>Create a tiny database </h3>
<p>clear all<br>
g var1=1<br>
forvalues v=1/10 {<br>
  set obs `v’<br>
  replace var1=_N if var1==.<br>
}<br>
list</p>
					</div>

            <?php include("../includes/footer-sub-menu.html"); ?>

		</div>
	</div>

    <script src="../js/jquery-1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootswatch.js"></script>

</body></html>

