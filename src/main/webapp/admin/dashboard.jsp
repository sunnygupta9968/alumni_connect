<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
 <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../components/sAttyle.css">

<body>
<c:if test="${empty adminObj }">
<c:redirect url="../login.jsp"></c:redirect>

</c:if>

<%@include file="components/sidenavbar.jsp" %>

<div class="home">
<%@include file="components/topnav.jsp" %>
   
 <c:if test="${not empty sucMsg}">
<div class="alert alert-success fs-5" role="alert">
"${sucMsg}"
</div>

			<c:remove var="sucMsg" scope="session"/>	
         </c:if> 
         <c:if test="${not empty errorMsg}">
<div class="alert alert-danger fs-5" role="alert">
"${errorMsg}"
</div>

			<c:remove var="errorMsg" scope="session"/>	
         </c:if> 
  		  <%@include file="components/adminDashboard.jsp" %>
	
	  <%@include file="components/footer.jsp" %>
  </div>
  
 <script src="../components/ssScripts.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
