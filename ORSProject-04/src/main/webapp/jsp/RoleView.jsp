<!DOCTYPE html>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	%>
	<%@ include file="Header.jsp"%>



	<form action="<%=ORSView.ROLE_CTL%>" method="post">

		<div align="center">

			<h1>Add Role</h1>

			<h3 style="color: green"><%=succ%></h3>
			<h3 style="color: red"><%=error%></h3>

			<table>

				<tr>
					<th align="left">Name<font color="red">*</font></th>
					<td><input type="text" name="name" value=""
						placeholder="enter role name"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("name", request)%></td>
				</tr>

				<tr>
					<th align="left">Description<font color="red">*</font></th>
					<td><input type="text" name="description" value=""
						placeholder="enter role description"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("description", request)%></td>
				</tr>

				<tr>
					<th></th>
					<td><input type="submit" name="operation"
						value="<%=BaseCtl.OP_SAVE%>"></td>
				</tr>



			</table>

		</div>
	</form>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>