
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="in.co.rays.proj4.controller.RoleCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Role - ORS</title>

<!-- Bootstrap CSS CDN only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
</head>

<body class="bg-light">

<jsp:useBean id="bean" class="in.co.rays.proj4.bean.RoleBean"
    scope="request"></jsp:useBean>

<%
String succ = ServletUtility.getSuccessMessage(request);
String error = ServletUtility.getErrorMessage(request);
%>

<%@ include file="Header.jsp"%>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">

            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">

                <div class="card-header bg-primary text-white text-center py-4">
                    <h3 class="mb-1 fw-bold">
                        <%=bean != null && bean.getId() > 0 ? "Update Role" : "Add Role"%>
                    </h3>
                    <p class="mb-0 small">Manage ORS roles</p>
                </div>

                <div class="card-body p-4">

                    <% if (succ != null && !succ.isEmpty()) { %>
                    <div class="alert alert-success" role="alert">
                        <%=succ%>
                    </div>
                    <% } %>

                    <% if (error != null && !error.isEmpty()) { %>
                    <div class="alert alert-danger" role="alert">
                        <%=error%>
                    </div>
                    <% } %>

                    <form action="<%=ORSView.ROLE_CTL%>" method="post">

                        <input type="hidden" name="id"
                            value="<%=DataUtility.getStringData(bean.getId())%>">

                        <div class="mb-3">
                            <label class="form-label fw-semibold">
                                Name <span class="text-danger">*</span>
                            </label>

                            <input type="text" name="name"
                                class="form-control"
                                value="<%=DataUtility.getStringData(bean.getName())%>"
                                placeholder="Enter role name">

                            <div class="text-danger small mt-1">
                                <%=ServletUtility.getErrorMessage("name", request)%>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold">
                                Description <span class="text-danger">*</span>
                            </label>

                            <input type="text" name="description"
                                class="form-control"
                                value="<%=DataUtility.getStringData(bean.getDescription())%>"
                                placeholder="Enter role description">

                            <div class="text-danger small mt-1">
                                <%=ServletUtility.getErrorMessage("description", request)%>
                            </div>
                        </div>

                        <button type="submit" name="operation"
                            value="<%=BaseCtl.OP_SAVE%>"
                            class="btn btn-primary btn-lg w-100">
                            Save Role
                        </button>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

<%@ include file="Footer.jsp"%>

</body>
</html>
