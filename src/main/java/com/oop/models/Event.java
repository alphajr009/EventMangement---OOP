package com.oop.models;

public class Event {
	private int id;
	private String name;
	private String time;
	private String place;
	private String decorator;
	private String catering;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getDecorator() {
		return decorator;
	}
	public void setDecorator(String decorator) {
		this.decorator = decorator;
	}
	public String getCatering() {
		return catering;
	}
	public void setCatering(String catering) {
		this.catering = catering;
	}
}
