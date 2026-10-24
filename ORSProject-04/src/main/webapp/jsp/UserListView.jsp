<%@page import="in.co.rays.proj4.controller.UserCtl"%>
<%@page import="in.co.rays.proj4.controller.UserListCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User List | ORS</title>

<!-- Bootstrap CSS CDN -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- Bootstrap Icons CDN -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    rel="stylesheet">

</head>

<body class="bg-light">

<%
    String succ = ServletUtility.getSuccessMessage(request);
    String error = ServletUtility.getErrorMessage(request);

    List<UserBean> nextList =
        (List<UserBean>) request.getAttribute("nextList");

    List<UserBean> list = ServletUtility.getList(request);

    int pageNo = ServletUtility.getPageNo(request);
    int pageSize = ServletUtility.getPageSize(request);
    int index = (pageNo - 1) * pageSize + 1;

    Iterator<UserBean> it = list.iterator();
%>

<!-- Header -->
<%@ include file="Header.jsp" %>

<!-- Main Container -->
<div class="container-fluid py-2 px-2">

    <div class="card border-0 shadow-sm rounded-3">

        <!-- Heading -->
        <div class="card-header bg-primary text-white py-2">

            <div class="d-flex justify-content-between align-items-center">

                <h5 class="mb-0 fw-bold">
                    <i class="bi bi-people-fill me-1"></i>
                    User List
                </h5>

                <span class="badge bg-light text-primary">
                    Manage Users
                </span>

            </div>

        </div>

        <div class="card-body p-2">

            <!-- Success Message -->
            <% if (succ != null && !succ.trim().isEmpty()) { %>

                <div class="alert alert-success py-2 mb-2">
                    <%= succ %>
                </div>

            <% } %>

            <!-- Error Message -->
            <% if (error != null && !error.trim().isEmpty()) { %>

                <div class="alert alert-danger py-2 mb-2">
                    <%= error %>
                </div>

            <% } %>

            <!-- Search Form -->
            <form action="<%= ORSView.USER_LIST_CTL %>"
                  method="post"
                  class="mb-3">

                <div class="row g-2 align-items-end">

                    <div class="col-12 col-md-4">

                        <label for="firstName"
                               class="form-label small fw-semibold mb-1">
                            First Name
                        </label>

                        <input type="text"
                               id="firstName"
                               name="firstName"
                               class="form-control form-control-sm"
                               placeholder="Search first name">

                    </div>

                    <div class="col-12 col-md-4">

                        <label for="lastName"
                               class="form-label small fw-semibold mb-1">
                            Last Name
                        </label>

                        <input type="text"
                               id="lastName"
                               name="lastName"
                               class="form-control form-control-sm"
                               placeholder="Search last name">

                    </div>

                    <div class="col-auto">

                        <button type="submit"
                                name="operation"
                                value="<%= UserCtl.OP_SEARCH %>"
                                class="btn btn-sm btn-primary">

                            <i class="bi bi-search me-1"></i>
                            Search

                        </button>

                    </div>

                </div>

            </form>

            <!-- User List Form -->
            <form action="<%= ORSView.USER_LIST_CTL %>"
                  method="post">

                <div class="d-flex justify-content-between align-items-center mb-2">

                    <h6 class="mb-0 fw-bold text-secondary">
                        <i class="bi bi-table me-1"></i>
                        User Records
                    </h6>

                    <small class="text-muted">
                        Page <%= pageNo %>
                    </small>

                </div>

                <!-- Responsive Table -->
                <div class="table-responsive">

                    <table class="table table-sm table-bordered table-hover align-middle text-center mb-0">

                        <thead class="table-primary">

                            <tr>
                                <th>
                                    <input type="checkbox"
                                           id="selectAll"
                                           class="form-check-input"
                                           aria-label="Select all users">
                                    <label for="selectAll" class="small">
                                        All
                                    </label>
                                </th>

                                <th>S.No.</th>
                                <th>Id</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Login</th>
                                <th>DOB</th>
                                <th>Role ID</th>
                                <th>Gender</th>
                                <th>Action</th>
                            </tr>

                        </thead>

                        <tbody>

                            <% if (list != null && !list.isEmpty()) { %>

                                <% while (it.hasNext()) {
                                    UserBean bean = it.next();
                                %>

                                    <tr>

                                        <td>
                                            <input type="checkbox"
                                                   name="ids"
                                                   value="<%= bean.getId() %>"
                                                   class="form-check-input user-checkbox"
                                                   aria-label="Select user">
                                        </td>

                                        <td><%= index++ %></td>

                                        <td><%= bean.getId() %></td>

                                        <td><%= bean.getFirstName() %></td>

                                        <td><%= bean.getLastName() %></td>

                                        <td class="text-break">
                                            <%= bean.getLogin() %>
                                        </td>

                                        <td><%= bean.getDob() %></td>

                                        <td><%= bean.getRoleId() %></td>

                                        <td><%= bean.getGender() %></td>

                                        <td>
                                            <a href="<%= ORSView.USER_CTL + "?id=" + bean.getId() %>"
                                               class="btn btn-sm btn-outline-primary">

                                                <i class="bi bi-pencil-square"></i>
                                                Edit

                                            </a>
                                        </td>

                                    </tr>

                                <% } %>

                            <% } else { %>

                                <tr>
                                    <td colspan="10" class="text-muted py-3">
                                        <i class="bi bi-inbox fs-5 d-block mb-1"></i>
                                        No user records found.
                                    </td>
                                </tr>

                            <% } %>

                        </tbody>

                    </table>

                </div>

                <!-- Current Page -->
                <input type="hidden"
                       name="pageNo"
                       value="<%= pageNo %>">

                <!-- Action Buttons -->
                <div class="d-flex flex-wrap justify-content-between align-items-center mt-2 gap-2">

                    <!-- Previous -->
                    <button type="submit"
                            name="operation"
                            value="<%= BaseCtl.OP_PREVIOUS %>"
                            class="btn btn-sm btn-outline-primary"
                            <%= pageNo == 1 ? "disabled" : "" %>>

                        <i class="bi bi-chevron-left"></i>
                        Previous

                    </button>

                    <!-- Delete -->
                    <button type="submit"
                            name="operation"
                            value="<%= BaseCtl.OP_DELETE %>"
                            class="btn btn-sm btn-danger"
                            onclick="return confirm('Are you sure you want to delete the selected users?');">

                        <i class="bi bi-trash"></i>
                        Delete

                    </button>

                    <!-- Next -->
                    <button type="submit"
                            name="operation"
                            value="<%= UserListCtl.OP_NEXT %>"
                            class="btn btn-sm btn-outline-primary"
                            <%= (nextList == null || nextList.isEmpty())
                                ? "disabled" : "" %>>

                        Next
                        <i class="bi bi-chevron-right"></i>

                    </button>

                </div>

            </form>

        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="Footer.jsp" %>

<!-- Bootstrap JavaScript CDN -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<!-- Select All JavaScript -->
<script>
    const selectAll = document.getElementById("selectAll");
    const userCheckboxes = document.querySelectorAll(".user-checkbox");

    selectAll.addEventListener("change", function () {
        userCheckboxes.forEach(function (checkbox) {
            checkbox.checked = selectAll.checked;
        });
    });

    userCheckboxes.forEach(function (checkbox) {
        checkbox.addEventListener("change", function () {
            selectAll.checked =
                userCheckboxes.length > 0 &&
                Array.from(userCheckboxes).every(function (item) {
                    return item.checked;
                });
        });
    });
</script>

</body>
</html>