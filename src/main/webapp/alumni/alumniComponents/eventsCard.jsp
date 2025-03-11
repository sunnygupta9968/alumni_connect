<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>


<style>
	
.card {
    display: block;  /* Change to block for better responsiveness */
    width: 100%;  /* Full width for mobile */
    max-width: 480px; /* Prevent overly large cards */
    background-color: var(--sidebar-color);
    color: #989898;
    margin-bottom: 15px; /* Adjust margin */
    font-family: 'Oswald', sans-serif;
    text-transform: uppercase;
    border-radius: 4px;
    position: relative;
}

/* Remove unnecessary left margin between cards */
.card+.card {
    margin-left: 8px;
}

.date {
    display: table-cell;
    width: 40%;
    position: relative;
    text-align: center;
    border-right: 2px dashed #dadde6
}

.date:before,
.date:after {
    content: "";
    display: block;
    width: 30px;
    height: 30px;
    background-color: var(--body-color);
    position: absolute;
    top: -15px;
    right: -15px;
    z-index: 1;
    border-radius: 50%
}

.date:after {
    top: auto;
    bottom: -15px
}

.date time {
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%)
}

.date time span {
    display: block
}

.date time span:first-child {
    color: #2b2b2b;
    font-weight: 600;
    font-size: 250%
}

.date time span:last-child {
    text-transform: uppercase;
    font-weight: 600;
    margin-top: -10px
}

.card-cont {
    display: table-cell;
    width: 75%;
    font-size: 85%;
    padding: 10px 10px 30px 50px
}

.card-cont h3 {
    color: var(--text-color);
    font-size: 130%
}



.card-cont>div {
    display: table-row
}

.card-cont .even-date i,
.card-cont .even-info i,
.card-cont .even-date time,
.card-cont .even-info p {
    display: table-cell
}

.card-cont .even-date i,
.card-cont .even-info i {
    padding: 5% 5% 0 0
}

.card-cont .even-info p {
    padding: 30px 50px 0 0
}

.card-cont .even-date time span {
    display: block
}

.card-cont a {
    display: block;
    text-decoration: none;
    width: 80px;
    height: 30px;
    background-color: #D8DDE0;
    color: #fff;
    text-align: center;
    line-height: 30px;
    border-radius: 2px;
    position: absolute;
    right: 10px;
    bottom: 10px
}

.row:last-child .card:first-child .card-cont a {
    background-color: #037FDD
}

.row:last-child .card:last-child .card-cont a {
    background-color: #F8504C
}

@media screen and (max-width: 860px) {
    .card {
        display: block;
        float: none;
        width: 100%;
        margin-bottom: 10px
    }
    .card+.card {
        margin-left: 0
    }
    .card-cont .even-date,
    .card-cont .even-info {
        font-size: 75%
    }
}








.search-container {
      max-width: 90vw;
      margin: 0 auto;
      
    }

    .search-wrapper {
      background: var(--sidebar-color);
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.08);
      transition: all 0.3s ease;
      color:var(--text-color);
    }

    .search-header {
      padding: 20px;
     /*  border-bottom: 1px solid #eee; */
    }

    .search-input-group {
      position: relative;
      display: flex;
      align-items: center;
    }

    .search-input {
      border: 2px solid #eee;
      border-radius: 30px;
      padding: 10px 20px;
      padding-right: 50px;
      width: 100%;
      transition: all 0.3s ease;
    }

    .search-input:focus {
      border-color: #007bff;
      box-shadow: none;
    }

    .search-icon {
      position: absolute;
      right: 20px;
      color: #666;
    }

   
  


   

  

.alumni-filter{
 
     padding: 1rem 0;
    & select{
        background: var(--body-color);
        width: 80%;
       
        margin: 1rem 0;
        padding: 1rem 0.5rem ;
        border-radius: 6px;
 	
        border:0px solid;
        color:var(--text-color);
			
    }
    
    & .search-btn{
    	height:3.5rem;
    	background-color:var(--primary-color);
    	border:none;
    	outline:none;
    	
        }
}







</style>



  <div class="search-containers">

    <div class="search-container  my-5 ">
      <div class="search-wrapper mx-5">
        <div class="search-header">
          <div class="search-input-group">
            <input type="text" class="search-input form-control fs-5" placeholder="Search Events..">
            <i class=" fs-4 bx bx-search search-icon"></i>
          </div>

        

        <div class="category-filters my-3">
   
            <div class="filter-chip px-2">
<div class="alumni-filter d-flex gap-5 fs-5 ">
            
              <select name="course" id="courses">
                <option value="JEE/NEET">Organized by</option>
                <option value="IIC">IIC</option>
                <option value="TPC">TPC</option>
                <option value="TDL">TDL</option>
                <option value="LSC">LSC</option>
               
                
              </select>
               <select name="course" id="courses">
                <option value="JEE/NEET">Posted by</option>
                <option value="Programming">Faculty</option>
                <option value="Gate">Admin</option>
                
              </select>
              
            
              	   <button class="btn my-3 search-btn btn-primary px-5 fs-5 w-25" type="submit">Search</button>
                

            </div> 
               
          </div>
          
         
    </div>
  </div>
</div>

  </div>






<section class="container">
<h1>Events</h1>

   <c:if test="${empty eventsList}">
   		<p class="fs-2 my-4 mx-4 py-5 text-center"> There is no Events</p>
   </c:if>
  
  
  <c:if test="${not empty eventsList}">
  <div class="container">
    <div class="row g-0 my-4"> <!-- Row wraps multiple cards -->
      <c:forEach var="event" items="${eventsList}">
        <div class="col-12 col-md-6 mb-4"> <!-- Full width on small screens, 50% width on larger screens -->
          <article class="card fl-left me-3">
            <section class="date">
              <time datetime="23th feb">
                <img class="px-0 mx-0 w-100" src="https://sbcet.sbss.ac.in/wp-content/uploads/2024/04/Hackathon.jpg" alt="logo">
        
              </time>
            </section>
            <section class="card-cont">
            <c:set var="sqlDate" value="${event.eventDate}" />
            <%
            String sqlDate = (String) pageContext.getAttribute("sqlDate"); // Replace with actual value from DB
    SimpleDateFormat sqlFormat = new SimpleDateFormat("yy-MM-dd");
    Date date = sqlFormat.parse(sqlDate);
    SimpleDateFormat outputFormat = new SimpleDateFormat("EEEE dd MMMM yyyy");
    String formattedDate = outputFormat.format(date);
%>
            
            
            
              <small class="fs-6">${event.eventOrganizer }</small>
              <h3>${event.eventName}</h3>
              <div class="even-date">
                <i class="fa fa-calendar"></i>
                <time>
                  <span><%= formattedDate %></span>
                  <span>${event.eventVenue}</span>
                </time>
              </div>
              <div class="even-info">
                <i class="fa fa-map-marker"></i>
                <p>${event.eventDesc}</p>
              </div>
              <a href="https://${event.eventLink }">Register</a>
            </section>
          </article>
        </div>
      </c:forEach>
    </div>
  </div>
</c:if>
  
  
  
  
  
  
  
</section>