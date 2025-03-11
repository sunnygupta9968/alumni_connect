<div class="login-card my-5">
  <div class="container">
     <div class="login-img">
     
      <img src="images/login1.svg" alt="">
      
     </div>
     
     <div class="login-form">
          <div class="login-title">
            <h2>Alumni Registration with Email </h2>
            <p class="login-para">Lorem ipsum dolor sit amet consectetur.</p>
          </div>
          <div class="email-login">
<c:if test="${not empty errorMsg}">
<div class="alert alert-danger" role="alert">
"${errorMsg}"
</div>

			<c:remove var="errorMsg" scope="session"/>	
         </c:if> 
          
          <form action="register" class="login-form" method="post" enctype="multipart/form-data">
            <h5 style="text-align: center; margin: 10px 0px; font-size: 18px;">Sign Up with Email</h5>
          
        
              <label for="name">Name :</label>
              <input type="text" id="name" name="name" required>
              <label for="linkdn-pro">Linkdn Profile Link :</label>
              <input type="text" id="linkdn-prof" name="linkdn-prof"  required>
              
              
                <div class="d-flex gap-4">
           <div class="select-course gender w-50">
              <label for="gender">Gender</label>
              <select name="gender" id="gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
              </select>

            </div>
            <div class="select-course w-50">
              <label for="batch">Batch</label>
              <select name="batch" id="courses">
                <option value="2025">2025</option>
                <option value="2024">2024</option>
                <option value="2023">2023</option>
                <option value="2022">2022</option>
              </select>

            </div>
          
          </div>
            
            
            <div class="select-course">
              <label for="branch">Branch</label>
              <select name="branch" id="branch">
                <option value="CSE">CSE</option>
                <option value="IT">IT</option>
                <option value="ECE">ECE</option>
                <option value="EE">EE</option>
                <option value="ME">ME</option>
                <option value="CHE">CHE</option>
              </select>

            </div>
              <label for="email">Email :</label>
              <input type="email" id="email" name="email" required>
              <label for="password">Password :</label>
              <input type="password" name="password" id="password" required>
              
              <div class="select-course">
               <label>Verification Method:</label>
        <select name="verificationMethod" id="verificationMethod" onchange="toggleVerificationField()" required>
            <option value="">Select Method</option>
            <option value="rollNumber">Roll Number</option>
            <option value="collegeDocument">College Document</option>
        </select>
              
             
</div>
        <div class="w-100 " id="rollNoDiv" style="display: none;">
            <label>Enter Roll Number:</label>
            <input type="text" name="rollNumber" minlength="13" maxlength="13"><br>
        </div>

        <div id="docDiv" style="display: none;">
            <label>Upload College Document:</label>
            <input type="file" name="collegeDocument"><br>
        </div>
              
              <button class="btn google-btn" type="submit">Submit</button>

          </form>
           <div class="login-text">
            <a href="login.jsp">
              <p>Already registered? Login Now </p>
            </a>
          </div>
        </div>
        
     </div>
  </div>
 </div>
<script>
        function toggleVerificationField() {
            var method = document.getElementById("verificationMethod").value;
            var rollNoDiv = document.getElementById("rollNoDiv");
            var docDiv = document.getElementById("docDiv");

            if (method === "rollNumber") {
                rollNoDiv.style.display = "block";
                docDiv.style.display = "none";
            } else if (method === "collegeDocument") {
                rollNoDiv.style.display = "none";
                docDiv.style.display = "block";
            } else {
                rollNoDiv.style.display = "none";
                docDiv.style.display = "none";
            }
        }
    </script>