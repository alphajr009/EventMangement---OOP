package com.oop.services;

import com.oop.consts.CommonConsts;
import com.oop.db.handler.UserDAOImpl;
import com.oop.models.AuthResponse;
import com.oop.models.User;

public class UserAuthService {
	
	private UserDAOImpl userDAOImpl = new UserDAOImpl();
	private AuthResponse response = new AuthResponse();

	public AuthResponse registerUser(String name, String email, String password) {
		boolean status = false;
		
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		status = userDAOImpl.isExistingUserAvailable(user.getEmail());
		
		if (status == true) {
			response.setStatus(false);
			response.setNarration(CommonConsts.USER_AVAILABLE);
			return response;
		}
		
		status = userDAOImpl.userRegsiter(user);
		
		if (status = true) {
			response.setStatus(true);
			response.setNarration(CommonConsts.STATUS_SUCCESS);
		} else {
			response.setStatus(false);
			response.setNarration(CommonConsts.STATUS_FAILED);
		}
		
		return response;
	}
	
	public AuthResponse loginUser(String email, String password) {
		boolean status = false;
		
		User user = userDAOImpl.loginUser(email);
		
		if (user == null) {
			response.setStatus(false);
			response.setNarration(CommonConsts.LOGIN_ERROR_MSG);
		} else if (!password.equals(user.getPassword())) {
			response.setStatus(false);
			response.setNarration(CommonConsts.LOGIN_ERROR_MSG);
		} else {
			response.setStatus(true);
			response.setNarration(CommonConsts.STATUS_SUCCESS);
			response.setUser(user);
		}
		
		return response;
	}
}
