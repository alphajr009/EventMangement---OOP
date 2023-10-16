package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.db.handler.DBConnector;
import com.oop.db.handler.UserDAOImpl;
import com.oop.models.AuthResponse;
import com.oop.models.User;
import com.oop.services.UserService;

@WebServlet("/register")
public class RegiterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			UserService authService = new UserService();
			AuthResponse response = authService.registerUser(name, email, password);
			
			if (response.getStatus() == false) {
				request.setAttribute("ErrorRegister", response.getNarration());
				request.setAttribute("ActiveTab", "signup");
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/devidebegin.jsp");
			dispatcher.forward(request, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
