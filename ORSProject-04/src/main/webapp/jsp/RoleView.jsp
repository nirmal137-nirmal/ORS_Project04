<!DOCTYPE html>
<%@page import="in.co.rays.proj4.controller.RoleCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- bean ko view pe get kr skte hai -->
	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.RoleBean"
		scope="request">
	</jsp:useBean>


	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);

	/*  bean ko view pe get kr skte hai */
	/*  RoleBean bean = (RoleBean) request.getAttribute("bean"); */
	%>
	<%@ include file="Header.jsp"%>

	<div align="center">

		<h1><%=bean != null && bean.getId() > 0 ? "Update Role" : "Add Role"%></h1>

		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>

		<form action="<%=ORSView.ROLE_CTL%>" method="post">

			<input type="hidden" name="id"
				value="<%=DataUtility.getStringData(bean.getId())%>">


			<table>

				<tr>
					<th align="left">Name<font color="red">*</font></th>
					<td><input type="text" name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>"
						placeholder="enter role name"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("name", request)%></td>
				</tr>

				<tr>
					<th align="left">Description<font color="red">*</font></th>
					<td><input type="text" name="description"
						value="<%=DataUtility.getStringData(bean.getDescription())%>"
						placeholder="enter role description"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("description", request)%></td>
				</tr>

				<tr>
					<th></th>
					<td><input type="submit" name="operation"
						value="<%=BaseCtl.OP_SAVE%>"></td>
				</tr>



			</table>
		</form>
	</div>


	<%@ include file="Footer.jsp"%>
</body>
</html>