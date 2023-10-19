package com.oop.db.handler;

import java.util.ArrayList;

import com.oop.models.Catering;

public interface CateringDAOI {

	public int addCatering(Catering catering);
	public ArrayList<Catering> getCateringList();
}
