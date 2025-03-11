<style>
		.bg-secondary-soft, .edit-prof {
    background-color: var(--sidebar-color) !important;
    color:var(--text-color);
}


.rounded {
    border-radius: 5px !important;
}
/* .py-5 {
    padding-top: 3rem !important;
    padding-bottom: 3rem !important;
} */
/* .px-4 {
    padding-right: 1.5rem !important;
    padding-left: 1.5rem !important;
} */
.file-upload .square {
    height: 250px;
    width: 250px;
    margin: auto;
    vertical-align: middle;
    border: 1px solid #e5dfe4;
    background-color: #fff;
    border-radius: 5px;
}
.text-secondary {
    --bs-text-opacity: 1;
    color: var(--text-color) !important;
}
.btn-success-soft {
    color: var(--text-color) !important;
    background-color: rgba(40, 167, 69, 0.1);
}
.btn-danger-soft {
    color: var(--text-color) !important;
    background-color: rgba(220, 53, 69, 0.1);
}
.form-control {
    display: block;
    width: 100%;
    padding: 0.5rem 1rem;
    font-size: 0.9375rem;
    font-weight: 400;
    line-height: 1.6;
     color:var(--text-color) !important;
   background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #e5dfe4;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 5px;
    -webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
}
.dark .edit-prof-form input{
	background-color:var(--body-color);
	color:var(--text-color) !important;
	&::placeholder{
		color:var(--text-color) !important;
	}
	
}
</style>



<div class="container my-5">
<div class="row">
		<div class="col-12">
			<!-- Page title -->
			<div class="rounded edit-prof my-4">
				<h3 class="py-2 px-4">Edit Profile</h3>
				<hr>
			</div>
			<!-- Form START -->
<c:if test="${not empty alumniObj}" >
			<form class="file-upload edit-prof-form" action="../edit-profile" method="post" enctype="multipart/form-data">
				<div class="row mb-5 gx-5">
					<!-- Contact detail -->
					<div class="col-xxl-8 mb-5 mb-xxl-0">
						<div class="bg-secondary-soft px-4 py-5 rounded">
							<div class="row g-3">
								<h4 class="mb-4 mt-0 fs-4">Contact detail</h4>
								
								
								<!-- First Name -->
								<div class="col-md-6">
									<label class="form-label fs-5">First Name </label>
									<input type="text" class="form-control fs-5" placeholder="${alumniObj.fullname }" aria-label="Full name" name="name" value="${alumniObj.fullname }">
								</div>
								<!-- Last name -->
							 	<div class="col-md-6 ">
									<label class="form-label fs-5">Email </label>
									<input type="email" class="form-control fs-5 " placeholder="${alumniObj.email }" aria-label="Email" name="email" value="${alumniObj.email }">
									<input type="hidden" class="form-control fs-5 " placeholder="${alumniObj.status }" aria-label="status" name="status" value="${alumniObj.status }">
								
								</div> 
								<!-- Phone number -->
								<div class="col-md-6 d-flex gap-5">
									<div class="w-50">
										<label class="form-label fs-5">Branch </label>
										<input type="text" class="form-control fs-5 " placeholder="${alumniObj.branch }" aria-label="Branch" name="branch" value="${alumniObj.branch }">
									</div>
									<div class="w-50">
										<label class="form-label fs-5">Batch </label>
										<input type="text" class="form-control fs-5" placeholder="${alumniObj.batch }" aria-label="Batch"  maxlength="4" minlength="4" name="batch" value="${alumniObj.batch }">
									</div>
									
									</div>
								<!-- Mobile number -->
								<div class="col-md-6">
									<label class="form-label fs-5">Job Role </label>
									<input type="text" class="form-control fs-5" placeholder="${alumniObj.work }" aria-label="Work" name="work"  value="${alumniObj.work }">
								</div>
								<!-- Email -->
								<div class="col-md-6">
									<label for="batch" class="form-label fs-5">Gender </label>
									<input type="text" class="form-control fs-5 " id="batch" placeholder="${alumniObj.gender }"  name="gender" value="${alumniObj.gender }" >
								</div>
								<!-- Skype -->
								<div class="col-md-6">
									<label class="form-label fs-5">Current Company </label>
									<input type="text" class="form-control fs-5" placeholder="${alumniObj.company }" aria-label="Company" name="company" value="${alumniObj.company }" >
								</div>
							</div> <!-- Row END -->
						</div>
					</div>
					<!-- Upload profile -->
					<div class="col-xxl-4">
						<div class="bg-secondary-soft px-4 py-5 rounded">
							<div class="row g-3">
								<h4 class="mb-4 mt-0">Upload your profile photo</h4>
								<div class="text-center">
									<!-- Image upload -->
									<div class="square position-relative display-2 mb-3">
										<div class="square position-relative display-2 mb-3">
  <img src="${alumniObj.profile_img }" class="img-fluid  m-2" height="90%" width="90%" id="profileImg"></img>
       <input type="text" name="oldPic" value="${alumniObj.profile_img }" hidden>
</div>
<!-- Button -->
     
									</div>
									<!-- Button -->
									<input type="file" accept="image/png, image/jpg, image/jpeg" id="inputPic" name="file" hidden="">
									<label class="btn btn-success-soft btn-block fs-5" for="inputPic">Upload</label>
									
									<button type="button" class="btn btn-danger-soft fs-5" id="removePic" id="removePic">Remove</button>	
									
									<!-- Content -->
									<p class="text-muted mt-3 mb-0 fs-6"><span class="me-1">Note:</span>Minimum size 300px x 300px</p>
								</div>
							</div>
						</div>
					</div>
					
					
				</div> <!-- Row END -->

				<!-- Social media detail -->
				<div class="row mb-5 gx-5">
					<div class="col-xxl-6 mb-5 mb-xxl-0">
						<div class="bg-secondary-soft px-4 py-5 rounded">
							<div class="row g-3">
								<h4 class="mb-4 mt-0">Social media detail</h4>
								<!-- Github -->
								<div class="col-md-6">
									<label class="form-label fs-5"><i class="fab fa-fw fa-facebook me-2 text-facebook"></i>Github </label>
									<input type="text" class="form-control fs-5" placeholder="${alumniObj.githubLink }" aria-label="Github"  name="github" value="${alumniObj.githubLink }">
								</div>
							
								<!-- Linkedin -->
								<div class="col-md-6">
									<label class="form-label fs-5"><i class="fab fa-fw fa-linkedin-in text-linkedin me-2"></i>Linkedin </label>
									<input type="text" class="form-control fs-5" placeholder="${alumniObj.linkdnLink }" aria-label="Linkedin" name="linkdn" value="${alumniObj.linkdnLink }">
								</div>
								
								<!-- Dribble -->
								
							</div> <!-- Row END -->
						</div>
					</div>

					<!-- change password -->
					<div class="col-xxl-6">
						<div class="bg-secondary-soft px-4 py-5 rounded">
							<div class="row g-3">
								<h4 class="my-4">Change Password</h4>
								<!-- Old password -->
								<div class="col-md-6">
									<label for="exampleInputPassword1" class="form-label fs-5">Old password </label>
									<input type="password" class="form-control fs-5" id="exampleInputPassword1" name="oldPwd" >
								</div>
								<!-- New password -->
								<div class="col-md-6">
									<label for="exampleInputPassword2" class="form-label fs-5">New password </label>
									<input type="password" class="form-control fs-5" id="exampleInputPassword2" name="newPwd" >
								</div>
								<!-- Confirm password -->
								<div class="col-md-12">
									<label for="exampleInputPassword3" class="form-label fs-5">Confirm Password </label>
									<input type="password" class="form-control fs-5" id="exampleInputPassword3" name="confirmedPwd">
								</div>
								<div class="mb-3">
							<input required name="id" type="hidden" class="form-control" value="${alumniObj.id }">
							</div>
								
							</div>
						</div>
					</div>
				</div> <!-- Row END -->
				<!-- button -->
				<div class="gap-3 d-md-flex justify-content-md-end text-center">
					 <form action="../delete-alumni" method="post" onsubmit="return confirm('Are you sure you want to delete this profile?');">
                                <input type="hidden" name="alumniId" value="${alumniObj.id }">
                               
                                <button type="button" class="btn btn-danger btn-lg">Delete profile</button>
					 </form>
				
					<button type="submit" class="btn btn-primary btn-lg">Update profile</button>
				</div>
					

			</form> 
			  </c:if> 
			<!-- Form END -->
		</div>
	
  
	</div>
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
	
	 