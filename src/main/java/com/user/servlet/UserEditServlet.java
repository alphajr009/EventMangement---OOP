package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oop.models.User;
import com.oop.services.UserService;

/**
 * Servlet implementation class UserEditServlet
 */
@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String newName = request.getParameter("name");
	    String newEmail = request.getParameter("email");

	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("userSession");

	    // Update the user's name and email in the session
	    user.setName(newName);
	    user.setEmail(newEmail);
	    
	    UserService userService = new UserService();
	    userService.editUserDetials(newName, newEmail, user.getId());
		response.sendRedirect("userAccount.jsp");
	}

}
