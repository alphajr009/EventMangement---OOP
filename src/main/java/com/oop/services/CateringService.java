package com.oop.services;

import java.util.ArrayList;

import com.oop.db.handler.CateringDAOImpl;
import com.oop.models.Catering;

public class CateringService {
	
	CateringDAOImpl cateringDAOImpl = new CateringDAOImpl();

	public boolean createCatering(String name, String location, String type, float price, int rating) {
		boolean status = false;
		
		Catering catering = new Catering();
		catering.setName(name);
		catering.setLocation(location);
		catering.setType(type);
		catering.setPrice(price);
		catering.setRating(rating);
		
		int result = cateringDAOImpl.addCatering(catering);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
	
	public ArrayList<Catering> getCateringList(){
		ArrayList<Catering> cateringList = null;
		
		cateringList = cateringDAOImpl.getCateringList();
		
		return cateringList;
	}
	
	public boolean editCatering(String newName, String newLocation, float newPrice, int newRating, int cateringId) {
		boolean status = false;
		
		Catering catering = new Catering();
		catering.setId(cateringId);
		catering.setName(newName);
		catering.setLocation(newLocation);
		catering.setPrice(newPrice);
		catering.setRating(newRating);
		
		int result = cateringDAOImpl.updateCatering(catering);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
	
	public boolean removeCatering(int cateringId) {
		boolean status = false;
		
		int result = cateringDAOImpl.deleteCatering(cateringId);
		
		if (result > 0) {
			status = true;
		}
		
		return status;
	}
}
