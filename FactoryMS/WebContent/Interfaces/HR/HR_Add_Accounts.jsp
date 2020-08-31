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
		<br>
		<label id="insertTit">INSERT FORM</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/DeleteAttendanceServlet" style="margin-top:50px;">
		<table class="form">
				
				<tr>
					<td for="dep">Account Type : </td>
					<td>
						<select id="dep"  name="acctype" tabindex="1" style="width: 250px;" required> 
								<option> --Select Type-- </option>
								<option value="Manager"> Manager </option>
								<option value="Administrator"> Administrator </option>
								<option value="Accountant"> Accountant </option>
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
					<td>Employee Email:</td>
					<td><input type="text" name="email" tabindex="3" size="55" required></td>
				</tr>
				<tr>
					<td>Enter Password:</td>
					<td><input type="password" name="password" id="pwd" tabindex="3" size="55" required></td>
				</tr>
				<tr>
					<td>Re-enter Password : </td>
					<td><input type="password" name="repassword" id="confirm_pwd" tabindex="4" size="55" onkeyup="check()" required ><br>
					<span id='Pwd_msg'></td>
				</tr>
				<tr>
					<td>Status : </td>
					<td><input type="radio" name="status" value="active" tabindex="5" checked="checked"> Active
					<input type="radio" name="status" value="inactive" tabindex="6" > Inactive</td>
				</tr>
				
				<tr ><td colspan="2" ></td></tr>
				<tr ><td colspan="2" ></td></tr>
				<tr ><td colspan="2" ></td></tr>
				<tr >
					<td colspan="2" ><input type="reset" value="Reset" class="resetbutton">
					<input type="submit" value="Create" class="submitbutton"></td>
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
						<th >Employee Mail</th>
						<th >Password</th>
						<th >Account Type</th>
						<th >Account Status</th>

						<th >Edit</th>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">Married</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">Male</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">Married</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">Married</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
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