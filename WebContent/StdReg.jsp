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
<form method="post" name="fl"  action="StudentRegs.jsp" >
<table align="center" width="50%" border="0">
<tr>
<td><h3>Student ID:</h3>
<input type="text" name="id" placeholder="Your Id" required /></td>
</tr>


<tr>
<td><h3>Name:</h3>
<input type="text" name="name" placeholder="Your Name" required /></td>
</tr>
<tr>
<td><h3>Email:</h3><input type="text" name="email" placeholder="Your Email" required /></td>
</tr>

<tr>
<td><h3>Department: </h3><select  id="dept" name="dept" placeholder="Your dapt." >

<option value=""></option>
<option value="CSE">CSE</option>
<option value="EEE">EEE </option>
<option value="ACCE">ACCE</option>
<option value="APECE">APECE</option>

</select></td>
</tr>
<tr>
<td><h3>Season: </h3><select  id="sesion" name="sesion" >

<option value=""></option>
<option value="2011-2012">2011-2012</option>
<option value="2012-2013">2012-2013</option>
<option value="2013-2014">2013-2014 </option>
<option value="2014-2015">2014-2015</option>
<option value="2015-2016">2015-2016</option>
<option value="2016-2017">2016-2017</option>

</select></td>
</tr>
<tr>
<td><h3>Contract No:</h3><input type="text" name="conu" placeholder="Contract Number" required /></td>
</tr>

<!--  <tr>
<td><h3>Upload Your Picture: </h3> <input type="file" name="file"/> </td>
</tr>
-->
<tr>
<td><h3>Guardian Name:</h3>
<input type="text" name="gname" placeholder="Your Guardian Name" required /></td>
</tr>
<td><h3>Guardian Contract No:</h3><input type="text" name="gconu" placeholder="Guardian Contract Number" required /></td>
</tr>



<tr>
<td><h3>User name:</h3><input type="text" name="user_name" placeholder="User Name" required /></td>
</tr>
<tr>
<td><h3>Password:</h3><input type="password" name="password" placeholder="Password" required /></td>
</tr>
<tr>
<td><button type="submit" name="btn-signup">Register</button></td>

</tr>

<tr>
<td><a href="Studentlog.jsp"> Login here...</a></td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>