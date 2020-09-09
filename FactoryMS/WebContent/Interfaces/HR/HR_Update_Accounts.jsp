<%@page import="com.fms.model.Account"%>
<%@page import="fms.HR.service.AccountServiceImpt"%>
<%@page import="fms.HR.service.AccountService"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="java.util.ArrayList"%>
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
					
					String AccID = request.getParameter("AID");
					AccountService AS = new AccountServiceImpt();
					Account acc = AS.getAccountByID(AccID);
					
		%>
		<div class ="left">
		<br><br>
		<label id="insertTit" style="margin-right:70%;">Employee Account Details Update Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/UpdateAccountServlet">
		<table class="form" style="margin-top:3%;">
				<tr>
					<td for="dep">Account Type : </td>
					<td>
						<select id="dep"  name="acctype" style="width: 250px;" required> 
								<option value="<%=acc.getAccType()%>"> <%=acc.getAccType()%> </option>
								<option value="Manager"> Manager </option>
								<option value="Administrator"> Administrator </option>
								<option value="Accountant"> Accountant </option>
						</select>
					</td>
				</tr>
				<tr>
					<td for="dep">Employee Name : </td>
					<td>
						<select id="dep"  name="name" style="width: 250px;" required>  
								<option value="<%=acc.getEmpName()%>"><%=acc.getEmpName()%> </option> 
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
				</tr>
				<tr>
					<td>Employee Email:</td>
					<td><input type="text" name="email" size="55"value="<%=acc.getUserName()%>" required></td>
				</tr>
				<tr>
					<td>Enter Password:</td>
					<td><input type="password" name="password" id="pwd" value="<%=acc.getPassword()%>" size="55" required></td>
				</tr>
				<tr>
					<td>Re-enter Password : </td>
					<td><input type="password" name="repassword" id="confirm_pwd" value="<%=acc.getPassword()%>" size="55" onkeyup="check()" required ><br>
					<span id='Pwd_msg'></td>
				</tr>
				<tr>
					<td>Status : </td>
					<td><input type="radio" name="status" value="active"  checked="checked"> Active
					<input type="radio" name="status" value="inactive" > Inactive</td>
				</tr>
			</table>

					<hr id="hrid" style="margin-top:7px;">
					<input type="hidden" name="AccID" value="<%=acc.getAccID()%>">
					<input type="hidden" name="empID" value="<%=acc.getEmpID()%>">
					<input type="submit" value="Update Account" class="submitbutton">


			</form>
			<form method="POST" action="${pageContext.request.contextPath}/DeleteAccountServlet">
					<input type="hidden" name="AccID" value="<%=acc.getAccID()%>">
					<input type="submit" value="Delete Account" class="deletebutton" onclick="return confirm('Are you sure you want to delete?')">
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