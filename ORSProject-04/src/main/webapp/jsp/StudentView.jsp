<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	%>

	<%@ include file="Header.jsp"%>

	<form action="<%=ORSView.STUDENT_CTL%>" method="post">

		<div align="center">

			<h1>Add Student</h1>
			

			<h3 style="color: green"><%=succ%></h3>
			<h3 style="color: red"><%=error%></h3>

			<table>

				<tr>
					<th align="left">FirstName<font color="red">*</font></th>
					<td><input type="text" name="firstName" value=""
						placeholder="enter your firstName"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("firstName", request)%></td>
				</tr>

				<tr>
					<th align="left">LastName<font color="red">*</font></th>
					<td><input type="text" name="lastName" value=""
						placeholder="enter your lastName"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("lastName", request)%></td>
				</tr>

				<tr>
					<th align="left">Email<font color="red">*</font></th>
					<td><input type="email" name="email" value=""
						placeholder="enter your email"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("email", request)%></td>
				</tr>
				<tr>
					<th align="left">Mobile No.<font color="red">*</font></th>
					<td><input type="text" name="mobileNo" value=""
						placeholder="enter your mobileNo"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></td>
				</tr>
				<tr>
					<th align="left">College<font color="red">*</font></th>
					<td><select name='collegeId'>
							<option selected value=''>------------Select-------------</option>
							<option value='1'>Shri Vaishnav College</option>
							<option value='2'>Holkar College</option>
							<option value='3'>GSITS College</option>
							<option value='4'>Mdicaps College</option>
							<option value='5'>Acropolis College</option>
					</select></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("collegeId", request)%></td>
				</tr>

				<tr>
					<th align="left">DOB<font color="red">*</font></th>
					<td><input type="date" name="dob" value=""></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("dob", request)%></td>
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