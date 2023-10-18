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
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("userSession");

	    UserService userService = new UserService();
	    boolean status = userService.deleteUser(user);
	    
	    if (status == true) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("userAccount.jsp");
		}
		
	}

}
