package com.oop.db.handler;

import java.util.ArrayList;

import com.oop.models.Place;

public interface PlacesDAOI {
	public int addNewPlace(Place place);
	public ArrayList<Place> getAllPlaces();
	public int deletePlace(int placeId);
	public int updatePlace(Place place);
}
