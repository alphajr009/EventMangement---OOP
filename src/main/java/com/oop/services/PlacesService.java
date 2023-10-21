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
	
	public boolean removePlace(int placeId) {
		boolean status = false;
		
		int result = placesDAOImpl.deletePlace(placeId);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
	
	public boolean editPlace(String newName, String newLocation, float newPrice, int newRating, int placeId) {
		boolean status = false;
		
		Place place = new Place();
		place.setId(placeId);
		place.setName(newName);
		place.setLocation(newLocation);
		place.setPrice(newPrice);
		place.setRating(newRating);
		
		int result = placesDAOImpl.updatePlace(place);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
}
