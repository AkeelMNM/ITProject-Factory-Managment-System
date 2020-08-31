<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin_Insert_Styles.css">
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
				  <li><a class="menu" href="#">Employee Performace Tracking</a></li>
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

		<label id="insertTit">INSERT FORM</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/DeleteAttendanceServlet">
		<table class="form">
				<tr>
					<td for="dep">Job Title : </td>
					<td>
						<select id="dep"  name="job" tabindex="1" style="width: 250px;" required> 
								<option> --Select Job-- </option> 
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
				</tr>
				<tr>
					<td for="dep">Employee Name : </td>
					<td>
						<select id="dep"  name="name" tabindex="2" style="width: 250px;" required> 
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
				</tr>

				<tr>
					<td>Time in: </td>
					<td><input type="time" name="timein" tabindex="3"  required></td>
				</tr>
				<tr>
					<td>Lunch in : </td>
					<td><input type="time" name="lunchin" tabindex="4" size="55" required  ></td>
				</tr>
				<tr>
					<td>Lunch out : </td>
					<td><input type="time" name="lunchout" tabindex="5" size="55" required ></td>
				</tr>
				<tr>
					<td>Time out : </td>
					<td><input type="time" name="timeout" tabindex="6" size="55" required ></td>
				</tr>
				<tr>
					<td >Over Time : </td>
					<td><input type="text" name="overtime" tabindex="7" required></td>
				</tr>
				<tr>
					<td colspan="2" ><label style="font-weight:bold;">Performance Details</label><hr></td>
				</tr>
				<tr>
					<td for="dep">Performance : </td>
					<td>
						<select id="dep"  name="department" tabindex="8" style="width: 250px;" required> 
								<option> --Select State-- </option> 
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
				</tr>
				<tr>
					<td>Description : </td>
					<td><textarea rows="5" cols="55" name="JobTitle" tabindex="9" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="Reset" class="resetbutton">
					<input type="submit" value="Submit" class="submitbutton"></td>
				</tr>
			</table>
			</form>
		</div>
		
<div class="vl"></div>
		<div class="search">
			<input type="text" name="JobTitle" tabindex="2" id="se" required>
		</div>
		
		<div class ="table">

			<table class="view">
				<tr class="viewTr" id ="myHeader">
						<th >Employee Name</th>
						<th >Job Title</th>
						<th >Time In</th>
						<th >Lunch In</th>
						<th >Lunch Out</th>
						<th >Time Out</th>
						<th >Over Time</th>
						<th >Performance</th>
						<th >Description</th>
						<th >Edit</th>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
		
				
		
					<!--  <tr>
						<td><%//=attendance.getEmployee()%></td>
						<td><%//=attendance.getDepartment()%></td>
						<td><%//=attendance.getToday_Date()%></td>
						<td><%//=attendance.getStart_Time()%></td>
						<td><%//=attendance.getEnd_Time()%></td>
						<td></td>
						<td><form method="POST" action="${pageContext.request.contextPath}/DeleteAttendanceServlet">
								<input type="hidden" name ="AttID" value="<%//=attendance.getAttendanceID()%>">
								<input type="hidden" name ="EID" value="<%//=EmployeeID%>">
								<input type="submit" value="Remove Attendance" class="editbutton">
						</form></td>
					</tr>-->
						
				</table>
		</div>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</div>
<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</body>
</html>