package com.oop.db.handler;

import com.oop.models.User;

public interface UserDAOI {
	public boolean userRegsiter(User user);
	public boolean isExistingUserAvailable(String email);
	public User loginUser(String email);
	public boolean editUser(User user);
	public int deleteUser(int userId);
}
