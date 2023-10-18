<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EventEaze</title>
<%@include file="CSS/allcss.jsp"%>
<link rel="stylesheet" href="CSS/adminDashboard.css">

</head>
<body>

	<div class="admin-navbar">

		<div class="admin-navbar-header">

			<nav class="navbar navbar-expand-lg bgcl  ">
				<div class="container row">
					<div class="logo-container">
						<a class="navbar-brand" href="index.jsp"> <img
							src="assets/logo.png" width="60" height="60"
							class="d-inline-block align-top" alt="">
						</a>
						<div>
							<h3 class="font-wh mt-17">EventEaze</h3>
						</div>


						<div class="dash-text">
							<h1 class="font-wh mt-17">
								Admin Dashboard
								</h3>
						</div>
					</div>


				</div>
			</nav>

		</div>




		<div class="tab-container">
			<div class="tab">
				<button class="tablinks active" onclick="openTab('Places')">
					<b>Places</b>
				</button>
				<button class="tablinks" onclick="openTab('Decorations')">
					<b>Decorations</b>
				</button>
				<button class="tablinks" onclick="openTab('Catering')">
					<b>Catering</b>
				</button>
			</div>

			<br>

			<!-- Places Tab -->

			<div class="tab-content" id="Places">

				<div class="tabplaces">
					<button class="tablinksplaces activeplace"
						onclick="openTabPlaces('PlacesHistory')">
						<b>Places</b>
					</button>
					<button class="tablinksplaces"
						onclick="openTabPlaces('CreatePlace')">
						<b>Create Place</b>
					</button>
				</div>

				<div class="all-tabs-box">
					<div class="tab-content-places" id="PlacesHistory">Places
						Table</div>

					<div class="tab-content-places" id="CreatePlace">

						<h5>Create a New Place</h5>

						<div class="tab-form-all">

							<form>
								<div class="tab-form-field">
									<label>Image</label> <input type="file" id="myFile"
										name="filename" class="form-control">
								</div>

								<div class="tab-form-field">
									<label>Name</label> <input type="text" id="name"
										class="form-control" required="required" name="name">
								</div>

								<div class="tab-form-field">
									<label>Location</label> <input type="text" id="location"
										class="form-control" required="required" name="location">
								</div>

								<div class="tab-form-field">
									<label>Type</label> <select name="type" id="type"
										class="form-control">
										<option value="Hotel">Hotel</option>
										<option value="Restaurant">Restaurant</option>
										<option value="Wedding Hall">Wedding Hall</option>
										<option value="Beach Camp">Beach Camp</option>
									</select>
								</div>

								<div class="tab-form-field">
									<label>Price</label> <input type="text" id="price"
										class="form-control" required="required" name="price">
								</div>

								<div class="tab-form-field">
									<label>Rating(Out of 10)</label> <input type="text" id="rating"
										class="form-control" required="required" name="rating">
								</div>

								<button type="submit" class="btn btn-primary">Create</button>
							</form>

						</div>
					</div>
				</div>

			</div>

			<!-- Decoration Tab -->

			<div class="tab-content" id="Decorations">

				<div class="tabdeco">
					<button class="tablinksdeco activedeco"
						onclick="openTabDeco('DecoHistory')">
						<b>Decoration</b>
					</button>
					<button class="tablinksdeco" onclick="openTabDeco('CreateDeco')">
						<b>Create Decoration</b>
					</button>
				</div>

				<div class=all-tabs-box>
					<div class="tab-content-deco" id="DecoHistory">Decoration
						Table</div>

					<div class="tab-content-deco" id="CreateDeco">

						<h5>Create a New Decorator</h5>

						<div class="tab-form-all">

							<form>
								<div class="tab-form-field">
									<label>Image</label> <input type="file" id="myFileDeco"
										name="filenameDeco" class="form-control">
								</div>

								<div class="tab-form-field">
									<label>Name</label> <input type="text" id="nameDeco"
										class="form-control" required="required" name="nameDeco">
								</div>

								<div class="tab-form-field">
									<label>Location</label> <input type="text" id="locationDeco"
										class="form-control" required="required" name="locationDeco">
								</div>

								<div class="tab-form-field">
									<label>Type</label> <select name="typeDeco" id="typeDeco"
										class="form-control">
										<option value="Luxury">Luxury</option>
										<option value="Premium">Premium</option>
										<option value="Gold">Gold</option>
										<option value="Silver">Silver</option>
									</select>
								</div>

								<div class="tab-form-field">
									<label>Price</label> <input type="text" id="priceDeco"
										class="form-control" required="required" name="priceDeco">
								</div>

								<div class="tab-form-field">
									<label>Rating(Out of 10)</label> <input type="text"
										id="ratingDeco" class="form-control" required="required"
										name="ratingDeco">
								</div>

								<button type="submit" class="btn btn-primary">Create</button>
							</form>

						</div>

					</div>
				</div>


			</div>



			<!-- Catering Tab -->

			<div class="tab-content" id="Catering">

				<div class="tabcat">

					<button class="tablinkscat activecat"
						onclick="openTabCat('CatHistory')">
						<b>Catering</b>
					</button>

					<button class="tablinkscat" onclick="openTabCat('CreateCat')">
						<b>Create Catering</b>
					</button>
				</div>

				<div class=all-tabs-box>
					<div class="tab-content-cat" id="CatHistory">Catering Table</div>

					<div class="tab-content-cat" id="CreateCat">
					
					
					
						<h5>Create New Catering Service</h5>

						<div class="tab-form-all">

							<form>
								<div class="tab-form-field">
									<label>Image</label> <input type="file" id="myFileCat"
										name="filenameCat" class="form-control">
								</div>

								<div class="tab-form-field">
									<label>Name</label> <input type="text" id="nameDeco"
										class="form-control" required="required" name="nameCat">
								</div>

								<div class="tab-form-field">
									<label>Location</label> <input type="text" id="locationCat"
										class="form-control" required="required" name="locationCat">
								</div>

								<div class="tab-form-field">
									<label>Type</label> <select name="typeDeco" id="typeCat"
										class="form-control">
										<option value="Luxury">Luxury</option>
										<option value="Premium">Premium</option>
										<option value="Gold">Gold</option>
										<option value="Silver">Silver</option>
									</select>
								</div>

								<div class="tab-form-field">
									<label>Price</label> <input type="text" id="priceCat"
										class="form-control" required="required" name="priceCat">
								</div>

								<div class="tab-form-field">
									<label>Rating(Out of 10)</label> <input type="text"
										id="ratingCat" class="form-control" required="required"
										name="ratingCat">
								</div>

								<button type="submit" class="btn btn-primary">Create</button>
							</form>

						</div>
					
					
					</div>
				</div>

			</div>
		</div>


	</div>

	<script src="js/adminDashboard.js"></script>
</body>
</html>