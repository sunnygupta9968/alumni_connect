package com.entity;

public class Job {
	  private int jobId;
	  private int alumniId;
	    private String jobTitle;
	    private String companyName;
	    private String jobType; 
	    private String location;
	    private String experienceRequired;
	    private String applyLink;
	    private String postedDate;
	    private String lastDate;
	    private String eligibleBatch;
	    private String referralAvailable;
	    private String referralMobile;
	    private String referralGuideline;
	
		public Job(int alumniId, String jobTitle, String companyName, String jobType, String location,
				String experienceRequired, String applyLink, String lastDate, String eligibleBatch,String referralAvailable, String referralMobile, String referralGuideline) {
			super();
			this.alumniId = alumniId;
			this.jobTitle = jobTitle;
			this.companyName = companyName;
			this.jobType = jobType;
			this.location = location;
			this.experienceRequired = experienceRequired;
			this.applyLink = applyLink;
			this.lastDate = lastDate;
			this.eligibleBatch = eligibleBatch;
			this.referralAvailable=referralAvailable;
			this.referralMobile=referralMobile;
			this.referralGuideline=referralGuideline;
		}
		public Job() {
			// TODO Auto-generated constructor stub
		}
		public int getJobId() {
			return jobId;
		}
		public void setJobId(int jobId) {
			this.jobId = jobId;
		}
		public int getAlumniId() {
			return alumniId;
		}
		public void setAlumniId(int alumniId) {
			this.alumniId = alumniId;
		}
		public String getJobTitle() {
			return jobTitle;
		}
		public void setJobTitle(String jobTitle) {
			this.jobTitle = jobTitle;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getJobType() {
			return jobType;
		}
		public void setJobType(String jobType) {
			this.jobType = jobType;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getExperienceRequired() {
			return experienceRequired;
		}
		public void setExperienceRequired(String experienceRequired) {
			this.experienceRequired = experienceRequired;
		}
		public String getApplyLink() {
			return applyLink;
		}
		public void setApplyLink(String applyLink) {
			this.applyLink = applyLink;
		}
		public String getPostedDate() {
			return postedDate;
		}
		public void setPostedDate(String postedDate) {
			this.postedDate = postedDate;
		}
		public String getLastDate() {
			return lastDate;
		}
		public void setLastDate(String lastDate) {
			this.lastDate = lastDate;
		}
		public String getEligibleBatch() {
			return eligibleBatch;
		}
		public void setEligibleBatch(String eligibleBatch) {
			this.eligibleBatch = eligibleBatch;
		}
		public String getReferralAvailable() {
			return referralAvailable;
		}
		public void setReferralAvailable(String referralAvailable) {
			this.referralAvailable = referralAvailable;
		}
		public String getReferralMobile() {
			return referralMobile;
		}
		public void setReferralMobile(String referralMobile) {
			this.referralMobile = referralMobile;
		}
		public String getReferralGuideline() {
			return referralGuideline;
		}
		public void setReferralGuideline(String referralGuideline) {
			this.referralGuideline = referralGuideline;
		} 

}
