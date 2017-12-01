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
				<a class="navbar-brand" href="#">Student </a>
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
				<li ><a href="Selectidforview.jsp"><i
						class="fa fa-fw fa-bar-chart-o"></i>View Student Details</a></li>
				<li class="active"><a href="ViewOwnDetails.jsp"><i class="fa fa-fw fa-table"></i>
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

				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						 <h2><%= name %>'s Information</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <td><h4>Attributes:</h4></td>
                                       
                                        <td><h4>Details:</h4></td>
                                    </tr>
                                </thead>
                                
  
  

  
   <% 
 

try
{
	ServletContext sc=getServletContext();
	
	Connection con=(Connection)sc.getAttribute("MyConn");
	
    PreparedStatement ps=con.prepareStatement("Select * from STUDENT where email='" + email + "'" );
  
    
    
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
    	%>               
                                
                                
                                <tbody>
                                    <tr class="active">
                                        <td><h5>Student Id</h5></td>
                                        
                                        <td><h5><%=rs.getString(1) %></h5></td>
                                    </tr>
                                    <tr class="success">
                                        <td><h5>Name</h5></td>
                                       
                                        <td><h5><%=rs.getString(2) %></h5></td>
                                    </tr>
                                    <tr class="warning">
                                        <td><h5>Email</h5></td>
                                        
                                        <td><h5><%=rs.getString(3) %></h5></td>
                                    </tr>
                                    <tr class="danger">
                                        <td><h5>Department</h5></td>
                                        
                                        <td><h5><%=rs.getString(4) %></h5></td>
                                    </tr>
                                    
                                     <tr class="active">
                                        <td><h5>Session</h5></td>
                                        
                                        <td><h5><%=rs.getString(5) %></h5></td>
                                    </tr>
                                    
                                     <tr class="success">
                                        <td><h5>Contact Number</h5></td>
                                       
                                        <td><h5><%=rs.getString(6) %></h5></td>
                                    </tr>
                                    
                                     <tr class="danger">
                                        <td><h5>Guardian Name</h5></td>
                                        
                                        <td><h5><%=rs.getString(7) %></h5></td>
                                    </tr>
                                    
                                     <tr class="active">
                                        <td><h5>Guardian Contact Number</h5></td>
                                        
                                        <td><h5><%=rs.getString(8) %></h5></td>
                                    </tr>
                                     <tr class="success">
                                        <td><h5>Password</h5></td>
                                       
                                        <td><h5><%=rs.getString(10) %></h5></td>
                                    </tr>
                                  
                                    
                                </tbody>
                                
                                <a href="StudentChangepass.jsp"><h3>Change Details!!</h3></a>
                                <%
    }
}catch(Exception ex)
{
	System.out.println(ex);
}
                                
                                
                                
                %>
                            </table>
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