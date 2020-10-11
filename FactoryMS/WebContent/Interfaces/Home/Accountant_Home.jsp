<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Home & Login/Home_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Home & Login/Home_Script.js"></script>
</head>
<body>
<!-- +++++++++++++++++++++++++++++++++ Header Part +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<%
    if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }

%> 
<div id="headDiv">
					<img src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" id="logo"> 
				<div id="name">
					<label id="title">Dehiwatta Tea Factory</label><br>
					<label id="address">Hapugahayatatenna,Handessa</label>
				</div>
				<div id="manage">
					<div class="dropdown">
							  <button onclick="myFunction()" class="dropbtn"><%=(String)session.getAttribute("uname")%></button>
									  <div id="myDropdown" class="dropdown-content">
											<a href="${pageContext.request.contextPath}/Interfaces/Home/User_Profile.jsp">View Profile</a>
											<a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
									  </div>
					</div>
				</div>
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>" alt="UserLogo" id="Userlogo">								

</div>
<div style="float:left; width:100%; margin-top:-4px"><hr></div>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


<div id="bodyDiv">
		
		<!-- Body Part -->

		<h2>Welcome to Accountant Home Page  </h2>
		
		<div class="divAcc">
				<div class="icondiv">
						<a href="${pageContext.request.contextPath}/Interfaces/Payroll/MonthlyPayroll.jsp">
							<img src="${pageContext.request.contextPath}/Images/Payroll.png" alt="payrollLogo" class="functionlogo">
							<label>Payroll Management</label>
						</a>
				</div>
				<div class="icondiv">
						<a href="${pageContext.request.contextPath}/Interfaces/Home/User_Profile.jsp">
							<img src="${pageContext.request.contextPath}/Images/Profile.png" alt="ProfileFlLogo" class="functionlogo">
							<label>User Profile</label>
						</a>
				</div>
				<div class="icondiv">
						<a href="${pageContext.request.contextPath}/Interfaces/Home/Tech_Support.jsp">
							<img src="${pageContext.request.contextPath}/Images/Tech Support.png" alt="TechSlLogo" class="functionlogo">
							<label>Technical Support</label>
						</a>
				</div>
				
		</div>
		
		
		
		
		
		
		
		
		

		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</div>
<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</body>
</html>