<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.models.User"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EventEaze</title>
<%@include file="CSS/allcss.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="CSS/style.css">

<link rel="stylesheet" href="CSS/useracc.css">
<style>
.error-message {
	color: red;
}
</style>

</head>
<body>
	<%
	User user = (User) session.getAttribute("userSession");
	%>
	<input type="hidden" name="sessionUsername" id="sessionUsername"
		value="<%=(user != null) ? user : ""%>">
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
							<button class=" btn-nav" id="planEventButton">
								<i class="fas fa-user"></i> &nbsp; Account
							</button>

						</ul>
					</div>
				</div>
			</nav>
		</div>


		<!-- User Acc Begin -->

		<div class="usp">
			<div class="userprofile_container">
				<div class="profile_container">
					<div class="user_box">
						<div class="user_image_and_name_wrapper">
							<div class="user_image_and_name">
								<div class="user_image">
									<i class="fas fa-user" style="font-size: 110px;"></i>
								</div>
								<h1 class="user_name" id="up_name"><%=user.getName()%></h1>
							</div>
						</div>
						<div class="button_wrapper">
							<button class="btn4 btn-person_details" id="personaldetailsBtn">Person
								Details</button>
							<button class="btn4 btn-security" id="securityBtn">Security</button>

						</div>
					</div>
				</div>
			</div>
			<div class="details_container">
				<div class="content personal-details cpd"
					id="personaldetailsContent">
					<!-- Content for personal details -->

					<div class="cpd-header">
						<h4>Personal Details</h4>
					</div>

					<div class="cpd-content">

						<div class="user-profile-box">
							<div class="user-profile-box-container">
								<div class="user-profile-box-container-name">
									<p class="user-profile-box-container-text">Name</p>
								</div>
								<div class="user-p-bc-name-c">
									<p class="user-profile-bc-fname" id="pd_name"><%=user.getName()%></p>
								</div>
								<div class="user-pro-bc-edit-popup">
									<button type="button" class="user-pro-bc-edit-popup"
										data-toggle="modal" data-target="#exampleModal">Edit</button>

								</div>
							</div>
						</div>

						<!-- Modal Edit Name-->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Change
											Name</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">

										<div class="form-group">
											<label for="newName">Enter new name:</label> <input
												type="text" class="form-control" id="newName"
												value="<%=user.getName()%>" name="newName">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" id="saveName"
											data-dismiss="modal">Save changes</button>
									</div>
								</div>
							</div>
						</div>

						<div class="user-profile-box">
							<div class="user-profile-box-container">
								<div class="user-profile-box-container-name">
									<p class="user-profile-box-container-text">Email</p>
								</div>
								<div class="user-p-bc-name-c">
									<p class="user-profile-bc-fname" id="pd_email"><%=user.getEmail()%></p>
								</div>
								<div class="user-pro-bc-edit-popup">
									<button type="button" class="user-pro-bc-edit-popup"
										data-toggle="modal" data-target="#EmailexampleModal">Edit</button>

								</div>
							</div>
						</div>



						<!-- Modal Edit Email-->
						<div class="modal fade" id=EmailexampleModal tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Change
											Email</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">

										<div class="form-group">
											<label for="newName">Enter new email:</label> <input
												type="email" class="form-control" id="newEmail"
												value="<%=user.getEmail()%>" name="newEmail">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" id="saveEmail"
											data-dismiss="modal">Save changes</button>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="content security" id="securityContent">


					<div class="user-p-boxall">
						<!-- Password Change Box -->
						<div class="user-p-password-box">
							<div class="user-psecure-box-container">
								<p class="user-psecure-box-containerp">Password</p>
								<div class="user-psecure-bc-passwordbc">
									<p class="user-psecure-bc-passwordbc-name">Change your
										password regularly to keep your account secure</p>
								</div>
								<div class="userp-secure-btn-container">


									<button type="button" class="user-psecure-bc-password-btn"
										data-toggle="modal" data-target="#showChangePassModal">Change</button>

								</div>
							</div>
						</div>


						<!-- Modal Edit Password-->
						<div class="modal fade" id=showChangePassModal tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Change
											Password</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="newName">Current Password:</label> <input
												type="password" class="form-control" id="newName">
										</div>
										<div class="form-group">
											<label for="newName">New Password:</label> <input
												type="password" class="form-control" id="newName">
										</div>

										<div class="form-group">
											<label for="newName">Confirm Password:</label> <input
												type="password" class="form-control" id="newName">
										</div>



									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>





						<!-- Active Session Box Container -->
						<div class="user-p-activesession-box">
							<div class="user-psecure-box-container">
								<p class="user-psecure-box-containerp-activesession">Active
									session</p>
								<div class="user-psecure-bc-passwordbc">
									<p class="user-psecure-bc-passwordbc-name">Selecting 'Sign
										Out' will end your current session and sign you out from all
										devices.</p>
								</div>
								<div class="userp-secure-btn-container">
									<button class="user-psecure-bc-password-btn" type="button"
										id="signOutButton">Sign out</button>
								</div>
							</div>
						</div>
						<!-- Delete Account Box Container -->
						<div class="user-p-deleteacc-box">
							<div class="user-psecure-box-container">
								<p class="user-psecure-box-containerp-deleteacc">Delete
									Account</p>
								<div class="user-psecure-bc-passwordbc">
									<p class="user-psecure-bc-passwordbc-name">This action will
										permanently remove your account and all associated data,
										including your personal information and history. This cannot
										be undone. Please proceed with caution.</p>
								</div>
								<div class="userp-secure-btn-container">
									<button class="user-psecure-bc-password-btn" type="button"
										id="deleteAccountButton">Delete Account</button>
								</div>
							</div>
						</div>
					</div>


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

		document.getElementById('signOutButton').addEventListener('click',
				function() {
					var xhr = new XMLHttpRequest();
					xhr.open('POST', 'LogoutServlet', true);
					xhr.send();

					xhr.onreadystatechange = function() {
						if (xhr.readyState === 4 && xhr.status === 200) {
							window.location.href = 'index.jsp';
						}
					};
				});

		document.getElementById('saveName').addEventListener('click',
				function() {
					var newName = document.getElementById('newName').value;
					var newEmail = document.getElementById('newEmail').value;

					document.getElementById('up_name').innerText = newName;
					document.getElementById('pd_email').innerText = newEmail;
					document.getElementById('pd_name').innerText = newName;

					$.ajax({
						type : 'POST',
						url : 'UserEditServlet',
						data : {
							name : newName,
							email : newEmail
						}
					});
				});

		document.getElementById('saveEmail').addEventListener('click',
				function() {
					var newName = document.getElementById('newName').value;
					var newEmail = document.getElementById('newEmail').value;

					document.getElementById('up_name').innerText = newName;
					document.getElementById('pd_email').innerText = newEmail;
					document.getElementById('pd_name').innerText = newName;

					$.ajax({
						type : 'POST',
						url : 'UserEditServlet',
						data : {
							name : newName,
							email : newEmail
						}
					});
				});

		document.getElementById('deleteAccountButton').addEventListener(
				'click', function() {
					var xhr = new XMLHttpRequest();
					xhr.open('POST', 'DeleteUserServlet', true);
					xhr.send();

					xhr.onreadystatechange = function() {
						if (xhr.readyState === 4 && xhr.status === 200) {
							window.location.href = 'index.jsp';
						}
					};
				});
	</script>
	<script src="js/userprofile.js"></script>

</body>
</html>