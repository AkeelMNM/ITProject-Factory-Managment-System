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
					<td style="text-align: center;">Date:</td>
					<td><input type="date" name="date" tabindex="1" required></td>
				</tr>
				<tr>
					<td style="text-align: center;">Month : </td>
					<td>
						<select id="dep"  name="acctype" tabindex="2" style="width: 200px;" required> 
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
						<select id="dep"  name="name[]" tabindex="3" style="width: 150px;" required> 
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
					<td style="text-align: center"><input type="checkbox"  name="absent[]" value="Absent" tabindex="4" checked></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="2" ><input type="reset" value="Reset" class="resetbutton" style="margin-top:12px;">
					<input type="submit" value="Submit" class="submitbutton" style="margin-top:12px;"></td>
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
						<th >Date</th>
						<th >Month</th>
						<th >Status</th>
						<th >Edit</th>
				</tr>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">Married</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">Male</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">Male</td>
						<td class ="tData">7/65 Pereadeniya,Kandy</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">Married</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">Married</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">07774561820</td>
						<td class ="tData">2 year in Tea Production</td>
						<td class ="tData"><input type="submit" value="Edit" class="editbutton"></td>
				</tr>
				<tr class="viewTr">
						<td class ="tData">Mohamed Akeel</td>
						<td class ="tData">Male</td>
						<td class ="tData">Married</td>
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