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
import com.oop.models.Decorator;
import com.oop.models.Event;
import com.oop.models.Place;
import com.oop.services.EventsService;
/**
 * Servlet implementation class Events
 */
@WebServlet("/EventsServlet")
public class EventsServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tag = request.getParameter("action");
		System.out.println(tag);
		
		
		EventsService eventsService = new EventsService();
		if (tag.equalsIgnoreCase(CommonConsts.TAG_VIEW)) {
			ArrayList<Event> eventList = eventsService.getEventList();
			ArrayList<Place> placeList = eventsService.getPlaceList();
			ArrayList<Decorator> decoratorList = eventsService.getDecoratorList();
			ArrayList<Catering> cateringList = eventsService.getCateringList();
			
			request.setAttribute("eventList", eventList);
			request.setAttribute("placeList", placeList);
			request.setAttribute("decoratorList", decoratorList);
			request.setAttribute("cateringList", cateringList);
			request.setAttribute("reload", "false");
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_EDIT)) {
			String neweventName  = request.getParameter("newEventname");
			String newtime = request.getParameter("newTime");
			String newcatering = request.getParameter("newCatering");
			String newdecorator = request.getParameter("newDecorator");
			String newplace = request.getParameter("newPlace");
			String eventId = request.getParameter("eventId");
			
			boolean status = eventsService.editEvent(neweventName, newtime, newcatering, newdecorator, newplace, Integer.parseInt(eventId));
			if (status == true) {
				ArrayList<Event> eventList = eventsService.getEventList();
				request.setAttribute("eventList", eventList);
			}
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_CREATE)) {
			String eventName  = request.getParameter("eventname");
			String time = request.getParameter("time");
			String catering = request.getParameter("catering");
			String decorator = request.getParameter("decorator");
			String place = request.getParameter("place");
			
			boolean status = eventsService.createEvent(eventName, time, catering, decorator, place);
			if (status == true) {
				ArrayList<Event> eventList = eventsService.getEventList();
				request.setAttribute("eventList", eventList);
			}
		} else if (tag.equalsIgnoreCase(CommonConsts.TAG_DELETE)) {
			String eventId = request.getParameter("eventId");
			
			boolean status = eventsService.removeEvent(Integer.parseInt(eventId));
			if (status == true) {
				ArrayList<Event> eventList = eventsService.getEventList();
				request.setAttribute("eventList", eventList);
			}
		}
		
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/userHome.jsp");
	    dispatcher.forward(request, response);
	}

}
