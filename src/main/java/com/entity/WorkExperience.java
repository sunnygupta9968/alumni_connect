package com.entity;

public class WorkExperience {
	private int id;
	private int alumniId;
	private String company;
	private String role;
	private String start;
	private String end;
	private String workDesc;
	
	
	
	
	public WorkExperience() {
		super();
	}
	public WorkExperience(int alumniId, String company, String role, String start, String end, String workDesc) {
		super();
		this.alumniId = alumniId;
		this.company = company;
		this.role = role;
		this.start = start;
		this.end = end;
		this.workDesc = workDesc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAlumniId() {
		return alumniId;
	}
	public void setAlumniId(int alumniId) {
		this.alumniId = alumniId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getWorkDesc() {
		return workDesc;
	}
	public void setWorkDesc(String workDesc) {
		this.workDesc = workDesc;
	}

}
