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
<%! String name,email,una,pwd; %>


	<% 	 name=request.getParameter("name");
		 //age=Integer.parseInt(request.getParameter("age"));
		email=request.getParameter("email");
		 pwd=request.getParameter("pass");

		try
		{
		
			ServletContext sc=getServletContext();
		
			Connection con=(Connection)sc.getAttribute("MyConn");
			PrintWriter pw=response.getWriter();
		
            PreparedStatement ps=con.prepareStatement("insert into  TEACHER values(?,?,?)");
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,pwd);
            ps.execute();
         
          
         	 %>
         	 <center><br><Font color=green size=5 > <%=name %>Registration successful.</Font><br></center>
         	<%@include file="tlog.jsp"  %>
         	
         
         		 
         	 <% 
         	 
         	 
		
	
		
		}
		catch(Exception ex)
		{
			System.out.println(ex);
			%>
    		 <Font color=red size=5 >Ragistration failed.</Font>
    		
    		 <%@include file="treg.jsp" %>
    		 <%
		}
		%>
</body>
</html>