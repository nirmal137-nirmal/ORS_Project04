<!DOCTYPE html>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.SubjectCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Add-Subject</title>
</head>
<body>

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.SubjectBean"
		scope="request"></jsp:useBean>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	%>

	<%@ include file="Header.jsp"%>

	<div align="center">

		<h1><%=bean != null && bean.getId() > 0 ? "Update Subject" : "Add Subject"%></h1>


		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>

		<form action="<%=ORSView.SUBJECT_CTL%>" method="post">

			<input type="hidden" name="id"
				value="<%=DataUtility.getStringData(bean.getId())%>">

			<table>
				<tr>
					<th align="left">Name<font color="red">*</font></th>
					<td><input type="text" name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>"
						placeholder="enter subject name"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("name", request)%></td>
				</tr>

				<tr>
					<th align="left">Description<font color="red">*</font></th>
					<td><input type="text" name="description"
						value="<%=DataUtility.getStringData(bean.getDescription())%>"
						placeholder="enter Subject description"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("description", request)%></td>
				</tr>


				<tr>
					<th align="left">Course <font color="red">*</font>
					</th>
					<td><select name="courseId" required>
							<option value="">-- Select Course --</option>
							<option value="1">Java</option>
							<option value="2">C, C++</option>
							<option value="3">Python</option>
							<option value="4">Web Development</option>
					</select></td>
				</tr>

				<tr>
					<th></th>
					<td><input type="submit" name="operation"
						value=<%=SubjectCtl.OP_SAVE%>></td>

				</tr>

			</table>

		</form>

	</div>

	<%@ include file="Footer.jsp"%>

</body>
</html>