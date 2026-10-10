<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
</head>

<body>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);

	List<UserBean> list = ServletUtility.getList(request);

	List<UserBean> nextList = (List<UserBean>) request.getAttribute("nextList");

	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);

	int index = (pageNo - 1) * pageSize + 1;

	Iterator<UserBean> it = list.iterator();
	%>

	<%@ include file="Header.jsp"%>

	<div align="center">

		<h1>User List</h1>
		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>

		<form action="<%=ORSView.USER_LIST_CTL%>" method="post">

			<table border="1" width="100%">

				<tr style="background-color: #6FA7A0;">

					<th><input type="checkbox"
						onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">Select
						All</th> x
					<th>S No.</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Login</th>
					<th>DOB</th>
					<th>Role ID</th>
					<th>Gender</th>
				</tr>

				<%
				while (it.hasNext()) {

					UserBean bean = it.next();
				%>

				<tr align="center" style="background-color: rgb(255, 128, 128);">

					<td><input type="checkbox" name="ids"
						value="<%=bean.getId()%>"></td>

					<td><%=index++%></td>

					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getLogin()%></td>
					<td><%=bean.getDob()%></td>
					<td><%=bean.getRoleId()%></td>
					<td><%=bean.getGender()%></td>

				</tr>

				<%
				}
				%>

			</table>

			<table width="100%">
				<input type="hidden" name="pageNo" value="<%=pageNo%>">
				<tr>
					<td><input type="submit" name="operation"
						<%=pageNo == 1 ? "disabled" : ""%>
						value="<%=BaseCtl.OP_PREVIOUS%>"></td>
					<td align="center"><input type="submit" name="operation"
						value="<%=BaseCtl.OP_DELETE%>"></td>
					<td align="right"><input type="submit" name="operation"
						<%=nextList.size() == 0 ? "disabled" : ""%>
						value="<%=BaseCtl.OP_NEXT%>"></td>
				</tr>
			</table>


		</form>

	</div>
	<div align="center">

		<!-- View pe page No or Page Size Dikhane ke liye  -->
		<%-- <h2><%="pageNo = " + pageNo + "|" + "pageSize = " + list.size()%></h2> --%>


	</div>
	<%@ include file="Footer.jsp"%>

</body>
</html>