<!DOCTYPE html>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>
/* Input icon styling */
.input-group-text {
    background-color: #f8f9fa;
    color: #0d6efd;
    min-width: 42px;
    justify-content: center;
}

.toggle-password {
    cursor: pointer;
}
</style>

</head>
<body>

<%
String succ = ServletUtility.getSuccessMessage(request);
String error = ServletUtility.getErrorMessage(request);
%>

<%@ include file="Header.jsp"%>

<div align="center">

    <!-- Login Card -->
    <div class="card shadow mt-5 mb-5" style="width: 24rem;">

        <div class="card-header text-center bg-primary text-white">
            <h4 class="card-title mb-0">
                <i class="fa-solid fa-right-to-bracket me-2"></i>
                <%=ms.get("login.title")%>
            </h4>
        </div>

        <div class="card-body">

            <h6 style="color: green"><%=succ%></h6>
            <h6 style="color: red"><%=error%></h6>

            <form action="<%=ORSView.LOGIN_CTL%>" method="post">

                <!-- Login / Email -->
                <div class="mb-3 text-start">

                    <label class="form-label">
                        <i class="fa-solid fa-envelope me-1 text-primary"></i>
                        <%=ms.get("login.email")%>
                        <font color="red">*</font>
                    </label>

                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-user"></i>
                        </span>
                        <input type="text" name="login"
                            class="form-control"
                            placeholder="enter you login"
                            value="">
                    </div>

                    <div style="color: red">
                        <%=ServletUtility.getErrorMessage("login", request)%>
                    </div>

                </div>

                <!-- Password -->
                <div class="mb-3 text-start">

                    <label class="form-label">
                        <i class="fa-solid fa-lock me-1 text-primary"></i>
                        <%=ms.get("login.password")%>
                        <font color="red">*</font>
                    </label>

                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-key"></i>
                        </span>
                        <input type="password" name="password"
                            id="passwordField"
                            class="form-control"
                            placeholder="enter you password"
                            value="">
                        <span class="input-group-text toggle-password"
                            onclick="togglePassword()">
                            <i class="fa-solid fa-eye" id="eyeIcon"></i>
                        </span>
                    </div>

                    <div style="color: red">
                        <%=ServletUtility.getErrorMessage("password", request)%>
                    </div>

                </div>

                <!-- Sign In Button -->
                <div class="d-grid">
                    <input type="submit" name="operation"
                        class="btn btn-primary"
                        value="<%=LoginCtl.OP_SIGNIN%>">
                </div>

                <div class="text-center mt-3">
                    <a href="<%=ORSView.FORGET_PASSWORD_CTL%>">
                        <i class="fa-solid fa-circle-question me-1"></i>
                        <%=ms.get("login.forgotpassword")%>
                    </a>
                </div>

            </form>

        </div>

        <div class="card-footer text-center text-muted">
            <i class="fa-solid fa-shield-halved me-1"></i> ORS Project
        </div>

    </div>
    <!-- Login Card End -->

</div>

<%@include file="Footer.jsp"%>

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
function togglePassword() {
    var field = document.getElementById("passwordField");
    var icon = document.getElementById("eyeIcon");

    if (field.type === "password") {
        field.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    } else {
        field.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
}
</script>

</body>
</html>