package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.consts.CommonConsts;
import com.oop.models.AuthResponse;
import com.oop.models.User;
import com.oop.services.UserService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserService authService = new UserService();
		AuthResponse response = authService.loginUser(email, password);
		
		RequestDispatcher dispatcher = null;
		if (response.getStatus() == true) {
			if (response.getUser().isAdmin() == CommonConsts.NUMBER_1) {
				request.setAttribute("User", response.getUser());
				dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
			} else {
				request.setAttribute("User", response.getUser());
				dispatcher = request.getRequestDispatcher("/userHome.jsp");
			}
		} else {
			request.setAttribute("ErrorLogin", response.getNarration());
			request.setAttribute("ActiveTab", "login");
			dispatcher = request.getRequestDispatcher("/devidebegin.jsp");
		}
		dispatcher.forward(request, resp);
	}

}
