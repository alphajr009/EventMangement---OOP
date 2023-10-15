package com.oop.db.handler;

import com.oop.models.User;

public interface UserDAOI {
	public boolean userRegsiter(User us);
	public boolean isExistingUserAvailable(String email);
	public User loginUser(String email);
}
