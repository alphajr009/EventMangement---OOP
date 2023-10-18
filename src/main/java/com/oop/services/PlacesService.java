package com.oop.services;

import java.util.ArrayList;

import com.oop.db.handler.PlacesDAOImpl;
import com.oop.models.Place;

public class PlacesService {
	
	PlacesDAOImpl placesDAOImpl = new PlacesDAOImpl();

	public boolean createPlace(String name, String location, String type, float price, int rating) {
		boolean status = false;
		
		Place places = new Place();
		places.setName(name);
		places.setLocation(location);
		places.setType(type);
		places.setPrice(price);
		places.setRating(rating);
		
		int result = placesDAOImpl.addNewPlace(places);
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
	
	public ArrayList<Place> getPlacesList(){
		ArrayList<Place> placesList = placesDAOImpl.getAllPlaces();
		
		return placesList;
	}
}
