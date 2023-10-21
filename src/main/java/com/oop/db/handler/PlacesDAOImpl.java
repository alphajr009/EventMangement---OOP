package com.oop.db.handler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.oop.consts.CommonConsts;
import com.oop.models.Place;

public class PlacesDAOImpl implements PlacesDAOI {

	private Connection conn;
	
	private final String ADD_PLACE = "insert into places(name, location, type, price, rating) values(?,?,?,?,?)";
	private final String GET_ALL_PLACES = "select id, name, location, type, price, rating from places";
	private final String DELETE_PLACE = "delete from places where id = ?";
	private final String UPDATE_PLACE = "update places set name = ?, location = ?, price = ?, rating = ? where id = ?";
	
	@Override
	public int addNewPlace(Place place) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(ADD_PLACE);
			ps.setString(CommonConsts.NUMBER_1, place.getName());
			ps.setString(CommonConsts.NUMBER_2, place.getLocation());
			ps.setString(CommonConsts.NUMBER_3, place.getType());
			ps.setFloat(CommonConsts.NUMBER_4, place.getPrice());
			ps.setInt(CommonConsts.NUMBER_5, place.getRating());
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}

	@Override
	public ArrayList<Place> getAllPlaces() {
		ArrayList<Place> placesList = new ArrayList<Place>();
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ALL_PLACES);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				Place place = new Place();
				
				place.setId(resultSet.getInt("id"));
				place.setName(resultSet.getString("name"));
				place.setLocation(resultSet.getString("location"));
				place.setType(resultSet.getString("type"));
				place.setPrice(resultSet.getFloat("price"));
				place.setRating(resultSet.getInt("rating"));
				
				placesList.add(place);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return placesList;
	}
	
	@Override
	public int deletePlace(int placeId) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(DELETE_PLACE);
			ps.setInt(CommonConsts.NUMBER_1, placeId);
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int updatePlace(Place place) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(UPDATE_PLACE);
			ps.setString(CommonConsts.NUMBER_1, place.getName());
			ps.setString(CommonConsts.NUMBER_2, place.getLocation());
			ps.setFloat(CommonConsts.NUMBER_3, place.getPrice());
			ps.setInt(CommonConsts.NUMBER_4, place.getRating());
			ps.setInt(CommonConsts.NUMBER_5, place.getId());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
