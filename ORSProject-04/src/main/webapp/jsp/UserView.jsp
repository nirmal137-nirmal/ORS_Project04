<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add-User</title>
</head>
<body>


	<%@ include file="Header.jsp"%>


	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean"
		scope="request"></jsp:useBean>
	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	%>

	<div align="center">

		<h1><%=bean != null && bean.getId() > 0 ? "Update User" : "Add User"%></h1>

		<!-- <h1>Add User</h1> -->

		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>

	</div>


	<div align="center">
		<%
		if (bean.getId() > 0) {
		%>

		<form action="<%=ORSView.UPLOAD_PHOTO_CTL%>" method="POST"
			enctype="multipart/form-data">

			<input type="hidden" name="id" value="<%=bean.getId()%>">

			<table>

				<tr>
					<th>Photo</th>
				</tr>


				<tr>
					<td align="center"><img
						src="<%=ORSView.UPLOAD_PHOTO_CTL%>?id=<%=bean.getId()%>"
						width="80" height="80"
						style="object-fit: cover; border-radius: 50%; border: 1px solid #ccc;">
					</td>
				</tr>




				<tr>
					<td align="center"><input type="file" name="photo"
						accept="image/*"></td>
				</tr>

				<tr>
					<td align="center"><input type="submit" value="Upload Photo">
					</td>
				</tr>

			</table>

		</form>

		<%
		}
		%>
	</div>



	<form action="<%=ORSView.USER_CTL%>" method="post">

		<input type="hidden" name="id"
			value="<%=DataUtility.getStringData(bean.getId())%>">

		<div align="center">

			<table>

				<tr>
					<th align="left">FirstName<font color="red">*</font></th>
					<td><input type="text" name="firstName"
						value="<%=DataUtility.getStringData(bean.getFirstName())%>"
						placeholder="enter your firstName"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("firstName", request)%></td>
				</tr>

				<tr>
					<th align="left">LastName<font color="red">*</font></th>
					<td><input type="text" name="lastName"
						value="<%=DataUtility.getStringData(bean.getLastName())%>"
						placeholder="enter your lastName"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("lastName", request)%></td>
				</tr>

				<tr>
					<th align="left">Login<font color="red">*</font></th>
					<td><input type="text" name="login"
						value="<%=DataUtility.getStringData(bean.getLogin())%>"
						placeholder="enter an emial"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("login", request)%></td>
				</tr>

				<tr>
					<th align="left">Password<font color="red">*</font></th>
					<td><input type="password" name="password"
						value="<%=DataUtility.getStringData(bean.getPassword())%>"
						placeholder="enter an password"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("password", request)%></td>
				</tr>

				<tr>
					<th align="left">ConfirmPassword<font color="red">*</font></th>
					<td><input type="password" name="confirmPassword"
						value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"
						placeholder="re-enter your password"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></td>
				</tr>

				<tr>
					<th align="left">Role<font color="red">*</font></th>
					<td><select name='roleId'>
							<option selected value=''>------------Select-------------</option>
							<option value='1'>Admin</option>
							<option value='2'>Student</option>
							<option value='3'>Faculty</option>
							<option value='4'>College</option>
							<option value='5'>KIOSK</option>
					</select></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("roleId", request)%></td>
				</tr>


				<tr>
					<th align="left">Gender<font color="red">*</font></th>
					<td><select name='gender'>
							<option selected value=''>------------Select-------------</option>
							<option value='female'>female</option>
							<option value='male'>male</option>
					</select></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("gender", request)%></td>
				</tr>

				<tr>
					<th align="left">DOB<font color="red">*</font></th>
					<td><input type="date" name="dob"
						value="<%=DataUtility.getStringData(bean.getDob())%>"></td>
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