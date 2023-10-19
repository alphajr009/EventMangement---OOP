package com.oop.services;

import java.util.ArrayList;

import com.oop.db.handler.DecoratorDAOImpl;
import com.oop.models.Decorator;

public class DecorationService {
	
	DecoratorDAOImpl decoratorDAOImpl = new DecoratorDAOImpl();
	
	public boolean createDecorator(String name, String location, String type, float price, int rating) {
		boolean status = false;
		
		Decorator decorator = new Decorator();
		decorator.setName(name);
		decorator.setLocation(location);
		decorator.setType(type);
		decorator.setPrice(price);
		decorator.setRating(rating);
		
		int result = decoratorDAOImpl.addDecorator(decorator);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
	
	public ArrayList<Decorator> getAllDecorators(){
		ArrayList<Decorator> decoratorList = null;
		
		decoratorList = decoratorDAOImpl.getDecoratorList();
		
		return decoratorList;
	}
}
