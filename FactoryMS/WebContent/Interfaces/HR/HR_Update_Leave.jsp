<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin_Update_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin&Manager_Script.js"></script>
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
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="#">Home
				<ul>
					  <li><a class="menu" href="#">Purchase</a></li>
					  <li><a class="menu" href="#">Production</a></li>
					  <li><a class="menu" href="#">Inventory</a></li>
					  <li><a class="menu" href="#">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="#">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">Manage Employee</a></li>
				  <li><a class="menu" href="#">Manage Jobs</a></li>
				  <li><a class="menu" href="#">Employee Performance Tracking</a></li>
				  <li><a class="menu" href="#">Manage Account</a></li>
				  <li><a class="menu" href="#">Manage Employee Leaves</a></li>
		</ul>

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
		<div class ="left">
		<br>
		<label id="insertTit" style="margin-right:80%;">Job Details Update Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/DeleteAttendanceServlet">
		<table class="form" style="margin-top:2%;">
				<tr>
					<td style="text-align: center;">Date:</td>
					<td><input type="date" name="date" required></td>
				</tr>
				<tr>
					<td style="text-align: center;">Month : </td>
					<td class="select">
						<select id="dep"  name="acctype" style="width: 200px;" required> 
								<option> --Select Month-- </option>
								<option value="January">January</option>
								<option value="February"> February </option>
								<option value="March"> March </option>
								<option value="April"> April </option>
								<option value="May"> May </option>
								<option value="June"> June </option>
								<option value="July"> July </option>
								<option value="August"> August </option>
								<option value="September"> September </option>
								<option value="October"> October </option>
								<option value="November"> November </option>
								<option value="December"> December </option>
												
						</select>
					</td>
				</tr>
					<tr><td style="text-align: center; text-decoration: underline;">Employee Name</td>
					<td  style="text-align: center; text-decoration: underline;">Absent</td></tr>
				<%
					for(int i=0;i<8;i++){
				%>
				<tr>
					<td style="text-align: center">
						<select id="dep"  name="name[]" style="width: 150px;" required> 
								<option> --Select Name-- </option> 
								<%/*
									HRDepartmentAndManagerServiceInterface iHRviewDepartment = new HRDepartmentAndManagerServiceImpt();
									ArrayList<Department> DepartmentList = iHRviewDepartment.getDepartments();
									
									for(Department dep : DepartmentList)
									{*/
								%>
							
								<option value="<%//=dep.getName() %>">  <%//=dep.getName() %>  </option> 			
									
								<%
									//}
								%>
							</select>
					</td>
					<td style="text-align: center"><input type="checkbox"  name="absent[]" value="Absent" checked></td>
					<td><input type="submit" value="Remove" class="removebutton"></td>
				</tr>
				<%
					}
				%>
			</table>

					<hr id="hrid" style="margin-top:7px;">

					<input type="submit" value="Update Leave Details" class="submitbutton">

			</form>
		</div>

		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</div>
<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</body>
</html>