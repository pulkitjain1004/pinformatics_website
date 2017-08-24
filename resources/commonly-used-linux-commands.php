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
				
				<h1 class="entry-title">Commonly Used Linux Commands</h1>
								</header><!-- .entry-header -->

				<div class="entry-content">
			<table cellpadding="1" border="1">
<tbody><tr>
<td><b>The Command</b></td>
<td><b>What it Means</b></td>
<td><b>Example</b></td>
<td><b>Output</b></td>
</tr>
<tr>
<td>man <i>command</i></td>
<td>“Manual.”  This displays the help pages for a command.  Hit the space bar to scroll through each screen, and hit “q” to quit.</td>
<td>man ls</td>
<td>Displays help for the command “ls”.</td>
</tr>
<tr>
<td>ls</td>
<td>“List.”  Displays the contents of your current directory (folder).</td>
<td>ls</td>
<td>A list of file names.</td>
</tr>
<tr>
<td>ls -l</td>
<td>“List.” The “-l” means “list in long format.”  Information such as the time a file was last modified is displayed.</td>
<td>ls -l</td>
<td>A list of file names with info about each file is displayed. </td>
</tr>
<tr>
<td>cd <i>dirname</i> </td>
<td> “Change Directory.”  Changes your current directory (folder) to ~~dirname~~.</td>
<td>cd mySasProgs</td>
<td>You are now in folder “mySasProgs.” </td>
</tr>
<tr>
<td>pwd </td>
<td> “Print Working Directory.”  Prints the name of the directory (folder) you are in. </td>
<td> pwd </td>
<td> Displays the name of a folder.</td>
</tr>
<tr>
<td>cd ~ </td>
<td> “Change Directory.”  Changes your current directory (folder) to your home directory.  Your home directory is the folder you are in when you first login. </td>
<td> cd ~ </td>
<td> You are now in your home directory. </td>
</tr>
<tr>
<td>cd .. </td>
<td> “Change Directory.”  Makes your current directory move up one directory. </td>
<td> cd .. </td>
<td> If you were in folder “mySasProgs/Prog1/”, after you enter “cd ..”, you will be in “mySasProgs/”. </td>
</tr>
<tr>
<td>mkdir <i>dirname</i> </td>
<td> “Make Directory.”  Makes a new directory (folder) called <i>dirname</i>. </td>
<td> mkdir sasPrograms </td>
<td> No output, but a directory called “sasPrograms” has been created. </td>
</tr>
<tr>
<td>cat <i>filename</i> </td>
<td> “Concatenate”. Displays the contents of ~~filename~~. </td>
<td> cat prog1.sas </td>
<td> The contents of “prog1.sas” </td>
</tr>
<tr>
<td>more <i>filename</i> </td>
<td> “More”. Displays the contents of ~~filename~~ a screen at a time.  Hit the space bar to scroll through each screen, and hit “q” to quit. </td>
<td> more prog1.sas </td>
<td> Displays “prog1.sas” a screen at a time. </td>
</tr>
<tr>
<td>pico <i>filename</i> </td>
<td> This is a program to let you edit a file.  It is a very basic Word Processor (like Notepad).  For more info on how to use this editor, see: http://www.udel.edu/topics/software/general/editors/unix/pico/picotips.html. </td>
<td> pico program1.sas </td>
<td> Opens “program1.sas” for editing.</td>
</tr>
<tr>
<td>!<i>letters</i> </td>
<td> Repeats the last command that started with ~~letters~~. </td>
<td> !s </td>
<td> Repeats the last command that started with s.</td>
</tr>
<tr>
<td>cp <i>source</i> <i>destination</i> </td>
<td> “Copy”.  Copies <i>source</i> to <i>destination</i> (-p : perserve timestamp). </td>
<td> cp program1.sas program1Backup.sas </td>
<td> Makes a copy of “program1.sas” and calls it “program1Backup.sas”</td>
</tr>
<tr>
<td>mv <i>source</i> <i>destination</i> </td>
<td> “Move”.  Moves <i>source</i> to <i>destination</i>.  You can also think of this command as the “Rename” command. </td>
<td> mv program1.sas sampleProgram.sas </td>
<td> Renames “program1.sas” to “sampleProgram.sas”</td>
</tr>
<tr>
<td>rm <i>filename</i> </td>
<td> “Remove.” Deletes <i>filename</i>. </td>
<td> rm testProgram.sas </td>
<td> Removes testProgram.sas</td>
</tr>
<tr>
<td>rmdir <i>dirname</i> </td>
<td> “Remove Directory.” Deletes the directory (folder) ~~dirname~~. </td>
<td> rm temp </td>
<td> Removes the directory called “temp.” </td>
</tr>
<tr>
<td>msas9 <i>filename</i></td>
<td> Runs SAS in batch mode on file  <i>filename</i>.</td>
<td> msas9 program1.sas </td>
<td>  Runs SAS on “program1.sas”.</td>
</tr><tr>
</tr><tr>
<td>grep <i>pattern</i><i>filename</i></td>
<td> Displays all of the lines in <i>filename</i> that contain <i>pattern</i>. </td>
<td> grep obs a.log </td>
<td> Displays any line in “a.log” that contains the word “obs” </td>
</tr>
<tr>
<td>chmod g+s <i>dirname</i> </td>
<td>  enable sticky bit for group(a: all, u: user) ownership </td>
<td>chmod g+s data </td>
<td> files created under data/ will now by default share group ownership with data</td>
</tr>
<tr>
<td>pts membership <i>username</i> </td>
<td> Displays all of the AFS groups of which user <i>username</i> is a member </td>
<td> pts membership vanbusum </td>
<td> A list of groups, such as “workfirst” and “graduate”</td>
</tr>
<tr>
<td>pts membership <i>groupname</i> </td>
<td> Displays all the users of the AFS group </td>
<td> pts membership workfirst </td>
</tr>
<tr>
<td>fs la(sa) dir userid acesslist </td>
<td> list (set) access for dir for userid </td>
<td> fs la . workfirst rlikwa or fs sa . kum none </td>
<td> permission changes</td>
</tr>
<tr>
<td>pts adduser uid gid </td>
<td> add user to group </td>
<td> . </td>
<td> .</td>
</tr>
<tr>
<td>pts removeuser uid gid </td>
<td> remove user to group </td>
<td> . </td>
<td> . </td>
</tr>
<tr>
<td>pts creategroup gid</td>
<td> create group </td>
<td> group name kum:grp </td>
<td> . </td>
</tr>
<tr>
<td>pts delete gid</td>
<td> delete group </td>
<td> group name kum:grp </td>
<td> . </td>
</tr>
<tr>
<td>ln -s path fn </td>
<td> create a symbolic link. when you want to make a direct link to a dir </td>
<td> ln -s /afs/isis/projects/workfirst/workfirst/data/ wf </td>
<td> a link to paht named fn is created </td>
</tr>
<tr>
<td>du -h</td>
<td> Disk Usage </td>
<td></td>
<td></td>
</tr>
<tr>
<td>df -h </td>
<td>Disk status on NFS</td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody></table>
					</div>
				
			</div>

            <?php include("../includes/footer-sub-menu.html"); ?>

		</div>
	</div>

    <script src="../js/jquery-1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootswatch.js"></script>

</body></html>

