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

		<label id="insertTit">INSERT FORM</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/DeleteAttendanceServlet">
		<table class="form">
				<tr>
					<td>Employee Name : </td>
					<td><input type="text" name="name" size="55" required></td>
				</tr>
				<tr>
					<td>Date of birth : </td>
					<td><input type="Date" name="DOB"  required></td>
				</tr>
				<tr>
					<td>NIC : </td>
					<td><input type="text" name="NIC" size="55" required pattern="[0-9]{9}[v|V]|[0-9]{12}"></td>
				</tr>
				<tr>
					<td>Gender : </td>
					<td><input type="radio" name="gender" value="Male"  checked="checked"> Male
					<input type="radio" name="gender" value="Female" > Female</td>
				</tr>
				<tr>
					<td>Marital Status : </td>
					<td><input type="radio" name="MaritalStatus" value="Single" checked="checked"> Single	
					<input type="radio" name="MaritalStatus" value="Married"> Married</td>
				</tr>
				<tr>
					<td>Contact Number : </td>
					<td><input type="text" name="PhoneNo"  size="55" required pattern="[0-9]{10}" ></td>
				</tr>
				<tr>
					<td>Email : </td>
					<td><input type="text" name="NIC"  size="55" required pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A_Za-z]{2,3}" ></td>
				</tr>
				<tr>
					<td>Address : </td>
					<td><textarea rows="3" cols="55" name="Address"  required></textarea></td>
				</tr>
				<tr>
					<td>Job Title : </td>
					<td>
						<select  name="job" style="width: 250px;" required> 
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
					<td >Joint Date : </td>
					<td><input type="date" name="Joint_date" required></td>
				</tr>
				<tr>
					<td>Qualification : </td>
					<td><textarea rows="3" cols="55" name="qualification" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="Reset" class="resetbutton">
					<input type="submit" value="Create" class="submitbutton"></td>
				</tr>
			</table>
			</form>
		</div>
		
<div class="vl"></div>
		<div class="search">
			<input type="text" name="JobTitle" id="se" required>
		</div>
		
		<div class ="table">

			<table class="view">
				<tr class="viewTr" id ="myHeader">
						<th >Employee Name</th>
						<th >DOB</th>
						<th >NIC</th>
						<th >Gender</th>
						<th >Marital Status</th>
						<th >Email</th>
						<th >Contact No</th>
						<th >Address</th>
						<th >Job Title</th>
						<th >Date Joined</th>
						<th >Qualification</th>
						<th >Edit</th>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">Tea Producer</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
						<td class ="tData">123@gmail.com</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
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