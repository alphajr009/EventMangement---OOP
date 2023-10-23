package com.oop.db.handler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.oop.consts.CommonConsts;
import com.oop.models.Catering;
import com.oop.models.Decorator;
import com.oop.models.Event;
import com.oop.models.Place;

public class EventDAOImpl implements EventsDAOI {

	Connection conn = null;
	
	private final String GET_EVENTS_LIST = "select id, name, time, place, decorator, catering from events";
	private final String GET_PLACE_LIST = "select id, name from places";
	private final String GET_CATERING_LIST = "select id, name from catering";
	private final String GET_DECORATOR_LIST = "select id, name from decorator";
	private final String ADD_EVENT = "insert into events(name, time, place, decorator, catering) values (?,?,?,?,?)";
	private final String UPDATE_EVENT = "update events set name = ?, time = ?, place = ?, decorator = ?, catering = ? where id = ?";
	private final String DELETE_EVENT = "delete from events where id = ?";
	
	
	
	@Override
	public ArrayList<Event> loadEventList() {
		ArrayList<Event> eventsList = new ArrayList<Event>();
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_EVENTS_LIST);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				Event event = new Event();
				
				event.setId(resultSet.getInt("id"));
				event.setName(resultSet.getString("name"));
				event.setTime(resultSet.getString("time"));
				event.setPlace(resultSet.getString("place"));
				event.setDecorator(resultSet.getString("decorator"));
				event.setCatering(resultSet.getString("catering"));
				
				eventsList.add(event);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return eventsList;
	}

	@Override
	public ArrayList<Place> loadPlaceList() {
		ArrayList<Place> placeList = new ArrayList<Place>();
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_PLACE_LIST);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				Place place = new Place();
				place.setId(resultSet.getInt("id"));
				place.setName(resultSet.getString("name"));
				
				placeList.add(place);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return placeList;
	}

	@Override
	public ArrayList<Decorator> loadDecoratorList() {
		ArrayList<Decorator> decoratorList = new ArrayList<Decorator>();
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_DECORATOR_LIST);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				Decorator decorator = new Decorator();
				decorator.setId(resultSet.getInt("id"));
				decorator.setName(resultSet.getString("name"));
				
				decoratorList.add(decorator);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return decoratorList;
	}

	@Override
	public ArrayList<Catering> loadCateringList() {
		ArrayList<Catering> cateringList = new ArrayList<Catering>();
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_CATERING_LIST);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				Catering catering = new Catering();
				catering.setId(resultSet.getInt("id"));
				catering.setName(resultSet.getString("name"));
				
				cateringList.add(catering);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cateringList;
	}

	@Override
	public int addEvent(Event event) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps =  conn.prepareStatement(ADD_EVENT);
			ps.setString(CommonConsts.NUMBER_1, event.getName());
			ps.setString(CommonConsts.NUMBER_2, event.getTime());
			ps.setString(CommonConsts.NUMBER_3, event.getPlace());
			ps.setString(CommonConsts.NUMBER_4, event.getDecorator());
			ps.setString(CommonConsts.NUMBER_5, event.getCatering());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateEvent(Event event) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps =  conn.prepareStatement(UPDATE_EVENT);
			ps.setString(CommonConsts.NUMBER_1, event.getName());
			ps.setString(CommonConsts.NUMBER_2, event.getTime());
			ps.setString(CommonConsts.NUMBER_3, event.getPlace());
			ps.setString(CommonConsts.NUMBER_4, event.getDecorator());
			ps.setString(CommonConsts.NUMBER_5, event.getCatering());
			ps.setInt(CommonConsts.NUMBER_6, event.getId());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deletEvent(int eventId) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(DELETE_EVENT);
			ps.setInt(CommonConsts.NUMBER_1, eventId);
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
