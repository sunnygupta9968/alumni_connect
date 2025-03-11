<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.db.DBConnection" %>
 <%@page import="com.dao.Gallerydao" %>
 <%@page import="com.dao.Userdao" %>
 <%@page import="com.entity.Gallery" %>
  <%@page import="com.entity.User" %>
 <%@page import="java.util.*" %>
 <%@ page import ="java.sql.Connection" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jai Shree Ram</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../components/sAttyle.css">
</head>
<body>
<style>
.hero-btn{
	
	width:40%;
	display:flex;
	gap:1rem;
	
	& button{
	background-color:var(--sidebar-color);
	color:var(--text-color);
	   outline:none;
	   &:hover{
	   border:2px solid var(--sidebar-color);
	   color:var(--btn-text);
	   
	   }
	}
}
.gallery-title{
	color:var(--text-color);
	
	
	
}
   .gallery-item {
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }
        .gallery-item img {
            width: 100%;
            height: auto;
            transition: transform 0.3s;
        }
        .gallery-item:hover img {
            transform: scale(1.1);
        }
      
        .modal-img {
            width: 100%;
        }

  /* User info overlay */
 .user-info {
            display: flex;
            align-items: center;
            padding: 8px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            position: absolute;
            bottom: 0;
            width: 100%;
            border-radius: 0 0 10px 10px;
            flex-direction: row;
        }

        .user-info img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 8px;
            border: 2px solid white;
        }

        .event-caption {
            display: flex;
            flex-direction: column;
        }

        .event-name {
            font-size: 14px;
            font-weight: bold;
           
            margin-bottom: 0;
        }

        .user-name {
            font-size: 10px;
            margin: 0;
        }

</style>



<%@include file="alumniComponents/sidenavbar.jsp"%>
			<div class="home">
			
		<%@include file="alumniComponents/topnav.jsp"%>
	
	
	
	<!--  Gallery -->
	<section>
	<div class="container mt-5">
    <h1 class="gallery-title mb-5 text-center">Community Gallery</h1>
    
    <div class="row mx-3" id="gallery">
   
   <%
     Gallerydao gallerydao=new Gallerydao(DBConnection.getConn());
    	List<Gallery> imgList=gallerydao.getGallery();
   	Userdao userdao=new Userdao(DBConnection.getConn());
   	  for(Gallery g:imgList){
   		  
   	  	User u=userdao.getUserById(g.getAlumniId());
   	  	
   
   
   
   %>
      
      
      
      
      
            <div class="col-md-4 mb-3">
                <div class="gallery-item" data-bs-toggle="modal" data-bs-target="#imageModal" data-title="<%=g.getTitle() %>" data-description="<%=g.getImageDesc() %>"
         data-url="../<%=g.getImgLink()%>" >
                    <img src="../<%=g.getImgLink()%>" alt="">
                       <div class="user-info">
                        <img src="<%=u.getProfile_img() %>" alt="User Profile">
                        <div class="event-caption">
                            <p class="event-name"><%=g.getTitle() %></p>
                            <p class="user-name"><%=u.getFullname() %></p>
                        </div>
                   
                </div>
                </div>
                
            </div>
       <%} %>     
            
            
         
            
           
    </div>
</div>
	<!-- Modal for Enlarged Image -->
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="imageModalLabel"></h5>
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="imageModalDescription" class="text-muted"></p> <!-- Added description -->
                <img src="" id="modalImage" class="modal-img">
            </div>
           <!--  <p class="modal-desc" id="imageModalLabelDesc"></p> -->
            
            <div class="modal-body text-center">
                <img src="" id="modalImage" class="modal-img">
            </div>
             
        </div>
    </div>
    
</div>
<c:if test="${not empty alumniObj.status}">
    <div class="d-flex justify-content-end">
         <a class="btn google-btn mx-4 text-decoration-none " href="addGalleryImages.jsp" >Upload Image</a>
        
      </div>
</c:if>
	 
 </section>
	
	
	
<!-- End of Galleru -->

	
		<%@include file="alumniComponents/footer.jsp"%>
	</div>

	<script src="../components/ssScripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		
		<script>
		document.addEventListener("DOMContentLoaded", function() {
		    document.querySelectorAll(".gallery-item").forEach(item => {
		        item.addEventListener("click", function() {
		            let title = this.getAttribute("data-title");
		            let imageUrl = this.getAttribute("data-url");
		            let description = this.getAttribute("data-description");

		            document.getElementById("imageModalLabel").textContent = title;
		            document.getElementById("modalImage").src = imageUrl;
		            document.getElementById("imageModalDescription").textContent = description;
		        });
		    });
		});

</script>
</body>
</html>