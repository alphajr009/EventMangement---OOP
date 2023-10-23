<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.models.User"%>
<%@page import="com.oop.models.Event"%>
<%@page import="com.oop.models.Place"%>
<%@page import="com.oop.models.Decorator"%>
<%@page import="com.oop.models.Catering"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EventEaze</title>
<%@include file="CSS/allcss.jsp"%>
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/devidebegin.css">
<link rel="stylesheet" href="CSS/userhome.css">
<link rel="stylesheet" href="CSS/custom.css">
<style>
.error-message {
	color: red;
}
</style>

</head>
<body>
	<%
	User user = (User) request.getAttribute("User");
	if (user != null && !user.getName().isBlank()) {
		session.setAttribute("userSession", user);
	}

	ArrayList<Event> eventList = (ArrayList<Event>) request.getAttribute("eventList");
	ArrayList<Place> placeList = (ArrayList<Place>) request.getAttribute("placeList");
	ArrayList<Decorator> decoratorList = (ArrayList<Decorator>) request.getAttribute("decoratorList");
	ArrayList<Catering> cateringList = (ArrayList<Catering>) request.getAttribute("cateringList");
	String reload = (String) request.getAttribute("reload");
	%>
	<input type="hidden" id="reload" name="reload"
		value=<%=reload != null ? reload : "true"%> />
	<div class="devide-begin">
		<div>
			<!-- NavBar -->
			<nav class="navbar navbar-expand-lg bgcl ">
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
								class="nav-link h6 font-wh nav-link-fade-up"
								href="jsp/common/aboutus.jsp">About Us</a></li>
							<li class="nav-item"><a
								class="nav-link h6 font-wh nav-link-fade-up"
								href="jsp/common/contact.jsp">Contact Us</a></li>
							<button class="btn-nav" id="planEventButton">
								<i class="fas fa-user"></i> &nbsp; Account
							</button>

						</ul>
					</div>
				</div>
			</nav>
		</div>


		<div class="devide-begin-content">


			<div class="admin-packages-content">
				<div class="tab-buttons">
					<form action="EventsServlet" method="post">
						<button id="eventsTab" class="active tb-buttons" name="action"
							value="view">
							<b>Events</b>
						</button>
					</form>
					<button id="planEventTab" class="tb-buttons" name="action"
						value="planEvent">
						<b>Plan New Event</b>
					</button>
				</div>

				<div id="eventsContent" class="tab-content active-content">
					<!-- "Packages" tab -->

					<h3>Events</h3>
					<div>
						<table class="styled-table" border="1">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Time</th>
									<th>Place</th>
									<th>Decorator</th>
									<th>Catering</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<%
								if (eventList != null && !eventList.isEmpty()) {
									for (Event event : eventList) {
								%>
								<tr>
									<td><%=event.getId()%></td>
									<td><%=event.getName()%></td>
									<td><%=event.getTime()%></td>
									<td><%=event.getPlace()%></td>
									<td><%=event.getDecorator()%></td>
									<td><%=event.getCatering()%></td>
									<td><button class="edit-button" type="button"
											data-toggle="modal"
											data-target="#editModalevent<%=event.getId()%>">Edit</button></td>

									<div class="modal fade" id="editModalevent<%=event.getId()%>"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Edit
														Decorator</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form action="EventsServlet" method="post">
													<div class="tab-form-field">
														<label>Event name</label> <input type="text" id="evname"
															name="newEventname" class="form-control"
															value="<%=event.getName()%>">
													</div>

													<div class="tab-form-field">
														<label>Time</label> <input type="text" id="time"
															class="form-control" required="required" name="newTime"
															value="<%= event.getTime() %>">
													</div>


													<div class="tab-form-field">
														<label>Catering</label> <select name="newCatering"
															id="newCatering" class="form-control">
															<option value="default" selected value="<%= event.getCatering()%>"><%= event.getCatering() %></option>
															<%
															if (cateringList != null && !cateringList.isEmpty()) {
																for (Catering catering : cateringList) {
															%>
																<option value="<%= catering.getName() %>"><%=catering.getName()%></option>
															<%
															}
															}
															%>
														</select>
													</div>

													<div class="tab-form-field">
														<label>Decorator</label> <select name="newDecorator"
															id="newDecorator" class="form-control">
															<option value="default" selected value="<%= event.getDecorator() %>"><%= event.getDecorator() %></option>
															<%
															if (decoratorList != null && !decoratorList.isEmpty()) {
																for (Decorator decorator : decoratorList) {
															%>
																<option value="<%=decorator.getName()%>"><%=decorator.getName()%></option>
															<%
															}
															}
															%>
														</select>
													</div>
													<div class="tab-form-field">
														<label>Place</label> <select name="newPlace" id="newPlace"
															class="form-control">
															<option value="default" selected value="<%= event.getPlace() %>"><%= event.getPlace() %></option>
															<%
															if (placeList != null && !placeList.isEmpty()) {
																for (Place place : placeList) {
															%>
																<option value="<%=place.getName()%>"><%=place.getName()%></option>
															<%
															}
															}
															%>
														</select>
													</div>

													<input type="hidden" name="eventId"
														value="<%=event.getId()%>">
													<button type="submit" class="btn btn-primary cretr"
														id="createPlaces" name="action" value="edit">Save</button>
												</form>
											</div>
										</div>
									</div>

									<td>
										<form action="EventsServlet" method="post">
											<input type="hidden" name="eventId"
												value="<%=event.getId()%>">
											<button class="delete-button" name="action" value="delete">Delete</button>
										</form>
									</td>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>

				</div>


				<!-- "Create New Package" tab -->

				<div id="newEventContent" class="tab-content">

					<h3>Plan New Event</h3>

					<form action="EventsServlet" method="post">
						<div class="tab-form-field">
							<label>Event name</label> <input type="text" id="evname"
								name="eventname" class="form-control">
						</div>

						<div class="tab-form-field">
							<label>Time</label> <input type="text" id="time"
								class="form-control" required="required" name="time">
						</div>


						<div class="tab-form-field">
							<label>Catering</label> <select name="catering" id="catering"
								class="form-control">
								<%
								if (cateringList != null && !cateringList.isEmpty()) {
									for (Catering catering : cateringList) {
								%>
								<option value="<%=catering.getName()%>"><%=catering.getName()%></option>
								<%
								}
								}
								%>
							</select>
						</div>

						<div class="tab-form-field">
							<label>Decorator</label> <select name="decorator" id="decorator"
								class="form-control">
								<%
								if (decoratorList != null && !decoratorList.isEmpty()) {
									for (Decorator decorator : decoratorList) {
								%>
								<option value="<%=decorator.getName()%>"><%=decorator.getName()%></option>
								<%
								}
								}
								%>
							</select>
						</div>
						<div class="tab-form-field">
							<label>Place</label> <select name="place" id="place"
								class="form-control">
								<%
								if (placeList != null && !placeList.isEmpty()) {
									for (Place place : placeList) {
								%>
								<option value="<%=place.getName()%>"><%=place.getName()%></option>
								<%
								}
								}
								%>
							</select>
						</div>



						<button class="btn btn-primary cretr" id="createPlaces"
							name="action" value="create">Create</button>
					</form>
				</div>
			</div>


		</div>




		<div class="devide-begin-footer">
			<!-- Footer Start -->
			<div class="footer-container">
				<div
					class="container-fluid bg-footer text-body footer mt-5 pt-5 wow fadeIn"
					data-wow-delay="0.1s">
					<div class="container py-5">
						<div class="row g-5">
							<div class="col-lg-3 col-md-6">
								<h5 class="text-light mb-4">Address</h5>
								<p class="mb-2">
									<i class="fa fa-map-marker-alt me-3"></i>123 Street, Malabe,
									Kaduwela
								</p>
								<p class="mb-2">
									<i class="fa fa-phone-alt me-3"></i>+94 345 67890
								</p>
								<p class="mb-2">
									<i class="fa fa-envelope me-3"></i>contact@eventeaze.com
								</p>
								<div class="d-flex pt-2">
									<a
										class="btn btn-square btn-outline-secondary rounded-circle me-1"
										href=""><i class="fab fa-twitter"></i></a> <a
										class="btn btn-square btn-outline-secondary rounded-circle me-1"
										href=""><i class="fab fa-facebook-f"></i></a> <a
										class="btn btn-square btn-outline-secondary rounded-circle me-1"
										href=""><i class="fab fa-youtube"></i></a> <a
										class="btn btn-square btn-outline-secondary rounded-circle me-0"
										href=""><i class="fab fa-linkedin-in"></i></a>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<h5 class="text-light mb-4">Quick Links</h5>
								<a class="btn btn-link" href="">About Us</a> <a
									class="btn btn-link" href="">Contact Us</a> <a
									class="btn btn-link" href="">Our Services</a> <a
									class="btn btn-link" href="">Terms & Condition</a> <a
									class="btn btn-link" href="">Support</a>
							</div>
							<div class="col-lg-3 col-md-6">
								<h5 class="text-light mb-4">Gallery</h5>
								<div class="row g-2">
									<div class="col-4">
										<img class="img-fluid rounded" src="assets/gal1.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="assets/gal2.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="assets/gal3.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="assets/gal4.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="assets/gal5.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="assets/gal6.jpg"
											alt="Image">
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<h5 class="text-light mb-4">Newsletter</h5>
								<p>Sign up to our newsletter, for valuable insights events
									and resources</p>
								<div class="position-relative mx-auto" style="max-width: 400px;">
									<input
										class="form-control bg-transparent border-secondary w-100 py-3 ps-4 pe-5"
										type="text" placeholder="Your email">
									<button type="button"
										class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
								</div>
							</div>
						</div>
					</div>
					<div class="container-fluid copyright">
						<div class="container">
							<div class="row">
								<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
									&copy; <a href="#">Event Eaze</a>, All Right Reserved.
								</div>
								<div class="col-md-6 text-center text-md-end">
									Designed By <a href="#">Alpha</a> <br>Distributed By: <a
										class="border-bottom" href="#" target="_blank">DashIT</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- Footer End -->

		</div>


	</div>

	<script>
		document.getElementById('planEventButton').addEventListener('click',
				function() {
					window.location.href = 'userAccount.jsp';
				});
		
		document.addEventListener("DOMContentLoaded", function () {
		    const eventsTab = document.getElementById('eventsTab');
		    const planEventTab = document.getElementById('planEventTab');
		    const eventsContent = document.getElementById('eventsContent');
		    const newEventContent = document.getElementById('newEventContent');
		    const reload = document.getElementById('reload').value;
		    const button = document.getElementById('eventsTab');

		    if(reload === "true"){
		    	button.click();
		    }
		    
		    eventsTab.addEventListener('click', () => {
			    	eventsTab.classList.add('active');
			    	planEventTab.classList.remove('active');
			    	eventsContent.classList.add('active-content');
			    	newEventContent.classList.remove('active-content');
			  });
		    
			planEventTab.addEventListener('click', () => {
			    	planEventTab.classList.add('active');
			        eventsTab.classList.remove('active');
			        newEventContent.classList.add('active-content');
			        eventsContent.classList.remove('active-content');
			});
			
			
		});
	</script>
	<script src="js/userprofile.js"></script>

</body>
</html>