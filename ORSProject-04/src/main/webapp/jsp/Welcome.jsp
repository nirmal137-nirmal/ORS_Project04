
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome-ORS</title>

    <!-- Bootstrap CSS CDN only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
</head>
<body>

    <%@ include file="Header.jsp" %>

    <div class="container text-center mt-5">
        <h1 class="text-danger display-4 fw-bold">
            Welcome to ORS
            <%= isLogin ? "(" + user.getFirstName() + ")" : "" %>
        </h1>
    </div>

    <%@ include file="Footer.jsp" %>

</body>
</html>
