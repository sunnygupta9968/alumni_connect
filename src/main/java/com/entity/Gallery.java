package com.entity;

public class Gallery {
 private int id;
 private int alumniId;
 private String imgLink;
 private String title;
  private String uploadDate;
  private String imageDesc;
public Gallery(int alumniId, String imgLink, String title,String imageDesc) {
	super();
	this.alumniId = alumniId;
	this.imgLink = imgLink;
	this.title = title;
	this.imageDesc = imageDesc;
}
public Gallery() {
	// TODO Auto-generated constructor stub
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
public String getImgLink() {
	return imgLink;
}
public void setImgLink(String imgLink) {
	this.imgLink = imgLink;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getUploadDate() {
	return uploadDate;
}
public void setUploadDate(String uploadDate) {
	this.uploadDate = uploadDate;
}
public String getImageDesc() {
	return imageDesc;
}
public void setImageDesc(String imageDesc) {
	this.imageDesc = imageDesc;
}


}
