<%@page import="com.dao.Userdao" %>
<%@page import="com.db.DBConnection" %>
 <%@page import="com.entity.WorkExperience" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="java.util.List" %>
<style>

.timeline-page:after {
    position: absolute;
    content: "";
    left: 0;
    right: -1px;
    top: 0px;
    width: 1px;
    height: 100%;
    margin: auto;
    border-right: 2px dashed #dee2e6 !important;
}
.timeline-page .timeline-item .date-label-left:after,
.timeline-page .timeline-item .date-label-left:before,
.timeline-page .timeline-item .duration-right:after,
.timeline-page .timeline-item .duration-right:before {
    position: absolute;
    content: "";
    border-radius: 50%;
    z-index: 1;
}
.timeline-page .timeline-item .date-label-left:after,
.timeline-page .timeline-item .duration-right:after {
    top: 9px;
    width: 10px;
    height: 10px;
    background-color: #2a52c3;
}
.timeline-page .timeline-item .date-label-left:before,
.timeline-page .timeline-item .duration-right:before {
    border: 2px dashed #dee2e6;
    top: 0;
    width: 28px;
    height: 28px;
    background-color: #fff;
}
.timeline-page .timeline-item .date-label-left {
    float: right;
    margin-right: 24px;
}
.timeline-page .timeline-item .date-label-left:after {
    right: -41px;
}
.timeline-page .timeline-item .date-label-left:before {
    right: -50px;
}
.timeline-page .timeline-item .duration-right {
    float: left;
    margin-left: 24px;
}
.timeline-page .timeline-item .duration-right:after {
    left: -41px;
}
.timeline-page .timeline-item .duration-right:before {
    left: -50px;
}
.timeline-page .timeline-item .event {
    transition: all 0.2s ease;
}
.timeline-page .timeline-item .event .title {
    font-weight: 500;
    transition: all 0.2s ease;
}
.timeline-page .timeline-item .event.event-description-right {
    text-align: left;
    margin-left: 24px;
}
.timeline-page .timeline-item .event.event-description-left {
    text-align: right;
    margin-right: 24px;
}
@media (max-width: 575px) {
    .timeline-page {
        margin-left: 18px;
    }
    .timeline-page:after {
        margin: 0;
    }
    .timeline-page .timeline-item .duration {
        float: left !important;
        margin-left: 30px !important;
        margin-right: auto !important;
        text-align: left !important;
    }
    .timeline-page .timeline-item .duration:after {
        left: -34px !important;
    }
    .timeline-page .timeline-item .duration:before {
        left: -42px !important;
    }
    .timeline-page .timeline-item .duration .event {
        text-align: left !important;
        margin-left: 15px;
    }
    .timeline-page .timeline-item .event.event-description-left,
    .timeline-page .timeline-item .event.event-description-right {
        text-align: left !important;
        margin: 0 0 0 30px !important;
    }
}

.timeline-page .timeline-item .date-label-left:after {
    background-color: #f89d36 !important;
}

.avatar.avatar-ex-small {
    height: 36px;
    width: 36px;
}
.rounded-pill {
    border-radius: 50rem!important;
}

.workExp-container{
	background-color:var(--sidebar-color);
	color:var(--text-color);

}

</style>



<div>
<section >
  <div class="container profileCard py-5">
  <!--   <div class="row">
      <div class="col">
        <nav aria-label="breadcrumb" class="bg-body-tertiary rounded-3 p-3 mb-4">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">User</a></li>
            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
          </ol>
        </nav>
      </div>
    </div>
--> 

<!--AVATAR  https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp -->
<c:if test="${not empty alumniObj}" >
    <div class="row fs-5">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="../alumni/${alumniObj.profile_img }" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3 fs-4">${alumniObj.fullname}
            	<c:if test="${not empty alumniObj.status}">
    <i class='bx bxs-badge-check'></i>
</c:if>
                                  
            
            </h5>
            <p class="text-muted mb-1">${alumniObj.work }, ${alumniObj.company}</p>
            <p class="text-muted mb-4"></p>
            <div class="d-flex justify-content-center gap-3">
											 <button type="button" class="btn google-btn  mx-0 my-1 px-3 py-1 "><a href="${alumniObj.linkdnLink}" class="text-decoration-none" style="color:inherit;"><i class='bx bxl-linkedin-square px-1'></i>Linkdn</a></button>
      										  <button type="button" class="btn google-btn  mx-0 my-1 px-3 py-1 "><a href="${alumniObj.githubLink }" class="text-decoration-none" style="color:inherit;"><i class='bx bxl-github px-1' ></i>Github</a></button>
      
										
										</div>
          </div>
        </div>
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${alumniObj.fullname}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${alumniObj.email}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Batch</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${alumniObj.batch}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Branch</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${alumniObj.branch}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Work</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${alumniObj.work }, ${ alumniObj.company}</p>
              </div>
            </div>
            <hr>
            
          </div>
        </div>
        
        <div class="card card-links fs-5 mb-4 mb-lg-0">
          <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class='bx bxl-linkedin-square bx-tada bx-rotate-90 fs-3' ></i>
                <p class="mb-0">${alumniObj.linkdnLink}</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class='bx bxl-github bx-tada bx-rotate-90 fs-3' ></i>
                <p class="mb-0">${alumniObj.githubLink}</p>
              </li>
              
             
            </ul>
          </div>
        </div>
        
      </div>
      <div class="col-lg-8 ">
       
        <div class="card mb-4 border">
         <div class="container workExp-container py-5 border">
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <div class="section-title mb-4 pb-2">
                <div class="position-relative">
                    <h4 class="title mb-4">Work Experience</h4>
                </div>
                <p class="text-muted mx-auto para-desc mb-0">Obviously I'm a Web Designer. Experienced with all stages of the development cycle for dynamic web projects.</p>
            </div>
        </div><!--end col-->
    </div><!-- Row End -->
      <c:set var="userid" value="${alumniObj.id }" />

  <%
                        Integer userId = (Integer) pageContext.getAttribute("userid");
                        Userdao udao = new Userdao(DBConnection.getConn());
                        List<WorkExperience> list = udao.getExperience(userId);
						int i=0;
					/* 	if(list.size()>0){ */
                        
                        %>   
     <div class="row">
        <div class="col-12 mt-4 pt-2">
         
            <div class="timeline-page position-relative" >
             <% for (i=0;i<list.size()-1;i=i+2) {  %>
            
                <div class="timeline-item">
              
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="duration date-label-left position-relative text-md-end">
                                <i class="fab fa-xbox fa-3x"></i>
                                <h5 class="my-2"><%=list.get(i).getCompany() %></h5>
                                <small class="text-muted mb-0"><%=list.get(i).getStart()%>-<%=list.get(i).getEnd() %></small>
                            </div>
                        </div><!--end col-->
                        <div class="col-lg-6 col-md-6 col-sm-6 mt-4 mt-sm-0">
                            <div class="event event-description-right float-left text-start">
                                <h6 class="title mb-1 text-capitalize"><%=list.get(i).getRole() %></h6>
                                <p class="timeline-subtitle mt-3 mb-0 text-muted"><%=list.get(i).getWorkDesc() %></p>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end timeline item-->

                <div class="timeline-item mt-5 pt-4">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 order-sm-1 order-2 mt-4 mt-sm-0">
                            <div class="event event-description-left float-left text-end">
                                <h6 class="title mb-1 text-capitalize"><%=list.get(i+1).getRole() %></h6>
                                <p class="timeline-subtitle mt-3 mb-0 text-muted"><%=list.get(i+1).getWorkDesc() %></p>
                            </div>
                        </div><!--end col-->
                        <div class="col-lg-6 col-md-6 col-sm-6 order-sm-2 order-1">
                            <div class="duration duration-right position-relative">
                                <i class="fab fa-google fa-3x"></i>
                                <h5 class="my-2"><%=list.get(i+1).getCompany() %></h5>
                                <small class="text-muted mb-0"><%=list.get(i).getStart()%>-<%=list.get(i).getEnd() %></small>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end timeline item-->
 <% }
    if(list.size()%2!=0) {        
                       int n=list.size();  
                         
                         %>
                <div class="timeline-item mt-3 pt-4">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 mt-4 mt-sm-0">
                            <div class="duration date-label-left position-relative text-md-end">
                                <i class="fab fa-apple fa-3x"></i>
                                <h5 class="my-2"><%=list.get(n-1).getCompany() %></h5>
                                <small class="text-muted mb-0"><%=list.get(i).getStart()%>-<%=list.get(i).getEnd() %></small>
                            </div>
                        </div><!--end col-->
                        <div class="col-lg-6 col-md-6 col-sm-6 mt-4 mt-sm-0">
                            <div class="event event-description-right float-left text-start">
                                <h6 class="title mb-1 text-capitalize"><%=list.get(n-1).getRole() %></h6>
                                <p class="timeline-subtitle mt-3 mb-0 text-muted"><%=list.get(n-1).getWorkDesc() %></p>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end timeline item-->
<%} %>
    
    </div>
    </div>
     
     
       
      
      </div>
        
      
    </div>
    
  </div>
   <c:if test="${not empty alumniObj}">
   <div class="card card-links fs-5 mb-4 mb-lg-0">
          <div class="card-body p-3">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Verification Method : </p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${alumniObj.verificationMethod }</p>
              </div>
            </div>
            <hr>
             <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Verification Data : </p>
              </div>
              
              <div class="col-sm-9">
              <c:set var="verificationMethod" value="${alumniObj.verificationMethod }" />
              <%
             	 String verificationMethod =(String)pageContext.getAttribute("verificationMethod");      
              if(verificationMethod.equals("rollNumber")){ %>
                <p class="text-muted mb-0">${alumniObj.verificationValue }</p>
                <%} else{%>
                <a href="${alumniObj.verificationValue }" target="_blank">View Document</a>
                <%} %>
              </div>
            </div>
          </div>
        </div>
        
</c:if>
  <div class="d-flex justify-content-center gap-4">
          <c:if test="${not empty alumniObj.status}">
    <button type="button"  onClick="return confirm('Alumni is already verified');" class="btn google-btn px-5 py-2 "><i class='bx bx-badge-check mx-1'></i>Verified</button>
     
</c:if>
        
         <c:if test="${empty alumniObj.status}">
   
        <form action="../verify-alumni" method="post">
 <input required name="id" type="hidden" class="form-control" value="${alumniObj.id }">
 	 <button type="submit" class="btn google-btn px-5 py-2 " onsubmit="return confirm('Are you sure you want to verify this Alumni?');" ><i class='bx bx-badge-check mx-1'></i>Verify</button>
      
        
 </form>
          
</c:if>
        
          <form action="../delete-alumni" method="post">
 <input required name="id" type="hidden" class="form-control" value="${alumniObj.id }">
 	 <button type="submit" class="btn google-btn px-5 py-2 "   onsubmit="return confirm('Are you sure you want to delete this Alumni?');"><i class='bx bx-user-x mx-2 fs-4'></i>Delete</button>
      
        
 </form>
      </div>
  </c:if> 
</section>
</div>