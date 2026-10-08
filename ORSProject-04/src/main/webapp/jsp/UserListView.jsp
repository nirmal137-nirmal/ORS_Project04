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
    List<UserBean> list = ServletUtility.getList(request);

    int pageNo = ServletUtility.getPageNo(request);
    int pageSize = ServletUtility.getPageSize(request);

    int index = (pageNo - 1) * pageSize + 1;

    Iterator<UserBean> it = list.iterator();
%>

<%@ include file="Header.jsp" %>

<div align="center">

    <h1>User List</h1>

    <form action="<%=ORSView.USER_LIST_CTL%>" method="post">

        <table border="1" width="100%">

            <tr style="background-color: #6FA7A0;">
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

            <tr align="center">

                <td style="background-color: #D9E2DF;"><%=index++%></td>

                <td style="background-color: #D9E2DF;"><%=bean.getFirstName()%></td>
                <td style="background-color: #D9E2DF;"><%=bean.getLastName()%></td>
                <td style="background-color: #D9E2DF;"><%=bean.getLogin()%></td>
                <td style="background-color: #D9E2DF;"><%=bean.getDob()%></td>
                <td style="background-color: #D9E2DF;"><%=bean.getRoleId()%></td>
                <td style="background-color: #D9E2DF;"><%=bean.getGender()%></td>

            </tr>

            <%
                }
            %>

        </table>

    </form>

</div>

<%@ include file="Footer.jsp" %>

</body>
</html>