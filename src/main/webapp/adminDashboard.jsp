<%@page import="com.oop.models.Catering"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.models.Place"%>
<%@page import="com.oop.models.Decorator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EventEaze</title>
<%@include file="CSS/allcss.jsp"%>
<link rel="stylesheet" href="CSS/adminDashboard.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<%
	ArrayList<Place> placesList = (ArrayList<Place>) request.getAttribute("placesList");
	ArrayList<Decorator> decoratorList = (ArrayList<Decorator>) request.getAttribute("decoratorList");
	ArrayList<Catering> cateringList = (ArrayList<Catering>) request.getAttribute("cateringList");
	String activeTab = (String) request.getAttribute("activeTab");
	String reload = (String) request.getAttribute("reload");
	%>
	<input type="text" id="activeTab" name="activeTab" value=<%= activeTab != null ? activeTab : "Places" %> />
	<input type="text" id="reload" name="reload" value=<%= reload != null ? reload : "true" %> />
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
				<form action="PlacesServlet" method="post">
					<button class="tablinks active" onclick="openTab('Places')" name="action" value="view" id="places">
						<b>Places</b>
					</button>
				</form>
				<form action="DecorationsServlet" method="post">
					<button class="tablinks" onclick="openTab('Decorations')" name="actionDeco" value="view" id="decorations">
						<b>Decorations</b>
					</button>
				</form>
				<form action="CateringServlet" method="post">
					<button class="tablinks" onclick="openTab('Catering')" name="actionCatering" value="view" id="catering">
						<b>Catering</b>
					</button>
				</form>
			</div>

			<br>

			<!-- Places Tab -->

			<div class="tab-content" id="Places">

				<div class="tabplaces">

					<button class="tablinksplaces activeplace" onclick="openTabPlaces('PlacesHistory')">
						<b>Places</b>
					</button>

					<button class="tablinksplaces" name="action" value="create"
						onclick="openTabPlaces('CreatePlace')">
						<b>Create Place</b>
					</button>
				</div>


				<div class="all-tabs-box">
					<div class="tab-content-places" id="PlacesHistory">
						<table border="1">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Location</th>
								<th>Type</th>
								<th>Price</th>
								<th>Rating</th>
								<th>Actions</th>
							</tr>
							<%
							if (placesList != null && !placesList.isEmpty()) {
								for (Place place : placesList) {
							%>
							<tr>
								<td><%=place.getId()%></td>
								<td><%=place.getName()%></td>
								<td><%=place.getLocation()%></td>
								<td><%=place.getType()%></td>
								<td><%=place.getPrice()%></td>
								<td><%=place.getRating()%></td>
								<td>Edit/ Delete</td>
							</tr>
							<%
							}
							} else {
							%>
							<p>Empty</p>
							<%
							}
							%>
						</table>
					</div>

					<div class="tab-content-places" id="CreatePlace">

						<h5>Create a New Place</h5>

						<div class="tab-form-all">

							<form action="PlacesServlet" method="post">
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

								<button type="submit" class="btn btn-primary" id="createPlaces"
									name="action" value="create">Create</button>
							</form>

						</div>
					</div>
				</div>

			</div>

			<!-- Decoration Tab -->

			<div class="tab-content" id="Decorations">

				<div class="tabdeco">

					<button class="tablinksdeco activedeco" onclick="openTabDeco('DecoHistory')">
						<b>Decoration</b>
					</button>
					<button class="tablinksdeco" onclick="openTabDeco('CreateDeco')">
						<b>Create Decoration</b>
					</button>
				</div>

				<div class=all-tabs-box>
					<div class="tab-content-deco" id="DecoHistory">
						<table border="1">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Location</th>
								<th>Type</th>
								<th>Price</th>
								<th>Rating</th>
								<th>Actions</th>
							</tr>
							<%
							if (decoratorList != null && !decoratorList.isEmpty()) {
								for (Decorator decorator : decoratorList) {
							%>
							<tr>
								<td><%=decorator.getId()%></td>
								<td><%=decorator.getName()%></td>
								<td><%=decorator.getLocation()%></td>
								<td><%=decorator.getType()%></td>
								<td><%=decorator.getPrice()%></td>
								<td><%=decorator.getRating()%></td>
								<td>Edit/ Delete</td>
							</tr>
							<%
							}
							} else {
							%>
							<p>Empty</p>
							<%
							}
							%>
						</table>
					</div>

					<div class="tab-content-deco" id="CreateDeco">

						<h5>Create a New Decorator</h5>

						<div class="tab-form-all">

							<form action="DecorationsServlet" method="post">
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

								<button type="submit" class="btn btn-primary" name="actionDeco" value="create">Create</button>
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
					<div class="tab-content-cat" id="CatHistory">
						<table border="1">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Location</th>
								<th>Type</th>
								<th>Price</th>
								<th>Rating</th>
								<th>Actions</th>
							</tr>
							<%
							if (cateringList != null && !cateringList.isEmpty()) {
								for (Catering catering : cateringList) {
							%>
							<tr>
								<td><%=catering.getId()%></td>
								<td><%=catering.getName()%></td>
								<td><%=catering.getLocation()%></td>
								<td><%=catering.getType()%></td>
								<td><%=catering.getPrice()%></td>
								<td><%=catering.getRating()%></td>
								<td>Edit/ Delete</td>
							</tr>
							<%
							}
							} else {
							%>
							<p>Empty</p>
							<%
							}
							%>
						</table>
					</div>

					<div class="tab-content-cat" id="CreateCat">



						<h5>Create New Catering Service</h5>

						<div class="tab-form-all">

							<form action="CateringServlet" method="post">
								<div class="tab-form-field">
									<label>Image</label> <input type="file" id="myFileCat"
										name="filenameCat" class="form-control">
								</div>

								<div class="tab-form-field">
									<label>Name</label> <input type="text" id="nameCatering"
										class="form-control" required="required" name="nameCatering">
								</div>

								<div class="tab-form-field">
									<label>Location</label> <input type="text" id="locationCatering"
										class="form-control" required="required" name="locationCatering">
								</div>

								<div class="tab-form-field">
									<label>Type</label> <select name="typeCatering" id="typeCatering"
										class="form-control">
										<option value="Luxury">Luxury</option>
										<option value="Premium">Premium</option>
										<option value="Gold">Gold</option>
										<option value="Silver">Silver</option>
									</select>
								</div>

								<div class="tab-form-field">
									<label>Price</label> <input type="text" id="priceCatering"
										class="form-control" required="required" name="priceCatering">
								</div>

								<div class="tab-form-field">
									<label>Rating(Out of 10)</label> <input type="text"
										id="ratingCatering" class="form-control" required="required"
										name="ratingCatering">
								</div>

								<button type="submit" class="btn btn-primary" name="actionCatering" value="create">Create</button>
							</form>

						</div>


					</div>
				</div>

			</div>
		</div>


	</div>
	<script src="js/adminDashboard.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function () {
		    const button = document.getElementById('places');
		    const activeTab = document.getElementById('activeTab').value;
		    const reload = document.getElementById('reload').value;
		    
		    if(button && reload === "true"){
		    	button.click();
		    }
		    
		    if(activeTab !=null){
		    	openTab(activeTab)
		    }
		    
		});
	</script>
</body>
</html>