<%@page import="com.fms.model.Account"%>
<%@page import="fms.HR.service.AccountServiceImpt"%>
<%@page import="fms.HR.service.AccountService"%>
<%@page import="com.fms.model.Employee"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Home & Login/Home_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/EmployeeScript.js"></script>

<style type="text/css">

	table {
	  border-collapse: collapse;
	  width: 96%;
	  float:left;
	}
	
	td {
	  text-align: left;
	  padding: 12px;
	}
	th{
	  text-align: left;
	  padding: 6px;
	}
	
	tr:nth-child(even){background-color: #f2f2f2}
	
	th {
	  background-color:#2c2c2c;
	  color: white;
	}

#Userlogo2
{
		display:block;
		width:80px;
		height:80px;
		border-radius: 50%;
		float:left;
		margin-left:725px;
		margin-top:30px;
}


</style>

</head>
<body>
<!-- +++++++++++++++++++++++++++++++++ Header Part +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<div id="headDiv">
					<img src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" id="logo"> 
				<div id="name">
					<label id="title">Dehiwatta Tea Factory</label><br>
					<label id="address">Hapugahayatatenna,Handessa</label>
				</div>
				<div id="manage">
					<div class="dropdown">
							  <button onclick="myFunction()" class="dropbtn">User Name</button>
									  <div id="myDropdown" class="dropdown-content">
											<a href="#home">View Profile</a>
											<a href="#about">Logout</a>
									  </div>
					</div>
				</div>
						<img src="${pageContext.request.contextPath}/Images_UserProfile/AB.jpg" alt="UserLogo" id="Userlogo">								

</div>
<div style="float:left; width:100%; margin-top:-4px"><hr></div>
<div id="bodyDiv">
<h2>Technical Support  </h2>
		<!-- Content Part -->
		
		<div>
		
		
		</div>
		
		
</div>
<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>
</html>