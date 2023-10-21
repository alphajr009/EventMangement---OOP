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
import com.oop.models.Catering;
import com.oop.services.CateringService;

/**
 * Servlet implementation class CateringServlet
 */
@WebServlet("/CateringServlet")
public class CateringServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tag = request.getParameter("actionCatering");
	    
	    CateringService cateringService = new CateringService();
	    if (tag.equalsIgnoreCase(CommonConsts.TAG_CREATE)) {
		    String name = request.getParameter("nameCatering");
		    String location = request.getParameter("locationCatering");
		    String type = request.getParameter("typeCatering");
		    String price = request.getParameter("priceCatering");
		    String rating = request.getParameter("ratingCatering");
		    
		    cateringService.createCatering(name, location, type, Float.parseFloat(price), Integer.parseInt(rating));
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_VIEW)) {
			ArrayList<Catering> cateringList = cateringService.getCateringList();
			request.setAttribute("cateringList", cateringList);
			request.setAttribute("activeTab", "Catering");
			request.setAttribute("reload", "false");
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_EDIT)) {
			String newName = request.getParameter("newNameCater");
			String newLocation = request.getParameter("newLocationCater");
			String newprice = request.getParameter("newPriceCater");
			String newRating = request.getParameter("newRatingCater");
			String cateringeId = request.getParameter("cateringId");
			
			boolean status = cateringService.editCatering(newName, newLocation, Float.parseFloat(newprice), Integer.parseInt(newRating), Integer.parseInt(cateringeId));
			
			if (status == true) {
				ArrayList<Catering> cateringList = cateringService.getCateringList();
				request.setAttribute("cateringList", cateringList);
				request.setAttribute("activeTab", "Catering");
				request.setAttribute("reload", "false");
			}
		} else if(tag.equalsIgnoreCase(CommonConsts.TAG_DELETE)) {
			String cateringId = request.getParameter("cateringId");
			boolean status = cateringService.removeCatering(Integer.parseInt(cateringId));
			
			if (status == true) {
				ArrayList<Catering> cateringList = cateringService.getCateringList();
				request.setAttribute("cateringList", cateringList);
				request.setAttribute("activeTab", "Catering");
				request.setAttribute("reload", "false");
			}
		}
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
	    dispatcher.forward(request, response);
	}

}
