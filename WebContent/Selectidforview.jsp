<%-- Begin Project Login Authenticator --%>
<%@page import="java.io.PrintWriter"%>
<%
	HttpSession hs = request.getSession();
	String email = (String) hs.getAttribute("semail");
	String name = (String) hs.getAttribute("sname");

	if (email == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<font color=red size=5>You are not logged in.</font>");
		response.setHeader("Refresh", "3;url=index.jsp");
		throw new javax.servlet.jsp.SkipPageException();

	}
	;
%>
<%-- End Project Login Authenticator --%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Student Details.</title>
<link rel="stylesheet" href="TeacherPanelStyle.css" type="text/css" />

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
   
    
    

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> Student</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i> <%= name %> <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						
						<li class="divider"></li>
						<li><a href="logout"><i class="fa fa-fw fa-power-off"></i> Log
								Out</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
							<ul class="nav navbar-nav side-nav">
				<li><a href="StudentPanel.jsp"><i
						class="fa fa-fw fa-dashboard"></i>Student Panel</a></li>
				<li class="active"><a href="Selectidforview.jsp"><i
						class="fa fa-fw fa-bar-chart-o"></i>View Student Details</a></li>
				<li><a href="ViewOwnDetails.jsp"><i class="fa fa-fw fa-table"></i>
						Own Information</a></li>
				<li><a href="StudentChangepass.jsp"><i class="fa fa-fw fa-edit"></i>
						Change information</a></li>
				
				<li><a href="AssignmentSubmission.jsp"><i
						class="fa fa-fw fa-desktop"></i>Submit Assignment</a></li>
				
				
			</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="container">
					<br>
						<br>
						<br>
						<br>
						<br><br>
						
						<br>
						<br>
						<form id="contact" action="ViewStudentDetails.jsp" method="post">
							<h3>Fill the ID Number</h3>

							<fieldset>
								<input placeholder="Student ID" type="text"
									tabindex="1" name="id" required autofocus>
							</fieldset>
							
							<fieldset>
								<button name="submit" type="submit" >Submit</button>
							</fieldset>

						</form>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
					</div>
						
						
						
						<!-- <li style="float:left;"><select name="department">
									<option value="CSE">CSE</option>
									<option value="EEE">EEE</option>
									<option value="MAT">MAT</option>
									<option value="ACCE">ACCE</option>
							</select></li>
							
							<li style="float:left;"><select name="year" >
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
							</select></li>
							
							<li style="float:left;"><select name="course">
									<option value="CSE154">CSE154</option>
									<option value="EEE256">EEE256</option>
									<option value="MAT112">MAT112</option>
									<option value="CSE402">CSE402</option>
							</select></li>
							
							<li style="float:left;">
							<input type="date" name="date" >
							</li>
							
							<li>
							<input type="submit" name="go" value="GO" onclick="" >
							</li>-->
							</form>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<!-- Flot Charts -->
				
				<!-- /.row -->

			
				<!-- /.row -->

				
				<!-- /.row -->

				
				<!-- /.row -->

				
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>

	<!-- Flot Charts JavaScript -->
	<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
	<script src="js/plugins/flot/jquery.flot.js"></script>
	<script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="js/plugins/flot/jquery.flot.pie.js"></script>
	<script src="js/plugins/flot/flot-data.js"></script>

</body>

</html>
