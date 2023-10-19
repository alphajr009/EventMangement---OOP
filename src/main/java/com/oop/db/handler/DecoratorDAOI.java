package com.oop.db.handler;

import java.util.ArrayList;

import com.oop.models.Decorator;

public interface DecoratorDAOI {

	public int addDecorator(Decorator decorator);
	public ArrayList<Decorator> getDecoratorList();
}
