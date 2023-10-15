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
	
	private final String ADD_USER = "insert into users(name,email,password) values(?,?,?)";
	private final String GET_EXISTING_USER = "select id, name, email, password from users where email = ?";

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
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
	
}

