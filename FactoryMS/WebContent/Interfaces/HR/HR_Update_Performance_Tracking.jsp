<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="com.fms.model.PerformanceTracking"%>
<%@page import="fms.HR.service.PerformanceTrackingServiceImpt"%>
<%@page import="fms.HR.service.PerformanceTrackingService"%>
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
					
					String PTID = request.getParameter("PTID");
					PerformanceTrackingService PS = new PerformanceTrackingServiceImpt();
					PerformanceTracking pt = PS.getPerformacneTrackingByID(PTID);
		%>
		<div class ="left">
		<br>
		<label id="insertTit" style="margin-right:70%;">Employee Performance Tracking Details Update Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/UpdatePerfromanceTrackingServlet">
		<table class="form" style="margin-top:2%;">
				<tr>
					<td for="dep">Job Title : </td>
					<td>
						<select id="dep"  name="job" tabindex="1" style="width: 250px;" required> 
								<option value="<%=pt.getJobTitle()%>"><%=pt.getJobTitle()%></option> 
								<%
									JobService jobservice = new JobServiceImpt();
									ArrayList<String> jobnameList = jobservice.getJobName();
									
									for(String name : jobnameList)
									{
								%>
							
									<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>
							</select>
					</td>
					<td></td><td></td>
					<td colspan="2" ><label style="font-weight:bold;">Performance Details</label><hr></td>
				</tr>
				<tr>
					<td for="dep">Employee Name : </td>
					<td>
						<select id="dep"  name="name" tabindex="2" style="width: 250px;" required> 
								<option value="<%=pt.getEmpName()%>"> <%=pt.getEmpName()%> </option> 
								<%
									EmployeeService empservice= new EmployeeServiceImpt();
									ArrayList<String> nameList =empservice.getAllEmployeeName();
									
									for(String name : nameList)
									{
								%>
							
								<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>
							</select>
					</td>
					<td></td><td></td>
					<td>Performance : </td>
					<td>
						<select id="dep"  name="performance" tabindex="3" style="width: 250px;" required> 
								<option value="<%=pt.getPerformace()%>"> <%=pt.getPerformace()%> </option> 
								<option value="1">Poor</option>
								<option value="2">Fair </option>
								<option value="3">Average</option>
								<option value="4">Good</option>
								<option value="5">Excellent </option> 
							</select>
					</td>
				</tr>

				<tr>
					<td>Time in: </td>
					<td><input type="time" name="timein" tabindex="4" value="<%=pt.getTimeIn()%>" required></td>
					<td></td><td></td>
					<td>Description : </td>
					<td><textarea rows="5" cols="55" name="description" tabindex="5" required><%=pt.getDescription()%></textarea></td>
				</tr>
				<tr>
					<td>Lunch in : </td>
					<td><input type="time" name="lunchin" tabindex="6" value="<%=pt.getLunchIn()%>"  required  ></td>
				</tr>
				<tr>
					<td>Lunch out : </td>
					<td><input type="time" name="lunchout" tabindex="7" value="<%=pt.getLunchOut()%>" required ></td>
				</tr>
				<tr>
					<td>Time out : </td>
					<td><input type="time" name="timeout" tabindex="8" value="<%=pt.getTimeOut()%>" required ></td>
				</tr>
				<tr>
					<td >Over Time (hr) : </td>
					<td><input type="text" name="overtime"  value="<%=pt.getOvetTime()%> "tabindex="9" size="35" required></td>
				</tr>

			</table>

					<hr id="hrid" style="margin-top:7px;">
					<input type="hidden" name="PTID" value="<%=pt.getEPTID()%>">
					<input type="hidden" name="empID" value="<%=pt.getEmpID()%>">
					<input type="submit" value="Update Tracking Details" class="submitbutton">

			</form>
			<form method="POST" action="${pageContext.request.contextPath}/DeletePerfromanceTrackingServlet">
					<input type="hidden" name="epID" value="<%=pt.getEPTID()%>">
					<input type="submit" value="Delete Tracking Details" class="deletebutton" onclick="return confirm('Are you sure you want to delete?')">

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