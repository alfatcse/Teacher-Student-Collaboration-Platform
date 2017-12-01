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
<%
PrintWriter pw = response.getWriter();
HttpSession hs = request.getSession();
String email = (String) hs.getAttribute("email");
String name = (String) hs.getAttribute("name");

if (email == null) {
	//PrintWriter pw = response.getWriter();
	pw.println("<font color=red size=5>You are not logged in.</font>");
	response.setHeader("Refresh", "3;url=index.jsp");
	throw new javax.servlet.jsp.SkipPageException();

}
;



String name1 = request.getParameter("name");
String conno = request.getParameter("conno");
String gname = request.getParameter("gname");
String gconno = request.getParameter("gconno");
String pass = request.getParameter("pass");


try {
	ServletContext sc=getServletContext();

	Connection con=(Connection)sc.getAttribute("MyConn");
	PreparedStatement ps = con.prepareStatement("update STUDENT set name=?,conu=?,gname=?,gconu=?,password=? where email='" + email + "'");
	ps.setString(1, name);
	ps.setString(2, conno);
	ps.setString(3, gname);
	ps.setString(4, gconno);
	ps.setString(5, pass );

	
	
	ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
    	

	
	
	ps.execute();
	pw.println("<h1><font color=red>Data Updateded Successfullty</font></h1>");
	response.setHeader("Refresh", "2;url=index.jsp");
    }
} catch (Exception ex) {
	pw.println(ex);
}



%>

</body>
</html>