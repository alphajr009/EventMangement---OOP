package com.oop.services;

import java.util.ArrayList;

import com.oop.db.handler.EventDAOImpl;
import com.oop.models.Catering;
import com.oop.models.Decorator;
import com.oop.models.Event;
import com.oop.models.Place;

public class EventsService {
	
	EventDAOImpl eventDAOImpl = new EventDAOImpl();

	public ArrayList<Event> getEventList(){
		ArrayList<Event> eventList = null;
		
		eventList = eventDAOImpl.loadEventList();
		
		return eventList;
	}
	
	public ArrayList<Place> getPlaceList(){
		ArrayList<Place> placeList = null;
		
		placeList = eventDAOImpl.loadPlaceList();
		
		return placeList;
	}
	
	public ArrayList<Decorator> getDecoratorList(){
		ArrayList<Decorator> decoratorList = null;
		
		decoratorList = eventDAOImpl.loadDecoratorList();
		
		return decoratorList;
	}
	
	public ArrayList<Catering> getCateringList(){
		ArrayList<Catering> cateringList = null;
		
		cateringList = eventDAOImpl.loadCateringList();
		
		return cateringList;
	}
	
	public boolean createEvent(String eventName, String time, String catering, String decorator, String place) {
		boolean status = false;
		
		Event event = new Event();
		event.setName(eventName);
		event.setTime(time);
		event.setCatering(catering);
		event.setDecorator(decorator);
		event.setPlace(place);
		
		int result = eventDAOImpl.addEvent(event);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
	
	public boolean editEvent(String eventName, String time, String catering, String decorator, String place, int eventId) {
		boolean status = false;
		
		Event event = new Event();
		event.setId(eventId);
		event.setName(eventName);
		event.setTime(time);
		event.setCatering(catering);
		event.setDecorator(decorator);
		event.setPlace(place);
		
		int result = eventDAOImpl.updateEvent(event);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
	
	public boolean removeEvent(int eventId) {
		boolean status = false;
		
		int result = eventDAOImpl.deletEvent(eventId);
		
		if (result > 0 ) {
			status = true;
		}
		
		return status;
	}
}
