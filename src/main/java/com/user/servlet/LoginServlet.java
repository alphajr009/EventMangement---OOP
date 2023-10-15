package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.models.AuthResponse;
import com.oop.services.UserAuthService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserAuthService authService = new UserAuthService();
		AuthResponse response = authService.loginUser(email, password);
		
		RequestDispatcher dispatcher = null;
		if (response.getStatus() == true) {
			request.setAttribute("Name", response.getUser().getName());
			dispatcher = request.getRequestDispatcher("/userHome.jsp");
		} else {
			request.setAttribute("ErrorLogin", response.getNarration());
			request.setAttribute("ActiveTab", "login");
			dispatcher = request.getRequestDispatcher("/devidebegin.jsp");
		}
		dispatcher.forward(request, resp);
	}

}
