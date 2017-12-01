<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%!String email, password;%>
<%
email = request.getParameter("email");
password = request.getParameter("password");

try
{
	
	
	ServletContext sc = getServletContext();

	Connection con = (Connection) sc.getAttribute("MyConn");

	PreparedStatement ps = con.prepareStatement("Select * from STUDENT where email=? and password=? ");

	ps.setString(1, email);
	ps.setString(2, password);
	ps.execute();

	 // PrintWriter pw=response.getWriter();
	
   //  pw.println("insert...");
   HttpSession hs = request.getSession();

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				hs.setAttribute("semail", email);
				hs.setAttribute("sname", rs.getString("name"));
				hs.setAttribute("student_id", rs.getString("id"));
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "StudentPanel.jsp");

			} else {
				response.setHeader("Refresh", "3;url=Studentlog.jsp");
	%>
	<center><Font color=red size=5>Login failed. Please try again.</Font></center>
	 <%@include file="Studentlog.jsp" %>

	<%
		}

	
}
catch (Exception ex) {
	System.out.println(ex);
}


%>


</body>
</html>