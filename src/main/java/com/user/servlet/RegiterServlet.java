package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegiterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

//		System.out.println(name+ " " + email + " " + password);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.userRegsiter(us);

			if (f) {
				System.out.println("User Register Successfull");
				 resp.sendRedirect("devidebegin.jsp");
			} else {
				System.out.println("Error with User Register");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
