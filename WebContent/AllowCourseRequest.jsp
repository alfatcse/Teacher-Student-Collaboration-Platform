<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
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
<%
ServletContext sc = getServletContext();
Connection con = (Connection) sc.getAttribute("MyConn");
PrintWriter pw = response.getWriter();

String student_id = request.getParameter("student_id");
String department = request.getParameter("department");
String course_code = request.getParameter("course_code");
String course_year = request.getParameter("course_year");
String table_name = department+course_year+course_code;

//System.out.println("INSERT INTO "+table_name+" ( student_id ) VALUES ('"+student_id+"')");


try {

	PreparedStatement ps=con.prepareStatement("INSERT INTO "+table_name+" ( student_id ) VALUES ('"+student_id+"')");
    ps.execute();
    
    PreparedStatement ps2=con.prepareStatement("DELETE FROM course_request WHERE table_name_student_id='"+table_name+student_id+"'");
    ps2.execute();
  
} catch (Exception ex) {
	System.out.println(ex);
}
%>

</body>
</html>