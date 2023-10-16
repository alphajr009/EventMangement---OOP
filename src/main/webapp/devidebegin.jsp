<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EventEaze</title>
<%@include file="CSS/allcss.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/devidebegin.css">

<style>
.error-message {
	color: red;
}
</style>

</head>
<body>

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
							<button class=" btn-nav">Plan your event</button>

						</ul>
					</div>
				</div>
			</nav>
		</div>

		<!-- Devide Begin -->

		<div class="devide-begin-container">
			<div class="tabbed-form">
				<div class="tabbed-header">
					<button class="tab-button active" data-tab="login"
						onclick="changeTab(this)">Login</button>
					<button class="tab-button" data-tab="signup"
						onclick="changeTab(this)">Sign Up</button>
				</div>

				<div class="tab-content">

					<!-- Login Form -->

					<div class="tab-panel active " id="login-form">
						<div class="tab-lr">
							<div class="lr-content-card">
								<img src="assets/logincard.png" width="400" alt="">
							</div>

							<div class="lr-content">
								<div>
									<h2>Welcome Back</h2>
									<p>We are glad to see you back with us</p>
								</div>
								<form action="login" method="post">
									<div class="form-group">
										<label for="loginEmail"><b>Email</b></label> <input
											type="email" id="loginEmail" class="form-control"
											name="email">
									</div>
									<div class="form-group">
										<label for="loginPassword"><b>Password</b></label> <input
											type="password" id="loginPassword" class="form-control"
											name="password">
									</div>

									<div>
										<%
											String errorLogin = (String) request.getAttribute("ErrorLogin");
											String activeTabLogin = (String) request.getAttribute("ActiveTab");
											if (errorLogin != null && !errorLogin.isEmpty()) {
										%>
											<div class="logError" data-tab=<%=activeTabLogin%>><%=errorLogin%></div>
										<%
											}
										%>
									</div>
									<div class="dbc-btn">
										<button class="btn btn-primary">Login</button>
										<p>
											Don't have an account, Click here to <a href="#">Register</a>
										</p>
									</div>

								</form>
							</div>
						</div>
					</div>


					<!-- Sign Up Form -->

					<div class="tab-panel" id="signup-form">
						<div class="tab-lr">
							<div class="lr-content-card">
								<img src="assets/registerCard.png" width="400" alt="">
							</div>

							<div class="lr-content">
								<div>
									<h2>Get Started</h2>
									<p>Create your account to plan your event</p>
								</div>
								<form action="register" method="post">
									<div class="form-group">
										<label for="name"><b>Name</b></label> <input type="text"
											id="name" class="form-control" required="required"
											name="name">
									</div>
									<div class="form-group">
										<label for="signupEmail"><b>Email</b></label> <input
											type="email" id="signupEmail" class="form-control"
											required="required" name="email">
									</div>
									<div class="form-group">
										<label for="signupPassword"><b>Password</b></label> <input
											type="password" id="signupPassword" class="form-control"
											required="required" name="password">
										<div id="passwordError" class="error-message"></div>
									</div>
									<div class="form-group">
										<label for="confirmPassword"><b>Confirm Password</b></label> <input
											type="password" id="confirmPassword" class="form-control"
											required="required" name="cpassword">
										<div id="confirmPasswordError" class="error-message"></div>
									</div>
									<div>
										<%
											String errorRegister = (String) request.getAttribute("ErrorRegister");
											String activeTabRegister = (String) request.getAttribute("ActiveTab");
											if (errorRegister != null && !errorRegister.isEmpty()) {
										%>
											<div class="regError" data-tab=<%=activeTabRegister%>><%=errorRegister%></div>
										<%
											} 
										%>
									</div>
									<div class="dbc-btn">
										<button type="submit" class="btn btn-primary">Sign Up</button>
										<p>
											Already have an account, Click here to <a href="#">Login</a>
										</p>
									</div>

								</form>
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
    function changeTab(ref) {
        try {
            const tabName = ref.getAttribute("data-tab");

            const tabPanels = document.querySelectorAll(".tab-panel");

            const tabButtons = document.querySelectorAll(".tab-button");

            tabPanels.forEach((panel) => {
                panel.classList.remove('active');
            });

            tabButtons.forEach((button) => {
                button.classList.remove('active');
            });

            document.getElementById(tabName + "-form").classList.add('active');

            ref.classList.add('active');
        } catch (msg) {
            console.log(msg);
        }
    }
    
    document.addEventListener("DOMContentLoaded", function () {
       
        const signUpForm = document.querySelector("#signup-form form");
        signUpForm.addEventListener("submit", function (event) {
            event.preventDefault();

            // Get the form inputs
            const passwordInput = document.querySelector("#signupPassword");
            const confirmPasswordInput = document.querySelector("#confirmPassword");

            // Get the error message elements
            const passwordError = document.querySelector("#passwordError");
            const confirmPasswordError = document.querySelector("#confirmPasswordError");

            // Reset error messages
            passwordError.textContent = "";
            confirmPasswordError.textContent = "";

            // Validate password
            const password = passwordInput.value;
            if (password.length < 6 || !/[A-Z]/.test(password)) {
                passwordError.textContent = "Password must have at least 6 characters and one capital letter.";
                return;
            }

            // Confirm password
            const confirmPassword = confirmPasswordInput.value;
            if (password !== confirmPassword) {
                confirmPasswordError.textContent = "Passwords do not match.";
                return;
            }

            signUpForm.submit(); 
        });
        
        const regErrorMessages = document.querySelectorAll(".regError");
        regErrorMessages.forEach((errorMessage) => {
            const tabPanels = document.querySelectorAll(".tab-panel");
            const tabButtons = document.querySelectorAll(".tab-button");

            tabPanels.forEach((panel) => {
                panel.classList.remove('active');
            });

            tabButtons.forEach((button) => {
                button.classList.remove('active');
            });
            
            const tabName = regErrorMessages.getAttribute("data-tab");
            document.getElementById(tabName + "-form").classList.add('active');
            const tabButton = document.querySelector(`[data-tab=${tabName}]`);
            tabButton.classList.add('active');
        });
        
        const logErrorMessage = document.querySelectorAll(".regError");
        logErrorMessage.forEach((errorMessage) => {
            const tabPanels = document.querySelectorAll(".tab-panel");
            const tabButtons = document.querySelectorAll(".tab-button");

            tabPanels.forEach((panel) => {
                panel.classList.remove('active');
            });

            tabButtons.forEach((button) => {
                button.classList.remove('active');
            });
            
            const tabName = logErrorMessage.getAttribute("data-tab");
            document.getElementById(tabName + "-form").classList.add('active');
            const tabButton = document.querySelector(`[data-tab=${tabName}]`);
            tabButton.classList.add('active');
        });
    });
    
</script>

<script src="js/script.js"></script>

</body>
</html>