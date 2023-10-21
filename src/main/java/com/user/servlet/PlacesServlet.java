package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.consts.CommonConsts;
import com.oop.models.Place;
import com.oop.services.PlacesService;

/**
 * Servlet implementation class PlacesServlet
 */
@WebServlet("/PlacesServlet")
public class PlacesServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    String tag = request.getParameter("action");
	    
	    PlacesService placesService = new PlacesService();
	    if (tag.equalsIgnoreCase(CommonConsts.TAG_CREATE)) {
		    String name = request.getParameter("name");
		    String location = request.getParameter("location");
		    String type = request.getParameter("type");
		    String price = request.getParameter("price");
		    String rating = request.getParameter("rating");
		    
	    	placesService.createPlace(name, location, type, Float.parseFloat(price), Integer.parseInt(rating));
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_VIEW)) {
			ArrayList<Place> placesList = placesService.getPlacesList();
			request.setAttribute("placesList", placesList);
			request.setAttribute("activeTab", "Places");
			request.setAttribute("reload", "false");
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_DELETE)) {
			String placeId = request.getParameter("placeId");
			boolean status = placesService.removePlace(Integer.parseInt(placeId));
			if (status == true) {
				ArrayList<Place> placesList = placesService.getPlacesList();
				request.setAttribute("placesList", placesList);
				request.setAttribute("activeTab", "Places");
				request.setAttribute("reload", "false");
			}
		} else if(tag.equalsIgnoreCase(CommonConsts.TAG_EDIT)){
			String newName = request.getParameter("newNamePlace");
			String newLocation = request.getParameter("newLocationPlace");
			String newprice = request.getParameter("newPricePlace");
			String newRating = request.getParameter("newRatingPlace");
			String placeId = request.getParameter("placeId");
			
			boolean status = placesService.editPlace(newName, newLocation, Float.parseFloat(newprice), Integer.parseInt(newRating), Integer.parseInt(placeId));
			if (status == true) {
				ArrayList<Place> placesList = placesService.getPlacesList();
				request.setAttribute("placesList", placesList);
				request.setAttribute("activeTab", "Places");
				request.setAttribute("reload", "false");
			}
		}
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
	    dispatcher.forward(request, response);
	}

}
