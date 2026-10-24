<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add User | ORS</title>

<!-- Bootstrap CSS CDN -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

</head>

<body class="bg-light">

<jsp:useBean id="bean"
    class="in.co.rays.proj4.bean.UserBean"
    scope="request">
</jsp:useBean>

<%
    String succ = ServletUtility.getSuccessMessage(request);
    String error = ServletUtility.getErrorMessage(request);
%>

<!-- Header -->
<%@ include file="Header.jsp" %>

<!-- Main Container -->
<div class="container py-3">

    <div class="row justify-content-center">

        <div class="col-12 col-lg-9 col-xl-8">

            <div class="card border-0 shadow-sm">

                <!-- Card Header -->
                <div class="card-header bg-primary text-white py-2">

                    <h5 class="mb-0 text-center">
                        <%= bean != null && bean.getId() > 0
                            ? "Update User" : "Add User" %>
                    </h5>

                </div>

                <div class="card-body p-3">

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

                    <!-- User Form -->
                    <form action="<%= ORSView.USER_CTL %>" method="post">

                        <input type="hidden"
                               name="id"
                               value="<%= DataUtility.getStringData(bean.getId()) %>">

                        <div class="row g-2">

                            <!-- First Name -->
                            <div class="col-12 col-md-6">

                                <label for="firstName"
                                       class="form-label small fw-semibold mb-1">
                                    First Name <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                       id="firstName"
                                       name="firstName"
                                       class="form-control form-control-sm"
                                       value="<%= DataUtility.getStringData(bean.getFirstName()) %>"
                                       placeholder="Enter first name">

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("firstName", request) %>
                                </small>

                            </div>

                            <!-- Last Name -->
                            <div class="col-12 col-md-6">

                                <label for="lastName"
                                       class="form-label small fw-semibold mb-1">
                                    Last Name <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                       id="lastName"
                                       name="lastName"
                                       class="form-control form-control-sm"
                                       value="<%= DataUtility.getStringData(bean.getLastName()) %>"
                                       placeholder="Enter last name">

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("lastName", request) %>
                                </small>

                            </div>

                            <!-- Login -->
                            <div class="col-12 col-md-6">

                                <label for="login"
                                       class="form-label small fw-semibold mb-1">
                                    Login / Email <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                       id="login"
                                       name="login"
                                       class="form-control form-control-sm"
                                       value="<%= DataUtility.getStringData(bean.getLogin()) %>"
                                       placeholder="Enter email">

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("login", request) %>
                                </small>

                            </div>

                            <!-- Password -->
                            <div class="col-12 col-md-6">

                                <label for="password"
                                       class="form-label small fw-semibold mb-1">
                                    Password <span class="text-danger">*</span>
                                </label>

                                <input type="password"
                                       id="password"
                                       name="password"
                                       class="form-control form-control-sm"
                                       value="<%= DataUtility.getStringData(bean.getPassword()) %>"
                                       placeholder="Enter password">

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("password", request) %>
                                </small>

                            </div>

                            <!-- Confirm Password -->
                            <div class="col-12 col-md-6">

                                <label for="confirmPassword"
                                       class="form-label small fw-semibold mb-1">
                                    Confirm Password <span class="text-danger">*</span>
                                </label>

                                <input type="password"
                                       id="confirmPassword"
                                       name="confirmPassword"
                                       class="form-control form-control-sm"
                                       value="<%= DataUtility.getStringData(bean.getConfirmPassword()) %>"
                                       placeholder="Re-enter password">

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("confirmPassword", request) %>
                                </small>

                            </div>

                            <!-- Role -->
                            <div class="col-12 col-md-6">

                                <label for="roleId"
                                       class="form-label small fw-semibold mb-1">
                                    Role <span class="text-danger">*</span>
                                </label>

                                <select id="roleId"
                                        name="roleId"
                                        class="form-select form-select-sm">

                                    <option value="">Select Role</option>
                                    <option value="1">Admin</option>
                                    <option value="2">Student</option>
                                    <option value="3">Faculty</option>
                                    <option value="4">College</option>
                                    <option value="5">KIOSK</option>

                                </select>

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("roleId", request) %>
                                </small>

                            </div>

                            <!-- Gender -->
                            <div class="col-12 col-md-6">

                                <label for="gender"
                                       class="form-label small fw-semibold mb-1">
                                    Gender <span class="text-danger">*</span>
                                </label>

                                <select id="gender"
                                        name="gender"
                                        class="form-select form-select-sm">

                                    <option value="">Select Gender</option>
                                    <option value="female">Female</option>
                                    <option value="male">Male</option>

                                </select>

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("gender", request) %>
                                </small>

                            </div>

                            <!-- Date of Birth -->
                            <div class="col-12 col-md-6">

                                <label for="dob"
                                       class="form-label small fw-semibold mb-1">
                                    Date of Birth <span class="text-danger">*</span>
                                </label>

                                <input type="date"
                                       id="dob"
                                       name="dob"
                                       class="form-control form-control-sm"
                                       value="<%= DataUtility.getStringData(bean.getDob()) %>">

                                <small class="text-danger">
                                    <%= ServletUtility.getErrorMessage("dob", request) %>
                                </small>

                            </div>

                        </div>

                        <!-- Submit Buttons -->
                        <div class="d-flex justify-content-center gap-2 mt-3">

                            <button type="submit"
                                    name="operation"
                                    value="<%= BaseCtl.OP_SAVE %>"
                                    class="btn btn-sm btn-primary px-4">

                                Save

                            </button>

                            <button type="reset"
                                    class="btn btn-sm btn-outline-secondary px-4">

                                Reset

                            </button>

                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="Footer.jsp" %>

</body>
</html>
