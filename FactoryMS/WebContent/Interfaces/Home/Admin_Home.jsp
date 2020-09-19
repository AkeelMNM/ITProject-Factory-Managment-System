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
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


<div id="bodyDiv">
		
		<!-- Body Part -->

		<%
				
				//Accsessing the Cookie
				/*Cookie[] cookies = request.getCookies();;
				String EmployeeID = null;
				String AttendanceID;
				for (Cookie aCookie : cookies) {
					if (aCookie.getName().equals("employeeid"))
					{
						EmployeeID = aCookie.getValue();
					}
				}
				
					AttendanceService attendanceService = new AttendanceServiceImpt();
					ArrayList<Attendance> attendanceList = attendanceService.getAttendance(); //Getting Employees All Attendance*/
					
		%>

		<h2>Welcome to Administrator Home Page  </h2>
		
		
		<div class="divB">		
				<div class="icondiv">
						<a href="#">
							<img src="${pageContext.request.contextPath}/Images/Purchase.png" alt="PurchaseLogo" class="functionlogo">
							Purchase Management
		
						</a>
				</div>
				<div class="icondiv">
						<a href="#">
							<img src="${pageContext.request.contextPath}/Images/Production.png" alt="ProductLogo" class="functionlogo">
							Production Management
						</a>
				</div>
				<div class="icondiv">
					
						<a href="#">
							<img src="${pageContext.request.contextPath}/Images/Inventory.png" alt="inventoryLogo" class="functionlogo">
							<label>Inventory Management</label>
						</a>
				</div>
				<div class="icondiv">
						<a href="#">
							<img src="${pageContext.request.contextPath}/Images/Sales.png" alt="salesLogo" class="functionlogo">
							<label>Sales Management</label>
						</a>
				</div>
		</div>
		<div class="divC">
				<div class="icondiv">
						<a href="#">
							<img src="${pageContext.request.contextPath}/Images/Expense.png" alt="expenseLogo" class="functionlogo">
							<label>Expense Management</label>
						</a>
				</div>
				<div class="icondiv">
						<a href="#">
							<img src="${pageContext.request.contextPath}/Images/HR.png" alt="hrLogo" class="functionlogo">
							<label>Human Resource Management</label>
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