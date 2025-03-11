<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
<title>Add Admin</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
 <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
 <link rel="stylesheet" href="../components/sAttyle.css">
</head>
<body>
  <c:if test="${empty adminObj }">
<c:redirect url="../login.jsp"></c:redirect>

</c:if>
                                         
                                      


<%@include file="components/sidenavbar.jsp" %>

<div class="home">
<%@include file="components/topnav.jsp" %>

<style>
  .addevent{
     /*   border:1px solid red; */
       height:50%;
       background-color:var(--sidebar-color);
       
       } 
       
  
   .square-img, textarea{
   		background-color:var(--body-color);
   }
   .event-form textarea{
   	background-color:var(--body-color);
   	border:none;
   	border-radius:8px;
   	color:var(--text-color);
   }
   
   .file-upload .square {
    height: 300px;
    width: 300px;
    margin: auto;
    vertical-align: middle;
    
    border-radius: 5px;
}
  
          
          </style>


<!-- LOGIN CARD -->
<form action="../addAdmin" method="post" enctype="multipart/form-data">



<div class="d-flex justify-content-center align-item-center my-4">
 <div class="addevent login-card w-75">
  <div class="container w-50 py-2">
  
     <div class="loginimg ">
       <div class="w-100 file-upload my-3 col-xxl-4">
						<div class="bg-secondary-soft  px-4 py-5 rounded">
							<div class="row my-5 g-3 fs-4">
								 <label for="courseCategory my-1">Upload Image *</label>
								<div class="square-img  text-center my-2">
									<!-- Image upload -->
									<div class="square position-relative display-2 mb-3">
										<div class="position-relative display-2 mb-3 my-4">
  <img src="https://cdn-icons-png.flaticon.com/512/3771/3771098.png" class="img-fluid square-img  m-2"  id="profileImg" height="250px" width="250px" py-2></img>
       <input type="text" name="oldPic" value="" hidden>
</div>
<!-- Button -->
     
									</div>
									<!-- Button -->
									<input type="file" accept="image/png, image/jpg, image/jpeg" id="inputPic" name="file" hidden="" required>
									<label class="btn btn-success btn-block fs-5" for="inputPic">Upload</label>
									
									<button type="button" class="btn btn-danger fs-5" id="removePic" id="removePic">Remove</button>	
									
									<!-- Content -->
									<p class="text-muted mt-3 mb-0 fs-6"><span class="me-1">Note:</span>Minimum size 300px x 300px</p>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
     
     
       </div>
     
     
     
     <div class="login-form w-50">
          <div class="login-title my-2">
            <h2>Add Admin</h2>
            <p class="login-para">Lorem ipsum dolor sit amet consectetur.</p>
          </div>
          
        
          
          
          
         
          <div class="email-login">

          
          
          <div  class="login-form event-form" >
            <h5 style="text-align: center; margin: 10px 0px; font-size: 18px;">Add an Admin</h5>
             <label for="adminName">Admin Name* :</label>
              <input type="text" id="adminName" name="adminName" required>
              <label for="adminEmail">Email* :</label>
              <input type="email" id="adminEmail" name="adminEmail" required >
               <label for="adminPwd">Admin Password* :</label>
              <input type="password" id="adminPwd" name="adminPwd" required >
           
              <!--<label for="courseDesc">Course Description :</label>
              <input type="text" id="courseDesc" name="courseDesc" >
              --> 
             
              
              <button class="btn google-btn" type="submit">Add</button>

            </div>
          </div>
       
         
        </div>
        
  </div>
 
 </div>
 </form>
  <%@include file="components/footer.jsp" %>
 </div>

  

<script>
let profilePic=document.getElementById("profileImg");
let inputFile=document.getElementById("inputPic");
let removeBtn = document.getElementById("removePic");
const oldProfilePic = profilePic.src;
inputFile.onchange=function(){
profilePic.src=URL.createObjectURL(inputFile.files[0]);
}
removeBtn.onclick = function () {
    profilePic.src = oldProfilePic;  // Restore old image
    inputFile.value = "";            // Clear file input
};
</script>

<script src="../components/ssScripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>