<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
	ServletContext sc = getServletContext();
	Connection con = (Connection) sc.getAttribute("MyConn");
	PrintWriter pw = response.getWriter();

	HttpSession hs = request.getSession();
	String table_name = (String) hs.getAttribute("table_name");
	String date = (String) hs.getAttribute("date");
	
	try {

		PreparedStatement ps = con
				.prepareStatement("alter table " + table_name + " add( \"" + date + "\" NUMBER NULL)");
		ps.execute();

	} catch (Exception ex) {
		System.out.println(ex);
	}
	

	Enumeration paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
		String paramName = (String) paramNames.nextElement();
		PreparedStatement ps = con.prepareStatement("UPDATE " + table_name + " SET \"" + date + "\" = 1 WHERE student_id = " + paramName);
		try {
			ps.execute();
		} catch (Exception ex) {
			System.out.println(ex);
		}
	}
	hs.removeAttribute("table_name");
	hs.removeAttribute("date");
	
	pw.println("<font color=green size=5>Operation Successfull.</font>");
	response.setHeader("Refresh", "3;url=TeacherPanel.jsp");
%>