<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.Userdao" %>
<%@page import="com.db.DBConnection" %>
 <%@page import="com.entity.Job" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="java.util.List" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
<title>Add Jobs</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
 <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
 <link rel="stylesheet" href="../components/sAttyle.css">
</head>
<body>

<style>
	.addExp-form{
		background-color:var(--sidebar-color);
		border-radius:8px;
		color:var(--text-color);
	}
.jobtype-drop select{
	border-radius:4px;
	color:var(--text-color);
	background-color:var(--body-color);
	
}
.addExp-form input{
color:var(--text-color);
background-color:var(--body-color);
 &::placeholder{
 	color:var(--text-color);
 }
}

</style>


<%@include file="alumniComponents/sidenavbar.jsp" %>

<div class="home">
<%@include file="alumniComponents/topnav.jsp" %>



<!-- LOGIN CARD -->
  <c:if test="${not empty sucMsg}">
<div class="alert alert-success fs-5" role="alert">
"${sucMsg}"
</div>

			<c:remove var="sucMsg" scope="session"/>	
         </c:if> 
         <c:if test="${not empty errorMsg}">
<div class="alert alert-danger fs-5" role="alert">
"${errorMsg}"
</div>

			<c:remove var="errorMsg" scope="session"/>	
         </c:if> 

<div>
<form action="../add-job" method="post">

	<div class="px-5 py-5">
	
		<div class="addExp-form  col-xxl-8 mb-5 mb-xxl-0">
						<div class="bg-secondary-soft px-4 py-3 rounded">
							 <div class="container mt-3">
        <h4 class="mb-4 mt-0 fs-4">Post a Job</h4>

        <div id="experienceContainer">
            <!-- Initial Experience Form -->
            <div class="experience-section border  p-4">
                <div class="row g-3">
                   
					   <!-- Job Role -->
                    <div class="col-md-6 my-3">
                        <label class="form-label fs-5">Job Role</label>
                        <input type="text" class="form-control fs-5" placeholder="Software Engineer" aria-label="Job Role" name="jobRole" value="" required>
                    </div> 
                    
                    <!-- Company Name -->
                    <div class="col-md-6 my-3">
                        <label class="form-label fs-5">Company Name</label>
                        <input type="text" class="form-control fs-5" placeholder="Google" aria-label="Company Name" name="companyName" value="" required>
                    </div>

                 

                    <!-- Work Duration -->
                    <div class="col-md-6 d-flex gap-5 ">
                        <div class="w-50 jobtype-drop d-flex flex-column my-3 ">
                            <label class=" form-label fs-5">Job Type</label>
                           <select class="py-2 border fs-5" name="jobType" id="jobTypes">
                <option value="Internship">Internshipp</option>
                <option value="Full Time">Full Time</option>
              
               
                
              </select>
                             </div>
                        <div class="w-50 last-date my-3">
                            <label class="form-label fs-5">Last Date</label>
                            <input type="date" class="form-control fs-5"  aria-label="Last Date"  name="lastDate" value="">
                        </div>
                    </div>

                    <!-- Short Description -->
                     <!-- Work Duration -->
                    <div class="col-md-6 d-flex gap-5">
                        <div class="w-50 jobtype-drop d-flex flex-column my-3">
                            <label class=" form-label fs-5">Location</label>
                         <input type="text" class="form-control fs-5" placeholder="Noida" aria-label="location" name="jobLocation" value="" required>
                  
              
               
               
                             </div>
                        <div class="w-50 last-date my-3">
                            <label class="form-label fs-5">Experience Required(in Years)</label>
                            <input type="text" class="form-control fs-5"  aria-label="Experience"  name="experience" value="">
                        </div>
                    </div>
                    
                    <div class="col-md-6 w-25 my-3">
                        <label class="form-label fs-5">Eligible Batch</label>
                        <input type="text" class="form-control fs-5" placeholder="2025/2026" aria-label="Eligible Batches" name="eligibleBatch" value="" required>
                    </div> 
                    
                    <!-- Job Link -->
                    <div class="col-md-6 w-50 my-3">
                        <label class="form-label fs-5">Job Apply Link</label>
                        <input type="text" class="form-control fs-5 " placeholder="naukri.com" aria-label="Job Link" name="jobLink" value="" required>
                    </div>
                    
					<div class="col-md-6 d-flex  my-3 w-25 ">
                        <div class=" jobtype-drop d-flex flex-column ">
                            <label for="referralAvailable" class=" form-label fs-5">Is Referral Available?</label>
                           <select class="py-2 border fs-5" id="referralAvailable" name="referralAvailable" onchange="toggleReferralFields()" required>
                <option value="no">No</option>
                <option value="yes">Yes</option>
              
               
                
              </select>
                             </div>
                          
                            </div> 
                 
            




                 
                 
                 
                  <div class="col-md-6 w-100 my-3 d-flex gap-4" id="referralSection" style="display:none !important;">
                  <div class="w-25">
                   		<label for="referralMobile" class="form-label fs-5">Referral Contact (Mobile):</label>
                        <input type="text" class="form-control fs-5 " placeholder="971245XXXX" aria-label="referral Mob" id="referralMobile" name="referralMobile" minlength="10" maxlength="10" value="">
                   
                  
                  </div>
                       <div class="w-75">
                   		<label for="referralGuideline" class="form-label fs-5">Referral Guideline:</label>
                        <input type="text" class="form-control fs-5 " placeholder="e.g. Feel free to contact me between 5 PM - 8 PM for any queries. " aria-label="Job Link" id="referralGuideline" name="referralGuideline" value="" >
                   
                  
                  </div>
                   
                    </div>
                    <c:if test="${not empty alumniObj}">
                 
                    <div class="mb-0">
							<input required name="id" type="hidden" class="form-control" value="${alumniObj.id }">
							</div>
				</c:if>
                </div>
                
            </div>
        </div>

       
    </div>
    				
</div>
						
					</div>
					
					
					
<div class="gap-3 d-md-flex justify-content-md-end text-center">
						<button type="submit" class="btn btn-primary btn-lg">Save</button>
				</div>
</div>
 </form>
 </div>
 
 <form action="../edit-workexp" method="post">
    <div class="px-5 py-5">
        <div class="addExp-form col-xxl-8 mb-5 mb-xxl-0">
            <div class="bg-secondary-soft px-4 py-3 rounded">
                <div class="container mt-3">
                    <h4 class="mb-4 mt-0 fs-4">Edit Job</h4>

                    <div id="experienceContainer pb-5">
                        <c:set var="userid" value="${alumniObj.id }" />
                        <% 
                        Integer userId = (Integer) pageContext.getAttribute("userid");
                        Userdao udao = new Userdao(DBConnection.getConn());
                        List<Job> list = udao.getJobsByAlumniId(userId);

                        for (Job j : list) {
                        %>           
                        <div class="experience-section border p-4 my-4">
                            <div class="row g-3 py-2">
                            	
                            		     <!-- Job Role -->
                    <div class="col-md-6 my-3">
                        <label class="form-label fs-5">Job Role</label>
                        <input type="text" class="form-control fs-5" placeholder="Software Engineer" aria-label="Job Role" name="jobRole" value="<%=j.getJobTitle() %>" required>
                    </div> 
                    
                    <!-- Company Name -->
                    <div class="col-md-6 my-3">
                        <label class="form-label fs-5">Company Name</label>
                        <input type="text" class="form-control fs-5" placeholder="Google" aria-label="Company Name" name="companyName" value="<%=j.getCompanyName() %>" required>
                    </div>

                 

                    <!-- Work Duration -->
                    <div class="col-md-6 d-flex gap-5 ">
                       
                            <div class="col-md-6 my-3">
                        <label class="form-label fs-5">Job Type</label>
                        <input type="text" class="form-control fs-5"  aria-label="Company Name" name="companyName" value="<%=j.getJobType() %>" required>
                  		  </div>
                             
                        <div class="w-50 last-date my-3">
                        <label class="form-label fs-5">Last Date</label>
                        <input type="text" class="form-control fs-5"  aria-label="Company Name" name="companyName" value="<%=j.getLastDate() %>" required>
                  		 
                            </div>
                    </div>

                    <!-- Short Description -->
                     <!-- Work Duration -->
                    <div class="col-md-6 d-flex gap-5">
                        <div class="w-50 jobtype-drop d-flex flex-column my-3">
                            <label class=" form-label fs-5">Location</label>
                         <input type="text" class="form-control fs-5" placeholder="Noida" aria-label="location" name="jobLocation" value="<%=j.getLocation() %>" required>
                  
              
               
               
                             </div>
                        <div class="w-50 last-date my-3">
                             <label class=" form-label fs-5">Experience(in years)</label>
                         <input type="text" class="form-control fs-5" placeholder="Noida" aria-label="location" name="jobLocation" value="<%=j.getExperienceRequired() %>" required>
                  
                             </div>
                    </div>
                    
                    <div class="col-md-6 w-25 my-3">
                        <label class="form-label fs-5">Eligible Batch</label>
                        <input type="text" class="form-control fs-5" placeholder="2025/2026" aria-label="Eligible Batches" name="eligibleBatch" value="<%=j.getEligibleBatch() %>" required>
                    </div> 
                    
                    <!-- Company Name -->
                    <div class="col-md-6 w-75 my-3">
                        <label class="form-label fs-5">Job Apply Link</label>
                        <input type="text" class="form-control fs-5 " placeholder="naukri.com" aria-label="Job Link" name="jobLink" value="<%=j.getApplyLink() %>" required>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                            		  
                            <!-- Remove Experience Form (Separate) -->
                           	  <form action="../remove-job" method="post" onsubmit="return confirm('Are you sure you want to delete this Job?');">
                                <input type="hidden" name="alumniId" value="<%=j.getAlumniId() %>">
                                <input type="hidden" name="jobId" value="<%=j.getJobId() %>">
                                <button type="submit" class="btn btn-danger w-25 btn-lg mt-2">Remove</button>
                            </form> 

                        </div>
                        </div>
                        <% } %>
                    </div>
                </div>             
            </div>
        </div>

        <!-- Save Button (Ensures Only Main Form Submits) -->
        <div class="gap-3 d-md-flex justify-content-md-end text-center">
            <button type="submit" class="btn btn-primary btn-lg">Save</button>
        </div>
    </div>
</form>

  <%@include file="alumniComponents/footer.jsp" %>
 </div>

  
<script>
        function toggleReferralFields() {
            var referralSection = document.getElementById("referralSection");
            var referralOption = document.getElementById("referralAvailable").value;

            if (referralOption === "yes") {
                referralSection.style.display = "block";
            } else {
                referralSection.style.setProperty("display", "none", "important");;
            }
        }
    </script>

<script src="../components/ssScripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>