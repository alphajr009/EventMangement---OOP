package com.oop.db.handler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.oop.consts.CommonConsts;
import com.oop.models.Decorator;

public class DecoratorDAOImpl implements DecoratorDAOI {
	
	Connection conn = null;
	
	private final String ADD_DECORATOR = "insert into decorator(name, location, type, price, rating) values(?,?,?,?,?)";
	private final String GET_ALL_DECORATORS = "select id, name, location, type, price, rating from decorator";
	private final String UPDATE_DECORATOR = "update decorator set name = ?, location = ?, price = ?, rating = ? where id = ?";
	private final String DELETE_DECORATOR = "delete from decorator where id = ?";
	
	@Override
	public int addDecorator(Decorator decorator) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(ADD_DECORATOR);
			ps.setString(CommonConsts.NUMBER_1, decorator.getName());
			ps.setString(CommonConsts.NUMBER_2, decorator.getLocation());
			ps.setString(CommonConsts.NUMBER_3, decorator.getType());
			ps.setFloat(CommonConsts.NUMBER_4, decorator.getPrice());
			ps.setInt(CommonConsts.NUMBER_5, decorator.getRating());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public ArrayList<Decorator> getDecoratorList() {
		ArrayList<Decorator> decoratorList = new ArrayList<Decorator>();
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ALL_DECORATORS);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				Decorator decorator = new Decorator();
				decorator.setId(resultSet.getInt("id"));
				decorator.setName(resultSet.getString("name"));
				decorator.setLocation(resultSet.getString("location"));
				decorator.setType(resultSet.getString("type"));
				decorator.setPrice(resultSet.getFloat("price"));
				decorator.setRating(resultSet.getInt("rating"));
				
				decoratorList.add(decorator);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return decoratorList;
	}

	@Override
	public int updateDecorator(Decorator decorator) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(UPDATE_DECORATOR);
			ps.setString(CommonConsts.NUMBER_1, decorator.getName());
			ps.setString(CommonConsts.NUMBER_2, decorator.getLocation());
			ps.setFloat(CommonConsts.NUMBER_3, decorator.getPrice());
			ps.setInt(CommonConsts.NUMBER_4, decorator.getRating());
			ps.setInt(CommonConsts.NUMBER_5, decorator.getId());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteDecorator(int decoratorId) {
		int result = 0;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(DELETE_DECORATOR);
			ps.setInt(CommonConsts.NUMBER_1, decoratorId);
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
