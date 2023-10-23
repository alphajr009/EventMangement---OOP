package com.oop.db.handler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.oop.consts.CommonConsts;
import com.oop.models.User;

import jakarta.servlet.jsp.jstl.sql.Result;

public class UserDAOImpl implements UserDAOI{

	private Connection conn;
	
	private final String ADD_USER = "insert into users(name,email,password,isAdmin) values(?,?,?,?)";
	private final String GET_EXISTING_USER = "select id, name, email, password, isAdmin from users where email = ?";
	private final String UPDATE_USER = "update users set name = ?, email = ? where id = ?";
	private final String DELETE_USER = "delete from users where id = ?";

	public UserDAOImpl() {
		super();
	}

	@Override
	public boolean userRegsiter(User user) {
		boolean status = false;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(ADD_USER);
			ps.setString(CommonConsts.NUMBER_1, user.getName());
			ps.setString(CommonConsts.NUMBER_2, user.getEmail());
			ps.setString(CommonConsts.NUMBER_3, user.getPassword());
			ps.setInt(CommonConsts.NUMBER_4, 0);
			
			int result = ps.executeUpdate();
			if(result == 1) {
				status =true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			status=false;
		}
		
		return status;
	}
	
	@Override
	public boolean isExistingUserAvailable(String email) {
		boolean status = false;
		ResultSet resultSet = null;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_EXISTING_USER);
			ps.setString(CommonConsts.NUMBER_1, email);
			
			resultSet = ps.executeQuery();
			
			if (resultSet.next()) {
				status = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	@Override
	public User loginUser(String email) {
		User user = null;
		ResultSet resultSet = null;
		
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(GET_EXISTING_USER);
			ps.setString(CommonConsts.NUMBER_1, email);
			
			resultSet = ps.executeQuery();
			
			if (resultSet.next()) {
				user = new User();
				
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword(resultSet.getString("password"));
				user.setAdmin(resultSet.getInt("isAdmin"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean editUser(User user) {
		boolean status = false;
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(UPDATE_USER);
			ps.setString(CommonConsts.NUMBER_1, user.getName());
			ps.setString(CommonConsts.NUMBER_2, user.getEmail());
			ps.setInt(CommonConsts.NUMBER_3, user.getId());
			
			int result = ps.executeUpdate();
			if(result == 1) {
				status =true;
			}
		} catch(Exception e) {
			status = false;
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int deleteUser(int userId) {
		int noOfRows = 0;
		try {
			conn = DBConnector.getDBConnection();
			PreparedStatement ps = conn.prepareStatement(DELETE_USER);
			ps.setInt(CommonConsts.NUMBER_1, userId);
			
			noOfRows = ps.executeUpdate();
		} catch (Exception e) {
			noOfRows = 0;
			e.printStackTrace();
		}
		return noOfRows;
	}
	
	
	
}

