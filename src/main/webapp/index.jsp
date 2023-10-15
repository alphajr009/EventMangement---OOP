<%@page import="java.sql.Connection"%>
<%@page import="com.oop.db.handler.DBConnector"%>
<%@page import="com.oop.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>EventEaze</title>
<%@include file="CSS/allcss.jsp"%>
</head>
<body>
	<jsp:include page="jsp/common/navbar.jsp" />
	<jsp:include page="jsp/common/hero.jsp" />
	<% User user = (User) session.getAttribute("userSession");%>
	<input type="hidden" name="sessionUsername" id="sessionUsername" value="<%= (user != null) ? user.getName() : "" %>">

	<div class=body-container>

		<div class="card-container">

			<div class="card">

				<div class="card-head">
					<div class="card-img">
						<img src="assets/joinevent.jpg" width="240" alt="Ready to Join">

					</div>

					<div class="card-title">
						<h2>Ready to join the event?</h2>
						<h5>Confirm Your Attendance</h5>
					</div>
				</div>

				<div class="card-des">

					<p>Confirm your attendance here and secure your spot at the
						upcoming event. Simply click the 'Confirm' button, and proceed
						according to the steps and we'll ensure you have a memorable time
						at the event!</p>

				</div>

				<div class="card-btn btnacc">
					<button type="button" class="btn btn-primary">Confirm
						Attendance</button>
				</div>
			</div>

			<div class="card">

				<div class="card-head">
					<div class="card-img">
						<img src="assets/eventplan.png" width="260" alt="Ready to Join">

					</div>

					<div class="card-title">
						<h2>Looking to plan your event?</h2>
						<h5>Plan Your Event</h5>
					</div>
				</div>

				<div class="card-des">

					<p>You're in the right place! Start planning your event with
						us. From venue selection to catering, we've got you covered.
						Create your dream event today! Get started with our easy-to-use
						event planning tools.</p>

				</div>
				<div class="card-btn">
						<button type="button" class="btn btn-primary" id="planEventButton1">Plan
						Your Event</button>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="jsp/common/footer.jsp" />
	<script>
		document.getElementById('planEventButton1').addEventListener('click',
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
