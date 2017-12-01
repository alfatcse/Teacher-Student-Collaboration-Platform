<%-- Begin Project Login Authenticator --%>
<%@page import="java.io.PrintWriter"%>
<%
	HttpSession hs = request.getSession();
	String email = (String) hs.getAttribute("semail");
	String name = (String) hs.getAttribute("sname");
	String id = (String) hs.getAttribute("student_id");

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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Panel</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
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
				<a class="navbar-brand" href="#">Student</a>
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
				<li class="active"><a href="StudentPanel.jsp"><i
						class="fa fa-fw fa-dashboard"></i>Student Panel</a></li>
				<li><a href="Selectidforview.jsp"><i
						class="fa fa-fw fa-bar-chart-o"></i>View Student Details</a></li>
				<li><a href="ViewOwnDetails.jsp"><i class="fa fa-fw fa-table"></i>
						Own Information</a></li>
				<li><a href="StudentChangepass.jsp"><i class="fa fa-fw fa-edit"></i>
						Change information</a></li>
				
				<li><a href="AssignmentSubmission.jsp"><i
						class="fa fa-fw fa-desktop"></i>Submit Assignment</a></li>
				
				
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Student Panel <small> Overview</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> 
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="alert alert-info alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							<i class="fa fa-info-circle"></i> <strong>Thank You</strong>
							 <a
								href="#"
								class="alert-link"><%=name %></a> Quick options and View.
						</div>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">Update</div>
										<div>Change Information</div>
									</div>
								</div>
							</div>
							<a href="StudentChangepass.jsp">
								<div class="panel-footer">
									<span class="pull-left">Modify Information</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">Course</div>
										<div>New Course Request</div>
									</div>
								</div>
							</div>
							<a href="CourseRequest.jsp">
								<div class="panel-footer">
									<span class="pull-left">Make a request to the teacher</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">Information</div>
										<div> Search throw Student Id</div>
									</div>
								</div>
							</div>
							<a href="Selectidforview.jsp">
								<div class="panel-footer">
									<span class="pull-left">Search Information</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-support fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">Own</div>
										<div>View own all details </div>
									</div>
								</div>
							</div>
							<a href="ViewOwnDetails.jsp">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br><br><br><br><br><br><br>
					
					</div>
				</div>
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





</body>