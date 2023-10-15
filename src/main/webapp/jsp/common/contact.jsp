<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EventEaze</title>
<%@include file="../../CSS/allcss.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../../CSS/style.css">
<link rel="stylesheet" href="../../CSS/devidebegin.css">
</head>
<body>

	<div class="about-us">

		<div>
			<!-- NavBar -->
			<nav class="navbar navbar-expand-lg bgcl ">
				<div class="container">
					<div class="logo-container">
						<a class="navbar-brand" href="../../index.jsp"> <img
							src="../../assets/logo.png" width="80" height="80"
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
								class="nav-link h6 font-wh nav-link-fade-up"
								href="../../index.jsp">Home</a></li>
							<li class="nav-item"><a
								class="nav-link h6 font-wh nav-link-fade-up" href="aboutus.jsp">About
									Us</a></li>
							<li class="nav-item"><a
								class="nav-link h6 font-wh nav-link-fade-up" href="contact.jsp">Contact
									Us</a></li>
							<button class=" btn-nav" id="planEventButton2">Plan your
								event</button>

						</ul>
					</div>
				</div>
			</nav>
		</div>

		<div class="contact-container">
		
			<!-- Contact Start -->
			<div class="container-xxl py-5 white-box">
				<div class="container">
					<div class="text-center mx-auto mb-5 wow fadeInUp"
						data-wow-delay="0.1s" style="max-width: 600px;">
						<img src="../../assets/contact us3.png" >
						<h1>If You Have Any Query, Please Feel Free Contact Us</h1>
					</div>
					<div class="row g-0 justify-content-center">
						<div class="col-lg-8 wow fadeInUp" data-wow-delay="0.5s">
							<p class="text-center2 mb-4">Your Questions, Our Answers. At
								Online EnviroPlan, we're here to assist you. If you have any
								queries, please feel free to contact us. Together, let's shape a
								greener future</p>
							<form>
								<div class="row g-3">
									<div class="col-md-6">
										<div class="form-floating">
											<input type="text" class="form-control" id="name"
												placeholder="Your Name"> <label for="name">Your
												Name</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating">
											<input type="email" class="form-control" id="email"
												placeholder="Your Email"> <label for="email">Your
												Email</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<input type="text" class="form-control" id="subject"
												placeholder="Subject"> <label for="subject">Subject</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<textarea class="form-control"
												placeholder="Leave a message here" id="message"
												style="height: 200px"></textarea>
											<label for="message">Message</label>
										</div>
									</div>
									<div class="col-12 text-center">
										<button class="btn btn-primary rounded-pill py-3 px-5"
											type="submit">Send Message</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Contact End -->


			<!-- Google Map Start -->
			<div class="container-xxl pt-5 px-0 wow fadeIn" data-wow-delay="0.1s">
				<iframe class="w-100 mb-n2" style="height: 450px;"
					src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15843.194046863206!2d79.9729445!3d6.9146775!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae256db1a6771c5%3A0x2c63e344ab9a7536!2sSri%20Lanka%20Institute%20of%20Information%20Technology!5e0!3m2!1sen!2slk!4v1697130637375!5m2!1sen!2slk"
					frameborder="0" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
			</div>
			<!-- Google Map End -->
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
										<img class="img-fluid rounded" src="../../assets/gal1.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="../../assets/gal2.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="../../assets/gal3.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="../../assets/gal4.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="../../assets/gal5.jpg"
											alt="Image">
									</div>
									<div class="col-4">
										<img class="img-fluid rounded" src="../../assets/gal6.jpg"
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

	<script>
		document.getElementById('planEventButton2').addEventListener('click',
				function() {
					window.location.href = '../../devidebegin.jsp';
				});
	</script>

</body>
</html>