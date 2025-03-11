<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.dao.Userdao" %>
 <%@ page import="com.db.DBConnection" %>
 <%@page import="com.entity.Job" %>
  <%@page import="com.entity.User" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="java.util.List" %>
 <%@page import="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>

 <!DOCTYPE html>

<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
 <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../components/sAttyle.css">

<body>

<%-- 
<c:if test="${not empty alumniObj}" >  --%>
<%@include file="alumniComponents/sidenavbar.jsp" %>

<div class="home">
<%@include file="alumniComponents/topnav.jsp" %>
   
<%-- </c:if> --%>
        <style>
        
        .card {
    margin-bottom: 24px;
    box-shadow: 0 2px 3px #e4e8f0;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: var(--sidebar-color);
    background-clip: border-box;
    border: 1px solid #eff0f2;
    border-radius: 1rem;
    color:var(--text-color);
}
.avatar-md {
    height: 3rem;
    width: 3rem;
}
.rounded-circle {
    border-radius: 50%!important;
}
.img-thumbnail {
    padding: 0.25rem;
    background-color: #f1f3f7;
    border: 1px solid #eff0f2;
    border-radius: 0.75rem;
}
.avatar-title {
    align-items: center;
    background-color: #3b76e1;
    color:var(--text-color) ;
    display: flex;
    font-weight: 500;
    height: 100%;
    justify-content: center;
    width: 100%;
    font-size: 12px;
}
.bg-soft-primary {
    background-color: var(--sidebar-color);
}
a {
    text-decoration: none!important;
}
.badge-soft-danger {
    color: #f56e6e !important;
    background-color: rgba(245,110,110,.1);
}
.badge-soft-success {
    color: #63ad6f !important;
    background-color: rgba(99,173,111,.1);
}
.mb-0 {
    margin-bottom: 0!important;
}
.badge {
    display: inline-block;
    padding: 0.25em 0.6em;
    font-size: 75%;
    font-weight: 500;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.75rem;
}
.sec-title{
	color:var(--text-color) ;
}
.user-name{
    font-size: 14px;
    color:var(--text-color) ;
}
        
        </style>
        <div class="container mx-3 ">
        
        <h1 class="gallery-title mb-5 mt-4 sec-title text-center">Jobs & Internship</h1>
   
        
        <div class="row my-3 ">
        
          <% 
                        Integer userId = (Integer) pageContext.getAttribute("userid");
                        Userdao udao = new Userdao(DBConnection.getConn());
                        List<Job> list = udao.getAllJobs();
						
                        for (Job j : list) {
                        %> 
        
        
            <div class="col-xl-3 col-sm-6">
                <div class="card border">
                    <div class="card-body px-4">
                        <div class="flex-1 ms-1">
                            <h5 class="mb-1"><a href="#" class="sec-title"><%=j.getJobTitle() %></a></h5>
                            <span class="badge badge-soft-success mb-0 fs-5"><%=j.getCompanyName() %></span>
                            
                        </div>
                      
                        <div class="mt-2 mb-3 py-2">
                        <div class="d-flex gap-5 py-2">
                            <p class="text-muted mb-0 fs-5"><i class='bx bx-briefcase mx-1'></i><%=j.getJobType() %></p>
                            <p class="text-muted mb-0 fs-5"><i class='bx bx-map mx-1' ></i><%=j.getLocation() %></p>
						   
                               </div>
                             
						    <p class="text-muted mb-0 fs-5 py-2"><i class='bx bx-calendar-event mx-1'></i>Last Date: <%=j.getLastDate() %></p>
						    <p class="text-muted mb-0 fs-5 py-2"><i class='bx bx-time mx-1'></i>Experience Required : <%=j.getExperienceRequired() %> Years</p>
						   	<p class="text-muted mb-0 fs-5 py-2"><i class='bx bxs-graduation mx-1'></i>Eligible Batch : <%=j.getEligibleBatch() %></p>
						   	<p class="text-muted mb-0 fs-5 py-2"><i class='bx bx-question-mark mx-1'></i>Is Referral Available : <%=j.getReferralAvailable() %></p>
						   	<%
						   	
						   	if(j.getReferralAvailable().equals("yes")) 
						   	{	%>
						   	<p class="text-muted mb-0 fs-5 py-2"><i class='bx bx-phone-call mx-1'></i>Mobile No. :
						   	 <c:if test="${not empty alumniObj.status}">
    <%=j.getReferralMobile() %>
</c:if>
						   	 	 <c:if test="${empty alumniObj.status}">
   +91XXXXXXXXX
</c:if>
						   	 
						   	 </p>
						   	<p class="text-muted mb-0 fs-5 py-2"><i class='bx bx-bookmark-alt mx-1'></i>Referral Guideline : <%=j.getReferralGuideline() %></p>
						   <%} %>
						   
                         
                        </div>
                        <%
                        User u=udao.getUserById(j.getAlumniId());
                        
                        
                        %>
                        <div class="d-flex align-items-center">
                            <div><img src="<%=u.getProfile_img() %>" alt="" class="avatar-md rounded-circle img-thumbnail mx-1" /></div>
                            <div class="flex-1 ms-1 mt-3">
                                <h5 class="mb-1"><a href="#" class="user-name"><%=u.getFullname() %></a></h5>
                                <span class="badge badge-soft-success mb-0 fs-6"><%=u.getWork() %> ( <%=u.getCompany() %> )</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end pt-4">
                           
                            <a href="<%=j.getApplyLink() %>" class="btn btn-primary btn-sm w-50 fs-6"> Apply Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
          
            
        </div>
        <c:if test="${not empty alumniObj.status}">
    <div class="d-flex justify-content-end">
        	<a href="addJob.jsp" class="btn my-3 py-2 search-btn btn-primary px-5 fs-5" type="submit">Post Job</a>
          
        
        </div>
</c:if>
	 
        
        
        
            
    </div>
        
        
        
        
  	 
	  <%@include file="alumniComponents/footer.jsp" %>
  </div>
  
 <script src="../components/ssScripts.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
