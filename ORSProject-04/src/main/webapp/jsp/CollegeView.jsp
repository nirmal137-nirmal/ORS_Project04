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


	<form action="<%=ORSView.COLLEGE_CTL%>" method="post">
	
		<div align="center">

			<h1>Add College</h1>

			<h3 style="color: green"><%=succ%></h3>
			<h3 style="color: red"><%=error%></h3>


			<table>

				<tr>
					<th align="left">CollegeName<font color="red"></font></th>
					<td><input type="text" name="name" value=""
						placeholder="enter your college name"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("name", request)%></td>
				</tr>

				<tr>
					<th align="left">Address<font color="red"></font></th>
					<td><input type="text" name="address" value=""
						placeholder="enter your address"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("address", request)%></td>
				</tr>

				<tr>
					<th align="left">State<font color="red"></font></th>
					<td><input type="text" name="state" value=""
						placeholder="enter your state"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("state", request)%></td>
				</tr>

				<tr>
					<th align="left">City<font color="red"></font></th>
					<td><input type="text" name="city" value=""
						placeholder="enter your city"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("city", request)%></td>
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