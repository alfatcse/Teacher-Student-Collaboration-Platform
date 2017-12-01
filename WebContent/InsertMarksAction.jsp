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
		HttpSession hs = request.getSession();
		String table_name = (String) hs.getAttribute("table_name");
		String type = (String) hs.getAttribute("type");
		
		String student_id=request.getParameter("student_id");
		String marks=request.getParameter("marks");
		
		ServletContext sc = getServletContext();
		Connection con = (Connection) sc.getAttribute("MyConn");
		PrintWriter pw = response.getWriter();

		try {

			PreparedStatement ps = con
					.prepareStatement("UPDATE "+table_name+" SET \""+type+"\" = '"+marks+"' WHERE student_id = '"+student_id+"'");
			ps.execute();
			response.setHeader("Refresh", "0;url=InsertMarksFetcher.jsp");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	%>

</body>
</html>