<%@page import="java.io.Console"%>
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

</head>
<body>
	<%
	ArrayList<Place> placesList = (ArrayList<Place>) request.getAttribute("placesList");
	ArrayList<Decorator> decoratorList = (ArrayList<Decorator>) request.getAttribute("decoratorList");
	ArrayList<Catering> cateringList = (ArrayList<Catering>) request.getAttribute("cateringList");
	String activeTab = (String) request.getAttribute("activeTab");
	String reload = (String) request.getAttribute("reload");
	%>
	<input type="hidden" id="activeTab" name="activeTab"
		value=<%=activeTab != null ? activeTab : "Places"%> />
	<input type="hidden" id="reload" name="reload"
		value=<%=reload != null ? reload : "true"%> />
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
					<button class="tablinks active" onclick="openTab('Places')"
						name="action" value="view" id="places">
						<b>Places</b>
					</button>
				</form>
				<form action="DecorationsServlet" method="post">
					<button class="tablinks" onclick="openTab('Decorations')"
						name="actionDeco" value="view" id="decorations">
						<b>Decorations</b>
					</button>
				</form>
				<form action="CateringServlet" method="post">
					<button class="tablinks" onclick="openTab('Catering')"
						name="actionCatering" value="view" id="catering">
						<b>Catering</b>
					</button>
				</form>
			</div>

			<br>

			<!-- Places Tab -->

			<div class="tab-content" id="Places">

				<div class="tabplaces">

					<button class="tablinksplaces activeplace"
						onclick="openTabPlaces('PlacesHistory')">
						<b>Places</b>
					</button>

					<button class="tablinksplaces" name="action" value="create"
						onclick="openTabPlaces('CreatePlace')">
						<b>Create Place</b>
					</button>
				</div>


				<div class="all-tabs-box">
					<div class="tab-content-places" id="PlacesHistory">
						<table class="styled-table" border="1">
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Location</th>
									<th>Type</th>
									<th>Price</th>
									<th>Rating</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
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
									<td>
										<button class="edit-button" type="button" data-toggle="modal"
											data-target="#editModal<%=place.getId()%>">Edit</button>	
									</td>


									<!-- Modal Edit Place-->
									<div class="modal fade" id="editModal<%=place.getId()%>"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Edit
														Place</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form action="PlacesServlet" method="post">
													<div class="modal-body">
	
														<div class="form-group">
															<label for="newNamePlace">Enter new name:</label> <input
																type="text" class="form-control" id="newNamePlace"
																value="<%=place.getName()%>" name="newNamePlace">
														</div>
	
														<div class="form-group">
															<label for="newLocationPlace">Enter new location:</label>
															<input type="text" class="form-control"
																id="newLocationPlace" value="<%=place.getLocation()%>"
																name="newLocationPlace">
														</div>
	
														<div class="form-group">
															<label for="newLocationPlace">Enter new price:</label> <input
																type="text" class="form-control" id="newLocationPlace"
																value="<%=place.getPrice()%>" name="newPricePlace">
														</div>
	
	
														<div class="form-group">
															<label for="newRatingPlace">Enter new rating:</label> <input
																type="text" class="form-control" id="newRatingPlace"
																value="<%=place.getRating()%>" name="newRatingPlace">
														</div>
														<input type="hidden" name="placeId" value="<%= place.getId() %>">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button class="btn btn-primary" id="saveNamePlace"  name="action" value="edit">Save changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>
									
									<td>
										<form action="PlacesServlet" method="post">
											<input type="hidden" name="placeId" value="<%= place.getId() %>">
											<button class="delete-button" id="deletePlace" name="action" value="delete" placeId="<%= place.getId() %>">Delete</button>
										</form>
									</td>				
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="8">Empty</td>
								</tr>
								<%
								}
								%>
							</tbody>
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

					<button class="tablinksdeco activedeco"
						onclick="openTabDeco('DecoHistory')">
						<b>Decoration</b>
					</button>
					<button class="tablinksdeco" onclick="openTabDeco('CreateDeco')">
						<b>Create Decoration</b>
					</button>
				</div>

				<div class=all-tabs-box>
					<div class="tab-content-deco" id="DecoHistory">
						<table class="styled-table" border="1">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Location</th>
									<th>Type</th>
									<th>Price</th>
									<th>Rating</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
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
									<td><button class="edit-button" type="button"
											data-toggle="modal"
											data-target="#editModalDeco<%=decorator.getId()%>">Edit</button>
									</td>
									<td>
										<form action="DecorationsServlet" method="post">
											<input type="hidden" name="decoId" value="<%= decorator.getId() %>">
											<button class="delete-button" name="actionDeco" value="delete">Delete</button>
										</form>
									</td>


									<!-- Modal Edit Decorator-->
									<div class="modal fade"
										id="editModalDeco<%=decorator.getId()%>" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
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
												<form action="DecorationsServlet" method="post">
													<div class="modal-body">
	
														<div class="form-group">
															<label for="newNameDeco">Enter new name:</label> <input
																type="text" class="form-control" id="newNameDeco"
																value="<%=decorator.getName()%>" name="newNameDeco">
														</div>
	
														<div class="form-group">
															<label for="newLocationDeco">Enter new location:</label> <input
																type="text" class="form-control" id="newLocationDeco"
																value="<%=decorator.getLocation()%>"
																name="newLocationDeco">
														</div>
	
														<div class="form-group">
															<label for="newLocationDeco">Enter new price:</label> <input
																type="text" class="form-control" id="newPriceDeco"
																value="<%=decorator.getPrice()%>" name="newPriceDeco">
														</div>
	
	
														<div class="form-group">
															<label for="newRatingDeco">Enter new rating:</label> <input
																type="text" class="form-control" id="newRatingDeco"
																value="<%=decorator.getRating()%>" name="newRatingDeco">
														</div>
														<input type="hidden" name="decoId" value="<%= decorator.getId() %>">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button class="btn btn-primary" id="saveNameDeco"  name="actionDeco" value="edit">Save changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>



								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="8">Empty</td>
								</tr>
								<%
								}
								%>
							</tbody>
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

								<button type="submit" class="btn btn-primary" name="actionDeco"
									value="create">Create</button>
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
						<table class="styled-table" border="1">
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Location</th>
									<th>Type</th>
									<th>Price</th>
									<th>Rating</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
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
									<td><button class="edit-button" type="button"
											data-toggle="modal"
											data-target="#editModalDeco<%=catering.getId()%>">Edit</button>
									</td>
									
									
									<!-- Modal Edit Catering-->
									<div class="modal fade"
										id="editModalDeco<%=catering.getId()%>" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
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
												<form action="CateringServlet" method="post">
													<div class="modal-body">
	
														<div class="form-group">
															<label for="newNameCater">Enter new name:</label> <input
																type="text" class="form-control" id="newNameCater"
																value="<%=catering.getName()%>" name="newNameCater">
														</div>
	
														<div class="form-group">
															<label for="newLocationCater">Enter new location:</label> <input
																type="text" class="form-control" id="newLocationCater"
																value="<%=catering.getLocation()%>"
																name="newLocationCater">
														</div>
	
														<div class="form-group">
															<label for="newLocationCater">Enter new price:</label> <input
																type="text" class="form-control" id="newPriceCater"
																value="<%=catering.getPrice()%>" name="newPriceCater">
														</div>
	
	
														<div class="form-group">
															<label for="newRatingCater">Enter new rating:</label> <input
																type="text" class="form-control" id="newRatingCater"
																value="<%=catering.getRating()%>" name="newRatingCater">
														</div>
														<input type="hidden" name="cateringId" value="<%= catering.getId() %>">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button class="btn btn-primary" id="saveNameCater" name="actionCatering" value="edit">Save changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>
									
									
									<td>
										<form action="CateringServlet" method="post">
											<input type="hidden" name="cateringId" value="<%= catering.getId() %>">
											<button class="delete-button" name="actionCatering" value="delete">Delete</button>
										</form>	
									</td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="8">Empty</td>
								</tr>
								<%
								}
								%>
							</tbody>
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
									<label>Location</label> <input type="text"
										id="locationCatering" class="form-control" required="required"
										name="locationCatering">
								</div>

								<div class="tab-form-field">
									<label>Type</label> <select name="typeCatering"
										id="typeCatering" class="form-control">
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

								<button type="submit" class="btn btn-primary"
									name="actionCatering" value="create">Create</button>
							</form>

						</div>


					</div>
				</div>

			</div>
		</div>


	</div>
	<script src="js/adminDashboard.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const button = document.getElementById('places');
			const activeTab = document.getElementById('activeTab').value;
			const reload = document.getElementById('reload').value;

			if (button && reload === "true") {
				button.click();
			}

			if (activeTab != null) {
				openTab(activeTab)
			}

		});
	</script>
</body>
</html>