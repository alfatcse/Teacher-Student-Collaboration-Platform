<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
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

<%!String year, department, course, type;%>
<%
	department = request.getParameter("department");
	year = request.getParameter("year");
	course = request.getParameter("course");
	type = request.getParameter("type");

	String table_name = department + year + course;
	System.out.println(table_name);
	if (year == null) {
		table_name = (String)hs.getAttribute("table_name");
		type=(String)hs.getAttribute("type");
	}

	hs.setAttribute("table_name", table_name);
	hs.setAttribute("type", type);
	//System.out.println("SELECT student_id FROM "+table_name+" WHERE "+type+"=null");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Panel</title>
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
			<a class="navbar-brand" href="#">Teacher </a>
		</div>
		<!-- Top Menu Items -->
		<ul class="nav navbar-right top-nav">


			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-user"></i> <%=name%> <b
					class="caret"></b></a>
				<ul class="dropdown-menu">

					<li class="divider"></li>
					<li><a href="logout"><i class="fa fa-fw fa-power-off"></i>
							Log Out</a></li>
				</ul></li>
		</ul>
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="TeacherPanel.jsp"><i
						class="fa fa-fw fa-dashboard"></i> Teacher Panel</a></li>
				<li ><a href="TakeAttendance.jsp"><i
						class="fa fa-fw fa-bar-chart-o"></i>Take Attendance</a></li>
				<li  class="active"><a href="InsertMarks.jsp"><i class="fa fa-fw fa-table"></i>
						Insert Marks</a></li>
				<li><a href="NewCourse.jsp"><i
						class="fa fa-fw fa-desktop"></i> Start New Course</a></li>
				<li><a href="ViewCourseRequest.jsp"><i
						class="fa fa-fw fa-wrench"></i> Review Course Request</a></li>
						<li><a href="StudentDetailsTeacher.jsp"><i
						class="fa fa-fw fa-wrench"></i> View Student Details</a></li>
				
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">


			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Insert Marks: <small></small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="container">
						<form id="contact" action="InsertMarksAction.jsp" method="post">
							<h3><%=type%></h3>
							<fieldset>
								<select name="student_id">
									<%
										ServletContext sc = getServletContext();
										Connection con = (Connection) sc.getAttribute("MyConn");
										PrintWriter pw = response.getWriter();

										try {

											PreparedStatement ps = con.prepareStatement("SELECT student_id FROM \"" + table_name + "\" WHERE \""
													+ type + "\" IS NULL ORDER BY student_id");
											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
									%>


									<option value="<%=rs.getString("student_id")%>"><%=rs.getString("student_id")%></option>


									<%
										}

										} catch (SQLException ex) {
											System.out.println(ex);
										}
									%>
								</select>
							</fieldset>


							<fieldset>
								<input placeholder="Marks" type="number" tabindex="2"
									name="marks" required autofocus>
							</fieldset>




							<fieldset>
								<button name="submit" type="submit" id="contact-submit"
									data-submit="...Sending">Insert</button>
							</fieldset>

						</form>
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

	<script src="js/ViewCourseRequest.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>
</body>