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
              <a href="adminhome.jsp">
                <i class='bx bx-home icon' ></i>
                <span class="text nav-text">Home</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="addAdmins.jsp">
               <i class='bx bx-user-plus icon'></i>
                <span class="text nav-text">Add Admin</span>
              </a>
            </li>
             <li class="nav-link">
              <a href="addEvents.jsp">
               <i class='bx bx-calendar-plus icon'></i>
                <span class="text nav-text">Add Event</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="dashboard.jsp">
                <i class='bx bxs-dashboard icon' ></i>
                <span class="text nav-text">Dashboard</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="#">
                <i class='bx bx-info-circle icon' ></i>
                <span class="text nav-text">About</span>
              </a>
            </li>
           
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