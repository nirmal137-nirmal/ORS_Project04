<!DOCTYPE html>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	%>
	<%@ include file="Header.jsp"%>

	<div align="center">

		<h1><%=ms.get("login.title")%></h1>

		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>

		<form action="<%=ORSView.LOGIN_CTL%>" method="post">

			<table>

				<tr>
					<th align="left"><%=ms.get("login.email")%><font color="red">*</font></th>
					<td><input type="text" name="login"
						placeholder="enter you login" value=""></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("login", request)%></td>
				</tr>

				<tr>
					<th align="left"><%=ms.get("login.password")%><font
						color="red">*</font></th>
					<td><input type="password" name="password"
						placeholder="enter you password" value=""></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("password", request)%></td>
				</tr>

				<tr>
					<th></th>
					<td><input type="submit" name="operation"
						value="<%=LoginCtl.OP_SIGNIN%>"></td>
				</tr>

			</table>

			<p>
				<a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><%=ms.get("login.forgotpassword")%></a>
			</p>

		</form>

	</div>

	<%@include file="Footer.jsp"%>
</body>
</html>