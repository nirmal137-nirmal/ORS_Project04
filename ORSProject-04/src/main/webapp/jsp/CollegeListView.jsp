<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
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

	List<CollegeBean> list = ServletUtility.getList(request);

	List<CollegeBean> nextList = (List<CollegeBean>) request.getAttribute("nextList");

	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);

	int index = (pageNo - 1) * pageSize + 1;

	Iterator<CollegeBean> it = list.iterator();
	%>

	<%@ include file="Header.jsp"%>

	<div align="center">

		<h1>College List</h1>
		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>

		<form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="post">

			<table border="1" width="100%">

				<tr style="background-color: #6FA7A0;">
					<th><input type="checkbox"
						onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">Select
						All</th>
					<th>S No.</th>
					<th>Name</th>
					<th>Address</th>
					<th>State</th>
					<th>City</th>
					<th>Phone No.</th>

				</tr>

				<%
				while (it.hasNext()) {

					CollegeBean bean = it.next();
				%>

				<tr align="center">

					<td style="background-color: #D9E2DF;"><input type="checkbox"
						name="ids" value="<%=bean.getId()%>"></td>


					<td style="background-color: #D9E2DF;"><%=index++%></td>

					<td style="background-color: #D9E2DF;"><%=bean.getName()%></td>
					<td style="background-color: #D9E2DF;"><%=bean.getAddress()%></td>
					<td style="background-color: #D9E2DF;"><%=bean.getState()%></td>
					<td style="background-color: #D9E2DF;"><%=bean.getCity()%></td>
					<td style="background-color: #D9E2DF;"><%=bean.getPhoneNo()%></td>


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

	<%@ include file="Footer.jsp"%>

</body>
</html>