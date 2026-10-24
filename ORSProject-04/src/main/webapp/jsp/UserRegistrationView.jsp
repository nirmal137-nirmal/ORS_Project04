
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration - ORS</title>

<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- Google Material Icons CDN -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
    rel="stylesheet">
</head>

<body class="bg-light pb-5">

<%
String succ = ServletUtility.getSuccessMessage(request);
String error = ServletUtility.getErrorMessage(request);
%>

<%@ include file="Header.jsp"%>

<div class="container pt-4 pb-5 mb-5" style="max-width: 660px;">
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">

        <!-- Header -->
        <div class="card-header bg-primary text-white border-0 py-4 text-center">
            <div class="mb-3">
                <span class="d-inline-flex align-items-center justify-content-center rounded-circle bg-white bg-opacity-25"
                    style="width: 60px; height: 60px;">
                    <span class="material-symbols-outlined fs-2">person_add</span>
                </span>
            </div>

            <h4 class="mb-1 fw-bold">User Registration</h4>
            <p class="mb-0 small opacity-75">Create your ORS account</p>
        </div>

        <!-- Registration Form -->
        <div class="card-body p-4">

            <% if (succ != null && !succ.isEmpty()) { %>
                <div class="alert alert-success py-2" role="alert">
                    <span class="material-symbols-outlined align-middle me-2">check_circle</span><%=succ%>
                </div>
            <% } %>

            <% if (error != null && !error.isEmpty()) { %>
                <div class="alert alert-danger py-2" role="alert">
                    <span class="material-symbols-outlined align-middle me-2">warning</span><%=error%>
                </div>
            <% } %>

            <form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">
                            First Name <span class="text-danger">*</span>
                        </label>
                        <input type="text" name="firstName"
                            class="form-control" placeholder="Enter first name">
                        <div class="text-danger small mt-1">
                            <%=ServletUtility.getErrorMessage("firstName", request)%>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label fw-semibold">
                            Last Name <span class="text-danger">*</span>
                        </label>
                        <input type="text" name="lastName"
                            class="form-control" placeholder="Enter last name">
                        <div class="text-danger small mt-1">
                            <%=ServletUtility.getErrorMessage("lastName", request)%>
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">
                        Login ID (Email) <span class="text-danger">*</span>
                    </label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <span class="material-symbols-outlined">mail</span>
                        </span>
                        <input type="text" name="login"
                            class="form-control" placeholder="Enter your email">
                    </div>
                    <div class="text-danger small mt-1">
                        <%=ServletUtility.getErrorMessage("login", request)%>
                    </div>
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">
                            Password <span class="text-danger">*</span>
                        </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <span class="material-symbols-outlined">lock</span>
                            </span>
                            <input type="password" name="password"
                                class="form-control" placeholder="Enter password">
                        </div>
                        <div class="text-danger small mt-1">
                            <%=ServletUtility.getErrorMessage("password", request)%>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label fw-semibold">
                            Confirm Password <span class="text-danger">*</span>
                        </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <span class="material-symbols-outlined">shield_lock</span>
                            </span>
                            <input type="password" name="confirmPassword"
                                class="form-control" placeholder="Confirm password">
                        </div>
                        <div class="text-danger small mt-1">
                            <%=ServletUtility.getErrorMessage("confirmPassword", request)%>
                        </div>
                    </div>
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">
                            Gender <span class="text-danger">*</span>
                        </label>
                        <select name="gender" class="form-select">
                            <option value="">Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                        <div class="text-danger small mt-1">
                            <%=ServletUtility.getErrorMessage("gender", request)%>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label fw-semibold">
                            Date of Birth <span class="text-danger">*</span>
                        </label>
                        <input type="date" name="dob" class="form-control">
                        <div class="text-danger small mt-1">
                            <%=ServletUtility.getErrorMessage("dob", request)%>
                        </div>
                    </div>
                </div>

                <div class="pt-3 border-top">
                    <button type="submit" name="operation"
                        value="<%=UserRegistrationCtl.OP_SIGN_UP%>"
                        class="btn btn-primary btn-lg w-100">
                        <span class="material-symbols-outlined align-middle me-2">person_check</span>
                        Sign Up
                    </button>

                    <p class="text-center mt-3 mb-0 small text-muted">
                        Already have an account?
                        <a href="<%=ORSView.LOGIN_CTL%>"
                            class="text-primary fw-semibold text-decoration-none">
                            Login here
                        </a>
                    </p>
                </div>

            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp"%>

</body>
</html>
