<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.Userdao" %>
<%@page import="com.db.DBConnection" %>
 <%@page import="com.entity.WorkExperience" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="java.util.List" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
<title>Add Events</title>
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


</style>

<%@include file="alumniComponents/sidenavbar.jsp" %>

<div class="home">
<%@include file="alumniComponents/topnav.jsp" %>



<!-- LOGIN CARD -->
<div>
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
<form action="../add-workexp" method="post">

	<div class="px-5 py-5">
	
		<div class="addExp-form  col-xxl-8 mb-5 mb-xxl-0">
						<div class="bg-secondary-soft px-4 py-3 rounded">
							 <div class="container mt-3">
        <h4 class="mb-4 mt-0 fs-4">Add Work Experience</h4>

        <div id="experienceContainer">
            <!-- Initial Experience Form -->
            <div class="experience-section border  p-4">
                <div class="row g-3">
                   

                    <!-- Company Name -->
                    <div class="col-md-6">
                        <label class="form-label fs-5">Company Name</label>
                        <input type="text" class="form-control fs-5" placeholder="Google" aria-label="Company Name" name="companyName[]" value="" required>
                    </div>

                    <!-- Job Role -->
                    <div class="col-md-6">
                        <label class="form-label fs-5">Job Role</label>
                        <input type="text" class="form-control fs-5" placeholder="Software Engineer" aria-label="Job Role" name="jobRole[]" value="" required>
                    </div> 

                    <!-- Work Duration -->
                    <div class="col-md-6 d-flex gap-5">
                        <div class="w-50">
                            <label class="form-label fs-5">From</label>
                            <input type="text" class="form-control fs-5" placeholder="YYYY" aria-label="Start Year" name="startYear[]" value="" required>
                        </div>
                        <div class="w-50">
                            <label class="form-label fs-5">To</label>
                            <input type="text" class="form-control fs-5" placeholder="YYYY" aria-label="End Year"  name="endYear[]" value="">
                        </div>
                    </div>

                    <!-- Short Description -->
                    <div class="col-md-6">
                        <label class="form-label fs-5">Short Description</label>
                        <input type="text" class="form-control fs-5" placeholder="Briefly describe your role" name="shortDesc[]" value="" required>
                    </div>
                    <div class="mb-0">
							<input required name="id" type="hidden" class="form-control" value="${alumniObj.id }">
							</div>
                </div>
            </div>
        </div>

       
    </div> <button type="button" class="btn btn-primary mt-3 fs-6" onclick="addExperienceSection()">Add More Experience</button>
						
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
                    <h4 class="mb-4 mt-0 fs-4">Edit Work Experience</h4>

                    <div id="experienceContainer pb-5">
                        <c:set var="userid" value="${alumniObj.id }" />
                        <% 
                        Integer userId = (Integer) pageContext.getAttribute("userid");
                        Userdao udao = new Userdao(DBConnection.getConn());
                        List<WorkExperience> list = udao.getExperience(userId);

                        for (WorkExperience w : list) {
                        %>           
                        <div class="experience-section border p-4 my-4">
                            <div class="row g-3 py-2">
                                <!-- Company Name -->
                                <div class="col-md-6">
                                    <label class="form-label fs-5">Company Name</label>
                                    <input type="text" class="form-control fs-5" placeholder="Google" name="companyName[]" value="<%= w.getCompany() %>">
                                </div>

                                <!-- Job Role -->
                                <div class="col-md-6">
                                    <label class="form-label fs-5">Job Role</label>
                                    <input type="text" class="form-control fs-5" placeholder="Software Engineer" name="jobRole[]" value="<%= w.getRole() %>">
                                </div> 

                                <!-- Work Duration -->
                                <div class="col-md-6 d-flex gap-5">
                                    <div class="w-50">
                                        <label class="form-label fs-5">From</label>
                                        <input type="text" class="form-control fs-5" placeholder="YYYY" name="startYear[]" value="<%= w.getStart() %>">
                                    </div>
                                    <div class="w-50">
                                        <label class="form-label fs-5">To</label>
                                        <input type="text" class="form-control fs-5" placeholder="YYYY" name="endYear[]" value="<%= w.getEnd() %>">
                                    </div>
                                </div>

                                <!-- Short Description -->
                                <div class="col-md-6">
                                    <label class="form-label fs-5">Short Description</label>
                                    <input type="text" class="form-control fs-5" placeholder="Briefly describe your role" name="shortDesc[]" value="<%= w.getWorkDesc() %>">
                                </div>

                                <!-- Hidden Fields -->
                                <input type="hidden" name="expId[]" value="<%= w.getId() %>">
                                <input type="hidden" name="alumniId" value="<%=userId%>">
                            </div>

                            <!-- Remove Experience Form (Separate) -->
                           	 <form action="../remove-workexp" method="post" onsubmit="return confirm('Are you sure you want to delete this experience?');">
                                <input type="hidden" name="alumniId" value="<%=userId%>">
                                <input type="hidden" name="workId" value="<%= w.getId() %>">
                                <button type="submit" class="btn btn-danger btn-lg mt-2">Remove</button>
                            </form>

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
        function addExperienceSection() {
            let container = document.getElementById("experienceContainer");

            let newSection = document.createElement("div");
            newSection.classList.add("experience-section", "border", "p-3", "mt-3");

            newSection.innerHTML = `
                <div class="row g-3">
                 
                    <!-- Company Name -->
                    <div class="col-md-6">
                        <label class="form-label fs-5">Company Name</label>
                        <input type="text" class="form-control fs-5" placeholder="Google" aria-label="Company Name" name="companyName[]" value="" required>
                    </div>

                    <!-- Job Role -->
                    <div class="col-md-6">
                        <label class="form-label fs-5">Job Role</label>
                        <input type="text" class="form-control fs-5" placeholder="Software Engineer" aria-label="Job Role" name="jobRole[]" value="" required>
                    </div> 

                    <!-- Work Duration -->
                    <div class="col-md-6 d-flex gap-5">
                        <div class="w-50">
                            <label class="form-label fs-5">From</label>
                            <input type="text" class="form-control fs-5" placeholder="YYYY" aria-label="Start Year" name="startYear[]" value="" required>
                        </div>
                        <div class="w-50">
                            <label class="form-label fs-5">To</label>
                            <input type="text" class="form-control fs-5" placeholder="YYYY" aria-label="End Year"  name="endYear[]" value="">
                        </div>
                    </div>

                    <!-- Short Description -->
                    <div class="col-md-6">
                        <label class="form-label fs-5">Short Description</label>
                        <input type="text" class="form-control fs-5" placeholder="Briefly describe your role" name="shortDesc[]" value="">
                    </div>

                    <!-- Remove Button -->
                    <div class="col-md-6">
                        <button type="button" class="btn btn-danger mt-3" onclick="removeExperienceSection(this)">Remove</button>
                    </div>
                </div>
            `;

            container.appendChild(newSection);
        }

        function removeExperienceSection(button) {
            button.closest(".experience-section").remove();
        }
    </script>


<script src="../components/ssScripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>