
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="in.co.rays.proj4.controller.ForgetPasswordCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forget Password - ORS</title>

<!-- Bootstrap CSS CDN only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
</head>

<body class="bg-light">

<%
String succ = ServletUtility.getSuccessMessage(request);
String error = ServletUtility.getErrorMessage(request);
%>

<%@ include file="Header.jsp"%>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">

            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">

                <div class="card-header bg-primary text-white text-center py-4">
                    <h3 class="mb-1 fw-bold">Forget Password</h3>
                    <p class="mb-0 small">Reset your ORS account password</p>
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

                    <form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">

                        <div class="mb-4">
                            <label class="form-label fw-semibold">
                                Login ID (Email)
                                <span class="text-danger">*</span>
                            </label>

                            <input type="text" name="login"
                                class="form-control"
                                placeholder="Enter your email">

                            <div class="text-danger small mt-1">
                                <%=ServletUtility.getErrorMessage("login", request)%>
                            </div>
                        </div>

                        <button type="submit" name="operation"
                            value="<%=ForgetPasswordCtl.OP_SAVE%>"
                            class="btn btn-primary btn-lg w-100">
                            Submit
                        </button>

                        <div class="text-center mt-3">
                            <a href="<%=ORSView.LOGIN_CTL%>"
                                class="text-primary text-decoration-none fw-semibold">
                                Back to Login
                            </a>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

<%@ include file="Footer.jsp"%>

</body>
</html>
