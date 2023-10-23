package com.oop.db.handler;

import java.util.ArrayList;

import com.oop.models.Catering;
import com.oop.models.Decorator;
import com.oop.models.Event;
import com.oop.models.Place;

public interface EventsDAOI {
	public ArrayList<Event> loadEventList();
	public ArrayList<Place> loadPlaceList();
	public ArrayList<Decorator> loadDecoratorList();
	public ArrayList<Catering> loadCateringList();
	public int addEvent(Event event);
	public int updateEvent(Event event);
	public int deletEvent(int eventId);
}
