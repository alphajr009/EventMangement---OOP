package com.oop.db.handler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.oop.consts.CommonConsts;
import com.oop.models.Catering;

public class CateringDAOImpl implements CateringDAOI {

	Connection conn = null;
	
	private final String ADD_CATERING = "insert into catering(name, location, type, price, rating) values(?,?,?,?,?)";
	private final String GET_ALL_CATERING = "select id, name, location, type, price, rating from catering";
	private final String UPDATE_CATERING = "update catering set name = ?, location = ?, price = ?, rating = ? where id = ?";
	private final String DELETE_CATERING = "delete from catering where id = ?";
	
	
	@Override
	public int addCatering(Catering catering) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(ADD_CATERING);
			ps.setString(CommonConsts.NUMBER_1, catering.getName());
			ps.setString(CommonConsts.NUMBER_2, catering.getLocation());
			ps.setString(CommonConsts.NUMBER_3, catering.getType());
			ps.setFloat(CommonConsts.NUMBER_4, catering.getPrice());
			ps.setInt(CommonConsts.NUMBER_5, catering.getRating());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public ArrayList<Catering> getCateringList() {
		ArrayList<Catering> cateringList = new ArrayList<Catering>();
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ALL_CATERING);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				Catering catering = new Catering();
				
				catering.setId(resultSet.getInt("id"));
				catering.setName(resultSet.getString("name"));
				catering.setLocation(resultSet.getString("location"));
				catering.setType(resultSet.getString("type"));
				catering.setPrice(resultSet.getFloat("price"));
				catering.setRating(resultSet.getInt("rating"));
				
				cateringList.add(catering);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cateringList;
	}

	@Override
	public int updateCatering(Catering catering) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(UPDATE_CATERING);
			ps.setString(CommonConsts.NUMBER_1, catering.getName());
			ps.setString(CommonConsts.NUMBER_2, catering.getLocation());
			ps.setFloat(CommonConsts.NUMBER_3, catering.getPrice());
			ps.setInt(CommonConsts.NUMBER_4, catering.getRating());
			ps.setInt(CommonConsts.NUMBER_5, catering.getId());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteCatering(int cateringId) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(DELETE_CATERING);
			ps.setInt(CommonConsts.NUMBER_1, cateringId);
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
