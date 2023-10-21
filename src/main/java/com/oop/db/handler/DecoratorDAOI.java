package com.oop.db.handler;

import java.util.ArrayList;

import com.oop.models.Decorator;
import com.oop.models.Place;

public interface DecoratorDAOI {

	public int addDecorator(Decorator decorator);
	public ArrayList<Decorator> getDecoratorList();
	public int updateDecorator(Decorator decorator);
	public int deleteDecorator(int decoratorId);
}
