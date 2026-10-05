<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<br>
	<h1 align="center">
		<font size="10px" color="Red">Welcome to ORS<%=isLogin ? "(" + user.getFirstName() + ")" : ""%></font>
	</h1>

</body>
</html>