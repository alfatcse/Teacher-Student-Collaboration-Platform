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

		</br> </br> </br>
		<h3>LOGIN FORM</h3>
		<div id="login-form">
			<form method="post" name="f1" action="tvalidate.jsp">
				<table align="center" width="30%" border="0">
					<tr>
						<td><h3>EMAIL:</h3>
							</br>
						<input type="text" name="email" placeholder="Registered Email"
							required /></td>
					</tr>
					<tr>
						<td><h3>PASSWORD:</h3>
							</br>
						<input type="password" name="pass" placeholder="password" required /></td>
					</tr>
					<tr>
						<td><button type="submit" name="btn-login">Log in</button></td>
					</tr>
					<tr>
						<td><a href="treg.jsp"> New Teachers register here...</a></td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>