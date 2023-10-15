<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oop.models.User"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>EventEaze</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
	<% User user = (User) session.getAttribute("userSession");%>
	<input type="hidden" name="sessionUsername" id="sessionUsername" value="<%= (user != null) ? user.getName() : "" %>">
	<nav class="navbar navbar-expand-lg bgcl sticky-navbar">
		<div class="container">
			<div class="logo-container">
				<a class="navbar-brand" href="index.jsp"> <img
					src="assets/logo.png" width="80" height="80"
					class="d-inline-block align-top" alt="">
				</a>
				<div>
					<h3 class="font-wh">EventEaze</h3>
				</div>
			</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav  ml-auto ">
					<li class="nav-item"><a
						class="nav-link h6 font-wh nav-link-fade-up" href="index.jsp">Home</a></li>
					<li class="nav-item"><a
						class="nav-link h6 font-wh nav-link-fade-up" href="jsp/common/aboutus.jsp">About
							Us</a></li>
					<li class="nav-item"><a
						class="nav-link h6 font-wh nav-link-fade-up" href="jsp/common/contact.jsp">Contact
							Us</a></li>
					<button class=" btn-nav" id="planEventButton">Plan your
						event</button>
				</ul>
			</div>
		</div>
	</nav>
	<script src="js/script.js"></script>
	<script>
		document.getElementById('planEventButton').addEventListener('click',
				function() {
					var sessionName = document.getElementById('sessionUsername').value;
					if(sessionName !== ""){
						console.log(sessionName);
						window.location.href = 'userHome.jsp';
					} else {
						window.location.href = 'devidebegin.jsp';
					}
				});
	</script>
</body>
</html>
