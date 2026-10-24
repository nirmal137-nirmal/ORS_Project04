
<%@page import="in.co.rays.proj4.util.MessageSource"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Header</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #ffffff;
}

/* Navbar */
.navbar {
	background: linear-gradient(90deg, #e0f2fe, #ffffff, #dbeafe) !important;
	padding: 6px 14px;
	margin: 0;
	box-shadow: 0 4px 15px rgba(30, 64, 175, 0.10);
	border-bottom: 1px solid #e2e8f0;
}

/* Remove extra space from navbar container */
.navbar>.container-fluid {
	display: flex;
	flex-wrap: wrap;
	padding: 0;
	margin: 0;
}

/* Navigation section */
.navbar-collapse {
	flex-basis: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
}

/* Navigation links */
.navbar-nav {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	align-items: center;
	gap: 2px;
	margin: 0;
	padding: 0;
}

.navbar .nav-link {
	color: #334155 !important;
	font-size: 13px;
	font-weight: 500;
	margin: 0;
	padding: 7px 9px !important;
	border-radius: 6px;
	white-space: nowrap;
	transition: all 0.2s ease;
}

.navbar .nav-link:hover {
	color: #1d4ed8 !important;
	background-color: #dbeafe;
}

/* Welcome message */
.welcome-text {
	color: #1e40af !important;
	font-weight: 600 !important;
	white-space: nowrap;
}

/* Right side: Language, Change Password, Logout */
.navbar-right {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	gap: 2px;
	margin-left: auto;
	padding: 0;
	flex-shrink: 0;
}

/* Language form */
.language-form {
	margin: 0;
	padding: 0;
}

/* Language select */
.language-select {
	width: 120px;
	border: 1px solid #cbd5e1;
	border-radius: 8px;
	padding: 6px 10px;
	background-color: #ffffff;
	color: #334155;
	font-size: 13px;
	cursor: pointer;
}

.language-select:focus {
	border-color: #60a5fa;
	box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.2);
}

/* Mobile menu button */
.navbar .navbar-toggler {
	border: 1px solid #93c5fd;
	border-radius: 8px;
	padding: 5px 8px;
}

.navbar .navbar-toggler:focus {
	box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.2);
}

.navbar .navbar-toggler-icon {
	filter: brightness(0.5);
}

/* Responsive layout */
@media ( max-width : 991px) {
	.navbar-collapse {
		padding-top: 8px;
	}
	.navbar-nav {
		flex-direction: column;
		align-items: stretch;
	}
	.navbar .nav-link {
		white-space: normal;
	}
	.navbar-right {
		align-items: flex-start;
		margin-left: 0;
		margin-top: 8px;
		width: 100%;
	}
}
</style>
</head>

<body>

	<%
UserBean user = (UserBean) session.getAttribute("user");
String role = (String) session.getAttribute("role");
boolean isLogin = user != null;
String welcomeMsg = "Hii, ";

MessageSource ms = MessageSource.getInstance();
String locale = ms.getLanguage();
%>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">

			<!-- Mobile Toggle Button -->
			<button class="navbar-toggler ms-auto" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu"
				aria-controls="navbarMenu" aria-expanded="false"
				aria-label="Toggle navigation">

				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navigation Links -->
			<div class="collapse navbar-collapse" id="navbarMenu">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<%
					if (isLogin) {
					%>

					<li class="nav-item"><span class="nav-link welcome-text">
							<%=welcomeMsg + user.getFirstName() + "(" + role + ")"%>
					</span></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.ROLE_CTL%>">Add Role</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.ROLE_LIST_CTL%>">Role List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.USER_CTL%>">Add User</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.USER_LIST_CTL%>">User List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.COLLEGE_CTL%>">Add College</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.FACULTY_CTL%>">Add Faculty</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.STUDENT_CTL%>">Add Student</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.COURSE_CTL%>">Add Course</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.SUBJECT_CTL%>">Add Subject</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.MARKSHEET_CTL%>">Add MarkSheet</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.MARKSHEET_LIST_CTL%>">MarkSheet List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.BANK_CTL%>">Banking</a> <%
 } else {
 %>
					<li class="nav-item"><span class="nav-link welcome-text">Hii,
							Guest</span></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.LOGIN_CTL%>">Login</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.USER_REGISTRATION_CTL%>">SignUp</a></li>

					<%
					}
					%>

					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.WELCOME_CTL%>">Welcome</a></li>

				</ul>

				<!-- Right Side Links -->
				<%
				if (isLogin) {
				%>

				<div class="navbar-right">

					<!-- Language Dropdown above Change Password -->
					<form action="<%=ORSView.WELCOME_CTL%>" method="get"
						class="language-form">

						<select name="lang" class="form-select language-select"
							onchange="this.form.submit()">

							<option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
								English</option>

							<option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
								Hindi</option>

						</select>
					</form>

					<a class="nav-link" href="<%=ORSView.CHANGE_PASSWORD_CTL%>">
						Change Password </a> <a class="nav-link"
						href="<%=ORSView.LOGIN_CTL + "?operation=logout"%>"> Logout </a>

				</div>

				<%
				} else {
				%>

				<!-- Language Dropdown for Guest -->
				<div class="navbar-right">

					<form action="<%=ORSView.WELCOME_CTL%>" method="get"
						class="language-form">

						<select name="lang" class="form-select language-select"
							onchange="this.form.submit()">

							<option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
								English</option>

							<option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
								Hindi</option>

						</select>
					</form>

				</div>

				<%
				}
				%>

			</div>
		</div>
	</nav>

	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
