package com.entity;

	public class User {
		/*
		 * name,gender,batch,email,status,branch,work,company,profile_img)
		 * values(?,?,?,?,?)
		 */
		private int id;
		private String fullname;
		private String gender;
		private String batch;
		private String email;
		private String status;
		private String branch;
		private String work;
		private String company;
		private String linkdnLink;
		private String githubLink;
		private String profile_img;
		private String password;
		private String verificationMethod;
		private String verificationValue;
	
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getFullname() {
			return fullname;
		}
		public void setFullname(String fullname) {
			this.fullname = fullname;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getBatch() {
			return batch;
		}
		public void setBatch(String batch) {
			this.batch = batch;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getBranch() {
			return branch;
		}
		public void setBranch(String branch) {
			this.branch = branch;
		}
		public String getWork() {
			return work;
		}
		public void setWork(String work) {
			this.work = work;
		}
		public String getCompany() {
			return company;
		}
		public void setCompany(String company) {
			this.company = company;
		}
		public String getLinkdnLink() {
			return linkdnLink;
		}
		public void setLinkdnLink(String linkdnLink) {
			this.linkdnLink = linkdnLink;
		}
		public String getGithubLink() {
			return githubLink;
		}
		public void setGithubLink(String githubLink) {
			this.githubLink = githubLink;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		




		public User() {

		}
		
		public String getProfile_img() {
			return profile_img;
		}
		public void setProfile_img(String profile_img) {
			this.profile_img = profile_img;
		}
		public User(String fullname, String linkdnLink, String gender,String batch, String branch, String email, String status, 
				String work, String company,String profile_img, String githubLink,
				String password) {
			super();
			this.fullname = fullname;
			this.gender = gender;
			this.batch = batch;
			this.email = email;
			this.status = status;
			this.branch = branch;
			this.work = work;
			this.company = company;
			this.linkdnLink = linkdnLink;
			this.githubLink = githubLink;
			this.profile_img = profile_img;
			this.password = password;
		}
	
		public User(int id,String fullname, String linkdnLink, String gender,String batch, String branch, String email, String status, 
				String work, String company,String profile_img, String githubLink,
				String password) {
			super();
			this.id=id;
			this.fullname = fullname;
			this.gender = gender;
			this.batch = batch;
			this.email = email;
			this.status = status;
			this.branch = branch;
			this.work = work;
			this.company = company;
			this.linkdnLink = linkdnLink;
			this.githubLink = githubLink;
			this.profile_img = profile_img;
			this.password = password;
		}
		
		
		public User(String fullname, String gender, String batch, String email, String status, String branch,
				String work, String company, String linkdnLink, String githubLink, String profile_img, String password,
				String verificationMethod, String verificationValue) {
			super();
			this.fullname = fullname;
			this.gender = gender;
			this.batch = batch;
			this.email = email;
			this.status = status;
			this.branch = branch;
			this.work = work;
			this.company = company;
			this.linkdnLink = linkdnLink;
			this.githubLink = githubLink;
			this.profile_img = profile_img;
			this.password = password;
			this.verificationMethod = verificationMethod;
			this.verificationValue = verificationValue;
		}
		public String getVerificationMethod() {
			return verificationMethod;
		}
		public void setVerificationMethod(String verificationMethod) {
			this.verificationMethod = verificationMethod;
		}
		public String getVerificationValue() {
			return verificationValue;
		}
		public void setVerificationValue(String verificationValue) {
			this.verificationValue = verificationValue;
		}

	}

