
 <%@ page import="com.dao.Userdao" %>
 <%@page import="com.entity.User" %>
 <%@page import="com.db.DBConnection" %>
  <%@ page import="com.dao.Eventsdao" %>

<style>
/* @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);
 */
/* Bootstrap Icons */
@import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");
.profile-img img{
	width:25px;
}

.status{
	color:green;
}

.dash-card{
	color:var(--text-color);
}
/* .action{
		& a:hover{
		color:var(--primary-color);
	}
	
	
	
	& button:hover{
		color:red;
	}
} */
.admin-dashboard .card{
	background-color:var(--sidebar-color);
	color:var(--text-color);
	

}
 .dash-admin .card-header, .card-footer{
	background-color:var(--primary-color);
	color:var(--sidebar-color);
	

}

.dark .card-footer{
	color:var(--text-color);
}

.dark .dash-admin .card-header{
	color:var(--text-color);
}
.dash-admin .table-responsive{
		background-color:var(--sidebar-color);
	color:var(--text-color);
}
.dash-admin .table{
		--bs-table-bg: var(--sidebar-color);
	--bs-table-color: var(--text-color);
}
.dash-icon{
 border-radius:50%;
 color:#fff;
 

}
.dash-name{
	color:var(--text-color);
}

</style>
<div>



<%
	
   Userdao user_dao =new Userdao(DBConnection.getConn());
  Eventsdao event_dao =new Eventsdao(DBConnection.getConn());
   

%>
  	





 <div class="row g-6 mb-6 mx-4 my-5 admin-dashboard">
                    <div class="col-xl-3 col-sm-6 col-12 my-3">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col my-2">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2 fs-5">Total Alumni's</span>
                                        <span class="h3 font-bold mb-0 fs-2"> <i class='dash-icon  bg-success border bx bx-group mx-2 fs-2 px-3 py-3 mx-3' ></i><%=user_dao.getUserCount() %></span>
                                    </div>
                                   
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12 my-3">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col my-2">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2 fs-5">Events</span>
                                        <span class="h3 font-bold mb-0"><i class='dash-icon bg-danger  border bx bx-calendar-event mx-2 fs-2 px-3 py-3 mx-3' ></i><%=event_dao.getEventCount() %></span>
                                    </div>
                                   
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12 my-3">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                     <div class="col my-2">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2 fs-5">Gallery</span>
                                        <span class="h3 font-bold mb-0"><i class='dash-icon  bg-secondary border bx bx-images mx-2 fs-2 px-3 py-3 mx-3' ></i>2</span>
                                    </div>
                                   
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12 my-3">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col my-2">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2 fs-5">Jobs & Internships</span>
                                        <span class="h3 font-bold mb-0"><i class='dash-icon bg-primary  border bx bx-group mx-2 fs-2 px-3 py-3 mx-3' ></i>2</span>
                                    </div>
                                    
                            </div>
                        </div>
                    </div>
                </div>
  </div>
<div>
  <div class="card dash-admin shadow  mx-3 my-5 border-0 mb-7">
                    <div class="card-header ">
                        <h5 class="mb-0 fs-2">Alumni List</h5>
                    </div>
                    <div class="table-responsive px-4">
                        <table class="table table-hover table-nowrap ">
                            <thead class="thead-light fs-4">
                                <tr>
                                    <th scope="col">Name</th>
                                    <!-- <th scope="col">Date</th> -->
                                    <th scope="col">Branch</th>
                                    <th scope="col">Batch</th>
                                    <th scope="col">Status</th>
                                     <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty alumniList}">
        <c:forEach var="alumni" items="${alumniList}">
                                <tr>
                                    <td class="profile-img">
                                        <img  alt="..." src="../alumni/${alumni.profile_img }" class="avatar avatar-sm rounded-circle me-2">
                                        <a class=" text-decoration-none dash-name text-heading font-semibold fs-5" href="#">
                                            ${alumni.fullname }
                                        </a>
                                    </td>
                                    
                                    <td>
                                        <!-- <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-1.png" class="avatar avatar-xs rounded-circle me-2"> -->
                                        <p class=" text-heading font-semibold fs-5">
                                            ${alumni.branch }
                                        </p>
                                    </td>
                                    <td class="fs-5">
                                       ${alumni.batch }
                                    </td>
                                    <td>
                                        <span class="badge badge-lg badge-dot status">
                                              
                                        <c:if test="${not empty alumni.status}">
                                        
                               <div class="alert alert-success my-1 py-1 fs-6" role="alert">
   <i class='bx bxs-badge-check'></i> Verified
</div>         
                                        
   
</c:if>
 <c:if test="${empty alumni.status}">
 <form action="../verify-alumni" method="post">
 <input required name="id" type="hidden" class="form-control" value="${alumni.id }">
   <div class="alert alert-danger my-1 py-1 fs-6" role="alert">
   <i class='bx bx-x-circle'></i> Not Verified
</div>         
 </form>
   	
									
</c:if>
                 
                 
                 
                 
                                        </span>
                                    </td>
                                    
                                      <td >
                                        <span class="badge badge-lg badge-dot action d-flex gap-3">
                          <form action="../view-profile" method="post">
								 <input required name="id" type="hidden" class="form-control" value="${alumni.id }">
								 <button type="submit" class="btn btn-outline-success btn-rounded" data-mdb-ripple-init  data-mdb-ripple-color="dark">View</button>

						 </form>
						   <form action="../delete-alumni" method="post"  onsubmit="return confirm('Are you sure you want to delete this alumni?');">
								 <input required name="id" type="hidden" class="form-control" value="${alumni.id }">
							<button type="submit" class="btn btn-outline-danger btn-rounded" data-mdb-ripple-init  data-mdb-ripple-color="dark">Delete</button>

						 </form>
						 
								
								
									
                                        </span>
                                    </td>
                                  <!--   <td class="text-end">
                                        <a href="#" class="btn  btn-sm btn-neutral fs-5">View</a>
                                        <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                            <i class="bi bi-trash fs-5"></i>
                                        </button>
                                    </td> -->
                                </tr>
                       </c:forEach>
    </c:if>
                   
                                
                                
                                
                                
                                
                             
                             
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer border-0 py-4">
                        <span class="">Showing 10 items out of 250 results found</span>
                    </div>
                </div>
                
      </div>
      
     <div>
  <div class="card dash-admin shadow  mx-3 my-5 border-0 mb-7">
                    <div class="card-header ">
                        <h5 class="mb-0 fs-2">Events List</h5>
                    </div>
                    <div class="table-responsive px-4">
                        <table class="table table-hover table-nowrap ">
                            <thead class="thead-light fs-4">
                                <tr>
                                    <th scope="col">Event Name</th>
                                    <!-- <th scope="col">Date</th> -->
                                    <th scope="col">Event Date</th>
                                    <th scope="col">Decsription</th>
                                    <th scope="col">Organized By</th>
                                     <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty eventsList}">
        <c:forEach var="event" items="${eventsList}">
                                <tr>
                                    <td class="profile-img">
                                        <img  alt="..." src="${event.eventImg }" class="avatar avatar-sm rounded-circle me-2">
                                        <a class=" text-decoration-none dash-name text-heading font-semibold fs-5" href="#">
                                            ${event.eventName }
                                        </a>
                                    </td>
                                    
                                    <td>
                                        <!-- <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-1.png" class="avatar avatar-xs rounded-circle me-2"> -->
                                        <p class=" text-heading font-semibold fs-5">
                                            ${event.eventDate }
                                        </p>
                                    </td>
                                    <td class="fs-5">
                                       ${event.eventDesc }
                                    </td>
                                    <td>
                                        <span class="badge badge-lg badge-dot status">
                                              
                                       

  <button type="submit" class="btn btn-success fs-5" >${event.eventOrganizer }</button>

   	

                 
                 
                 
                 
                                        </span>
                                    </td>
                                    
                                      <td >
                                        <span class="badge badge-lg badge-dot action d-flex gap-3">
              
						   <form action="../delete-event" method="post"  onsubmit="return confirm('Are you sure you want to delete this event?');">
								 <input required name="id" type="hidden" class="form-control" value="${event.id }">
							<button type="submit" class="btn btn-outline-danger btn-rounded" data-mdb-ripple-init  data-mdb-ripple-color="dark">Delete</button>

						 </form>
								
								
									
                                        </span>
                                    </td>
                                  <!--   <td class="text-end">
                                        <a href="#" class="btn  btn-sm btn-neutral fs-5">View</a>
                                        <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                            <i class="bi bi-trash fs-5"></i>
                                        </button>
                                    </td> -->
                                </tr>
                       </c:forEach>
    </c:if>
                   
                                
                                
                                
                                
                                
                             
                             
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer border-0 py-4">
                        <span class="">Showing 10 items out of 250 results found</span>
                    </div>
                </div>
                
      </div>
      