 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.db.DBConnection" %>
 <%@ page import ="java.sql.Connection" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alumni Connect</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="components/sAttyle.css">
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



</style>


<%@include file="components/navbar.jsp"%>
			<div class="home">
			
		<%@include file="components/bootnav.jsp"%>
		<div class="section-hero">
			<div class="container">
				<div class="hero-text-content">
					<div class="hero-heading">
						<h2>Alumni Connect – Stay Inspired, Grow Together</h2>
						<p class="hero-para">Reconnect, network, and grow with fellow alumni. Share opportunities, inspire others, and stay connected!</p>
						<div class="hero-btn">
									<a href="login.jsp">
    <button class="btn login-btn px-5 fs-4" type="button">Login</button>
</a>
<a href="register.jsp">
    <button class="btn login-btn  fs-4 px-5" type="button">SignUp</button>
</a>
							
						</div>
					</div>
				</div>
				<div class="hero-img">
					<img
						src="images/connect.svg"
						alt="">
				</div>

			</div>

		</div>
		<br>
		<hr>




		<%@include file="components/notes.jsp"%>

		<%@include file="components/memories.jsp"%>
		<%@include file="components/startupSlider.jsp"%>
		<%@include file="components/footer.jsp"%>
	</div>

	<script src="components/ssScripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>