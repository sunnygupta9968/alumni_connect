<nav class="sidebar close">
    <header>
      <div class="logo-text">
        <span class="image">
          <img src="../images/Bietlogo.png" alt="logo">
        </span>
        <div class="text header-text">
          <span class="name">BIET</span>
          <span class="slogan">Jhansi UP</span>
        </div>
    </div>
    <i class='bx bx-chevrons-right toggle'></i>
      </header>

      <div class="menu-bar">
        <div class="menu"> <li class="nav-searchbar">
         
            <i class='bx bx-search icon' ></i>
           <input type="search" placeholder="Search..">
        
        </li>

          <ul class="menu-list">
            <li class="nav-link">
              <a href="alumnihome.jsp">
                <i class='bx bx-home icon' ></i>
                <span class="text nav-text">Home</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="alumni.jsp">
               <i class='bx bx-group icon' ></i>
                <span class="text nav-text">Alumni</span>
              </a>
            </li>
            
             <c:if test="${not empty alumniObj.status}">
  		<li class="nav-link">
              <a href="addGalleryImages.jsp">
               <i class='bx bx-image-add icon' ></i>
                <span class="text nav-text">Upload Image</span>
              </a>
            </li>
</c:if>
<c:if test="${empty alumniObj.status}">
  		 <li class="nav-link">
              <a href="gallery.jsp">
                <i class='bx bx-images icon'></i>
                <span class="text nav-text">Gallery</span>
              </a>
            </li>
</c:if>
            
             
            
            
            
            <li class="nav-link">
              <a href="profile.jsp">
                <i class='bx bx-user-circle icon' ></i>
                <span class="text nav-text">Profile</span>
              </a>
            </li>
            
            
            <c:if test="${not empty alumniObj.status}">
  		 <li class="nav-link">
              <a href="addJob.jsp">
                <i class='bx bx-add-to-queue icon'></i>
                <span class="text nav-text">Add Job</span>
              </a>
            </li>
</c:if>
<c:if test="${empty alumniObj.status}">
  		 <li class="nav-link">
              <a href="events.jsp">
                <i class='bx bx-calendar icon' ></i>
                <span class="text nav-text">Events</span>
              </a>
            </li>
</c:if>
            
            
            
           
          </ul>
        </div>
        <div class="bottom-content">
<form id="myForm" action="../logout" method="post">
          <li class="nav-link logout" >
            <a href="#" onclick="document.getElementById('myForm').submit(); return false;">
            
              <i class='bx bx-log-out icon' ></i>
              <span class="text nav-text">Logout</span>
        
            </a>
          </li>
           </form>
          <li class="mode">
            <div class="moon-sun">
              <i class='bx bx-moon icon moon' ></i>
              <i class='bx bx-sun icon sun' ></i>
            </div>
            <span class="mode-text text">Dark Mode</span>
            <div class="toggle-switch">
              <span class="switch"></span>
            </div>
          </li>
        </div>
      </div>
  </nav>