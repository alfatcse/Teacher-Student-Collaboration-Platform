<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<center>
</br>
</br>
<h3>Registration Form</h3>
<div id="login-form">
<form method="post" name="fl"  action="tregs.jsp" >
<table align="center" width="30%" border="0">

<tr>
<td><h3>Name:</h3>
<input type="text" name="name" placeholder="Your Name" required /></td>
</tr>
<tr>
<td><h3>Email:</h3><input type="text" name="email" placeholder="Your Email" required /></td>
</tr>

<tr>
<td><h3>Password:</h3><input type="password" name="pass" placeholder="Password" required /></td>
</tr>
<tr>
<td><button type="submit" name="btn-signup">Register</button></td>
</tr>
<tr>
<td><a href="tlog.jsp"> Login here.</a></td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>