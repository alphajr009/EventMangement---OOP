package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.consts.CommonConsts;
import com.oop.models.Decorator;
import com.oop.services.DecorationService;

/**
 * Servlet implementation class DecorationsServlet
 */
@WebServlet("/DecorationsServlet")
public class DecorationsServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tag = request.getParameter("actionDeco");
	    
	    DecorationService decorationService = new DecorationService();
	    if (tag.equalsIgnoreCase(CommonConsts.TAG_CREATE)) {
		    String name = request.getParameter("nameDeco");
		    String location = request.getParameter("locationDeco");
		    String type = request.getParameter("typeDeco");
		    String price = request.getParameter("priceDeco");
		    String rating = request.getParameter("ratingDeco");
		    
	    	decorationService.createDecorator(name, location, type, Float.parseFloat(price), Integer.parseInt(rating));
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_VIEW)) {
			ArrayList<Decorator> decoratorList = decorationService.getAllDecorators();
			request.setAttribute("decoratorList", decoratorList);
			request.setAttribute("activeTab", "Decorations");
			request.setAttribute("reload", "false");
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_EDIT)) {
			String newName = request.getParameter("newNameDeco");
			String newLocation = request.getParameter("newLocationDeco");
			String newprice = request.getParameter("newPriceDeco");
			String newRating = request.getParameter("newRatingDeco");
			String placeId = request.getParameter("decoId");
			
			boolean status = decorationService.editDecorator(newName, newLocation, Float.parseFloat(newprice), Integer.parseInt(newRating), Integer.parseInt(placeId));
			
			if (status = true) {
				ArrayList<Decorator> decoratorList = decorationService.getAllDecorators();
				request.setAttribute("decoratorList", decoratorList);
				request.setAttribute("activeTab", "Decorations");
				request.setAttribute("reload", "false");
			}
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_DELETE)) {
			String decoratorId = request.getParameter("decoId");
			boolean status = decorationService.removeDecorator(Integer.parseInt(decoratorId));
			
			if (status == true) {
				ArrayList<Decorator> decoratorList = decorationService.getAllDecorators();
				request.setAttribute("decoratorList", decoratorList);
				request.setAttribute("activeTab", "Decorations");
				request.setAttribute("reload", "false");
			}
		}
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
	    dispatcher.forward(request, response);
	}

}
