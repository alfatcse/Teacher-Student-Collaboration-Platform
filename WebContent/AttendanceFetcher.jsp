<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
	HttpSession hs = request.getSession();
	String email = (String) hs.getAttribute("temail");
	String name = (String) hs.getAttribute("tname");

	if (email == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<font color=red size=5>You are not logged in.</font>");
		response.setHeader("Refresh", "3;url=index.jsp");
		throw new javax.servlet.jsp.SkipPageException();

	}
	;
%>

<%!String year, department, course, date;%>
<%
	department = request.getParameter("department");
	year = request.getParameter("year");
	course = request.getParameter("course");
	date = (String) request.getParameter("date");

	String table_name = department + year + course;

	ServletContext sc = getServletContext();
	Connection con = (Connection) sc.getAttribute("MyConn");
	PrintWriter pw = response.getWriter();

	//Checking table existence
	try {

		PreparedStatement ps = con.prepareStatement("SELECT * FROM \"" + table_name + "\"");
		ps.execute();

	} catch (SQLException ex) {
		System.out.println(ex);
		pw.println("<font color=red size=5>Course: " + course + ", Departmant: " + department + ", Year: "
				+ year
				+ " is not found.</font><br><font color=green size=5> Please start the course first.</font>");
		response.setHeader("Refresh", "7;url=TeacherPanel.jsp");
		throw new javax.servlet.jsp.SkipPageException();
	}

	//Checking for existing attendance
	try {

		PreparedStatement ps = con.prepareStatement("SELECT \"" + date + "\" FROM \"" + table_name + "\"");
		ps.execute();
		pw.println("<font color=red size=5>Attendance Already Taken for " + date + ".</font>");
		response.setHeader("Refresh", "3;url=TakeAttendance.jsp");
		throw new javax.servlet.jsp.SkipPageException();

	} catch (SQLException ex) {
		System.out.println(ex);
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Bootstrap Admin Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	<link rel="stylesheet" href="TeacherPanelStyle.css" type="text/css" />



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
				<a class="navbar-brand" href="TeacherPanel.jsp">Teacher</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				
					
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i>HI <%=name %> <b
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
				<li><a href="TeacherPanel.jsp"><i
						class="fa fa-fw fa-dashboard"></i> Teacher Panel</a></li>
				<li  class="active"><a href="TakeAttendance.jsp"><i
						class="fa fa-fw fa-bar-chart-o"></i>Take Attendance</a></li>
				<li><a href="InsertMarks.jsp"><i class="fa fa-fw fa-table"></i>
						Insert Marks</a></li>
				<li><a href="NewCourse.jsp"><i
						class="fa fa-fw fa-desktop"></i> Start New Course</a></li>
				<li><a href="ViewCourseRequest.jsp"><i
						class="fa fa-fw fa-wrench"></i> Review Course Request</a></li>
						<li><a href="StudentDetailsTeacher.jsp"><i
						class="fa fa-fw fa-wrench"></i> View Student Details</a></li>
				
			</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Mark Attendance</h1>
					</div>
				</div>
				<!-- /.row -->

				<!-- Flot Charts -->
				<div class="row">
					<div class="col-lg-12">
					<div class="row">
					<div class="container">

					
						<form id="contact" action="AttendanceInsert.jsp" name="attendance_list"
							method="post">
							<%
								try {

									PreparedStatement ps2 = con.prepareStatement("Select * from " + table_name + "  ORDER BY STUDENT_ID");

									ResultSet rs = ps2.executeQuery();

									while (rs.next()) {
							%>
							
							<h4><%=rs.getString("student_id")%>:<input style="float: right; width: 50% ;hight:50%" type="checkbox"
								class="student_list" name="<%=rs.getString("student_id")%>"
								value="1" tabindex="1" autofocus></h4>
								<hr>
								

							<%
								}

								} catch (Exception ex) {
									System.out.println(ex);
								}

								//Inserting table name into session for next page attendance insertion
								HttpSession hs1 = request.getSession();
								hs1.setAttribute("table_name", table_name);
								hs1.setAttribute("date", date);
							%>
							<fieldset>
							<button name="submit" type="submit" id="contact-submit"
									data-submit="...Sending" value="SUBMIT">Submit Attendance</button>
							<!-- <input type="submit" value="SUBMIT">-->
							</fieldset>

						</form>
						
					</div>
				</div>







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
