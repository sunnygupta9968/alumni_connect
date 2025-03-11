<style>

/* Profile Picture */
.profile-pic{
   display: inline-block;
   vertical-align: middle;
    width: 30px;
    height: 30px;
    overflow: hidden;
   border-radius: 50%;
}
 
 .profile-menu li{
/*   border:1px solid red;
 */  border-radius:8px;
  background-color:var(--primary-color);
  & a{
  	color:var(--sidebar-color);
  }
 }
 
 .dark .profile-menu li{
/*   border:1px solid red;
 */  
  & a{
  	color:var(--text-color);
  }
 }
.profile-pic img{
   width: 100%;
   height: auto;
   object-fit: cover;
}
.profile-menu .dropdown-menu {
  right: 0;
  left: unset;
}
.profile-menu .fa-fw {
  margin-right: 1opx;
}
 
 
 
 
.toggle-change::after {
  border-top: 0;
  
  border-bottom: 0.3em solid;
}

.dropdown-toggle::after{
	 /* border:1px solid red; */
	 margin-top:10px;
}

.navbar, .nav-item{
	background-color:var(--sidebar-color);
	--bs-nav-link-color: var(--text-color);
}
/* .navbar-nav li a:hover{
	color:var(--primary-color);
} */
</style>


<nav class="navbar navbar-expand-lg k px-4">
  <div class="container-fluid">
    <a class="navbar-brand fs-2" href="#">BIET Jhansi</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-3">
        <li class="nav-item">
          <a class="nav-link fs-4" aria-current="page" href="events.jsp">Events</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fs-4" href="jobs.jsp">Jobs & Internship</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fs-4" href="alumni.jsp">Alumni</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fs-4" href="gallery.jsp">Gallery</a>
        </li>
      
       
      </ul>
      
      
     <c:if test="${not empty alumniObj}" > 
      
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 profile-menu"> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle d-flex " href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <div class="profile-pic my-0">
                <img src="${alumniObj.profile_img }" alt="Profile Picture">
               
             </div>
         <!-- You can also use icon as follows: -->
           <!--  <i class="fas fa-user"></i> -->
           
           
            <div class="mx-2 text-align-center ">
            	<p class="my-0 fs-5">${alumniObj.fullname }</p>
            	<c:if test="${not empty alumniObj.status}">
   <p class="my-0"><i class='bx bxs-badge-check'></i>Verified</p>
       
</c:if>
                                  
            	
            	     </div>
          </a>
          <ul class="dropdown-menu py-0" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item my-1 fs-6" href="profile.jsp"><i class="fas fa-sliders-h fa-fw"></i>Profile</a></li>
            <li><a class="dropdown-item my-1 fs-6" href="events.jsp"><i class="fas fa-cog fa-fw"></i>Events</a></li>
           
            <li>
            <form id="myForm" action="../logout" method="post">
            <a class="dropdown-item my-1 fs-6" href="#" onclick="document.getElementById('myForm').submit(); return false;"> Log Out</a>
            </form>
            
            </li>
          </ul>
        </li>
     </ul>
      </c:if> 
     
    </div>
  </div>
</nav>