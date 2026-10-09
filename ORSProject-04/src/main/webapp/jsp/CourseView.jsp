<!DOCTYPE html>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
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

	<form action="<%=ORSView.COURSE_CTL%>" method="post">

		<div align="center">
			<h1>Add Course</h1>

			<h3 style="color: green"><%=succ%></h3>
			<h3 style="color: red"><%=error%></h3>

			<table>

				<tr>
					<th align="left">Course Name<font color="red">*</font></th>
					<td><input type="text" name="courseName" value=""
						placeholder="enter your courseName"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("courseName", request)%></td>
				</tr>

				<tr>
					<th align="left">Course Description<font color="red">*</font></th>
					<td><input type="text" name="description" value=""
						placeholder="enter course description"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("description", request)%></td>
				</tr>

				<tr>
					<th align="left">Course Duration<font color="red">*</font></th>
					<td><input type="text" name="duration" value=""
						placeholder="enter course duration"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("duration", request)%></td>
				</tr>

				<tr>
					<th></th>
					<td colspan="2" align="center"><input type="submit"
						name="operation" value="<%=BaseCtl.OP_SAVE%>"></td>

				</tr>

			</table>
		</div>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>