package com.entity;

public class Events {
	private int id;
	private String eventName;
	private String eventDate;
	private String eventOrganizer;
	private String eventDesc;
	private String eventImg;
	private String eventVenue;
	private String eventLink;
	public Events(String eventName, String eventDate, String eventOrganizer, String eventDesc, String eventImg, String eventVenue, String eventLink ) {
		super();
		this.eventName = eventName;
		this.eventDate = eventDate;
		this.eventOrganizer = eventOrganizer;
		this.eventDesc = eventDesc;
		this.eventImg = eventImg;
		this.eventVenue = eventVenue;
		this.eventLink = eventLink;
	}
	public Events() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventOrganizer() {
		return eventOrganizer;
	}
	public void setEventOrganizer(String eventOrganizer) {
		this.eventOrganizer = eventOrganizer;
	}
	public String getEventDesc() {
		return eventDesc;
	}
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}
	public String getEventImg() {
		return eventImg;
	}
	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}
	public String getEventVenue() {
		return eventVenue;
	}
	public void setEventVenue(String eventVenue) {
		this.eventVenue = eventVenue;
	}
	public String getEventLink() {
		return eventLink;
	}
	public void setEventLink(String eventLink) {
		this.eventLink = eventLink;
	}
	
}
