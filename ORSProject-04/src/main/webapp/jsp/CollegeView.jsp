<!DOCTYPE html>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.CollegeCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Add-College</title>
</head>
<body>

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.CollegeBean"
		scope="request"></jsp:useBean>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	%>
	<%@ include file="Header.jsp"%>

	<div align="center">

		<h1><%=bean != null && bean.getId() > 0 ? "Update College" : "Add College"%></h1>

		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>


		<form action="<%=ORSView.COLLEGE_CTL%>" method="post">

			<input type="hidden" name="id"
				value="<%=DataUtility.getStringData(bean.getId())%>">

			<table>

				<tr>
					<th align="left">CollegeName<font color="red"></font></th>
					<td><input type="text" name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>"
						placeholder="enter your college name"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("name", request)%></td>
				</tr>

				<tr>
					<th align="left">Address<font color="red"></font></th>
					<td><input type="text" name="address"
						value="<%=DataUtility.getStringData(bean.getAddress())%>"
						placeholder="enter your address"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("address", request)%></td>
				</tr>

				<tr>
					<th align="left">State<font color="red"></font></th>
					<td><input type="text" name="state"
						value="<%=DataUtility.getStringData(bean.getState())%>"
						placeholder="enter your state"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("state", request)%></td>
				</tr>

				<tr>
					<th align="left">City<font color="red"></font></th>
					<td><input type="text" name="city"
						value="<%=DataUtility.getStringData(bean.getCity())%>"
						placeholder="enter your city"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("city", request)%></td>
				</tr>

				<tr>
					<th></th>
					<td><input type="submit" name="operation"
						value="<%=CollegeCtl.OP_SAVE%>"></td>
				</tr>

			</table>

		</form>
	</div>

	<%@ include file="Footer.jsp"%>

</body>
</html>