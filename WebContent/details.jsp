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
<table border="1" align="center">
<tr>
<td>Name</td>
<td>Age</td>
<td>City</td>
<td>User name</td>

</tr>
<% 

try
{
	ServletContext sc=getServletContext();
	
	Connection con=(Connection)sc.getAttribute("MyConn");
	
    PreparedStatement ps=con.prepareStatement("Select * from STUDENT  ");
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
    	%>
    	<tr>
    	<td><%=rs.getString(1)%></td>
    	<td><%=rs.getString(2)%></td>
    	<td><%=rs.getString(3)%></td>
    	<td><%=rs.getString(4)%></td>
    	
    	</tr>
    	<% 
    	
    }
}
	catch(Exception ex)
	{
		System.out.println(ex);
	}


%>
</table>

</body>
</html>