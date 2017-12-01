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
	
	String department = request.getParameter("department");
	String course_code = request.getParameter("course_code");
	String course_year = request.getParameter("course_year");
	String table_name = department+course_year+course_code;
	
	HttpSession hs = request.getSession();
	String email = (String)hs.getAttribute("semail");
	String student_id = (String)hs.getAttribute("student_id");
	String student_name = (String)hs.getAttribute("sname");
	String teacher_id=null;
	
	try {

		PreparedStatement ps=con.prepareStatement("SELECT teacher_id from  COURSE where table_name='"+table_name+"'");

        ResultSet rs=ps.executeQuery();
      
        while(rs.next())
        {
        	teacher_id = rs.getString("teacher_id");	
        }

	} catch (SQLException ex) {
		System.out.println(ex);
	}
	
	if(teacher_id==null)
	{
		pw.println("<font color=red size=5>No course found.</font>");
		response.setHeader("Refresh", "3;url=StudentPanel.jsp");
		throw new javax.servlet.jsp.SkipPageException();	
	} else {
	
	try {

		PreparedStatement ps=con.prepareStatement("insert into  COURSE_REQUEST values(?,?,?,?,?,?,?)");
		
        ps.setString(1,table_name+student_id); 
        ps.setString(2,student_id);
        ps.setString(3,course_code);
        ps.setString(4,department);
        ps.setString(5,course_year);
        ps.setString(6,teacher_id);
        ps.setString(7,student_name);

        
        ps.execute();
      
        pw.println("<font color=green size=4>Operation Successfull. Please wait for the teacher response.</font>");
        response.setHeader("Refresh", "5;url=StudentPanel.jsp");
        throw new javax.servlet.jsp.SkipPageException();

	} catch (SQLException ex) {
		System.out.println(ex);
		pw.println("<font color=red size=5>Already Requested.</font>");
		response.setHeader("Refresh", "3;url=StudentPanel.jsp");
	}
	}
%>

</body>
</html>