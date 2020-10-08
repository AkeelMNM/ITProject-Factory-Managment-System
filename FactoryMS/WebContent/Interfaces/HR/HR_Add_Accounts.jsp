<%@page import="com.fms.model.Employee"%>
<%@page import="fms.HR.service.SearchServieImpt"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="com.fms.model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.HR.service.AccountServiceImpt"%>
<%@page import="fms.HR.service.AccountService"%>
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
							  <button onclick="myFunction()" class="dropbtn"><%=(String)session.getAttribute("uname")%></button>
									  <div id="myDropdown" class="dropdown-content">
											<a href="${pageContext.request.contextPath}/Interfaces/Home/User_Profile.jsp">View Profile</a>
											<a href="${pageContext.request.contextPath}/Interfaces/Home/LogoutServlet">Logout</a>
									  </div>
					</div>
				</div>
						<img src="${pageContext.request.contextPath}/Images_UserProfile/AB.jpg" alt="UserLogo" id="Userlogo">								

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Admin_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="#">Purchase</a></li>
					  <li><a class="menu" href="#">Production</a></li>
					  <li><a class="menu" href="#">Inventory</a></li>
					  <li><a class="menu" href="#">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="#">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Employee.jsp">Manage Employee</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Jobs.jsp">Manage Jobs</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Performance_Tracking.jsp">Employee Performance Tracking</a></li>
				  <li><a class="menu" href="#">Manage Account</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Leave.jsp">Manage Employee Leaves</a></li>
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
		
		<form method="POST" action="${pageContext.request.contextPath}/AddAccountServlet" style="margin-top:50px;">
		<table class="form">
				
				<tr>
					<td >Account Type : </td>
					<td>
						<select id="AccName"  name="acctype" style="width: 250px;" > 
						<%String key =null;
							key = (String) request.getAttribute("jName");
						if(key !=null){ %>
								<option value="<%=key%>"><%=key%></option>
						<%}else{ %>
						<option> --Select Type-- </option>
						<%} %>
								<option value="Manager"> Manager </option>
								<option value="Administrator"> Administrator </option>
								<option value="Accountant"> Accountant </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Employee Name : </td>
					<td>
						<select  name="name" style="width: 250px;" id="emName" >
						<%String ename =null;
							ename =(String)request.getAttribute("ename");
						if(ename !=null){ %> 
								<option value="<%=ename%>"><%=ename%></option>
						<%}else{ %>
								<option> --Select Name-- </option>
								<%}
									EmployeeService empservice= new EmployeeServiceImpt();
									ArrayList<String> nameList =empservice.getAllEmployeeNameByJobTitle(key);
									
									for(String name : nameList)
									{
								%>
							
								<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>
							</select>
							<input type="submit" value="Get Employees" name="getJob" class="datagenbutton"> <!-- onclick="getEmpNameByJob();" -->
					</td>
				</tr>
				<tr>
					<td>Employee Email:</td>
					<%if(ename !=null){
						Employee e = empservice.getEmployeeByID(empservice.getEmployeeID(ename));
						%>
						<td><input type="text" name="email" size="40" Value ="<%=e.getEmail()%>"> <input type="submit" value="Get Email" name="getemail" class="datagenbutton"></td>
					<%}else{ %>
						<td><input type="text" name="email" size="40" > <input type="submit" value="Get Email" name="getemail"  class="datagenbutton"></td>
					<%} %>
				</tr>
				<tr>
					<td>Enter Password:</td>
					<td><input type="password" name="password" id="pwd" size="55" ></td>
				</tr>
				<tr>
					<td>Re-enter Password : </td>
					<td><input type="password" name="repassword" id="confirm_pwd" size="55" onkeyup="check()"><br>
					<span id='Pwd_msg'></td>
				</tr>
				<tr>
					<td>Status : </td>
					<td><input type="radio" name="status" value="active"  checked="checked"> Active
					<input type="radio" name="status" value="inactive" > Inactive</td>
				</tr>
				
				<tr ><td colspan="2" ></td></tr>
				<tr ><td colspan="2" ></td></tr>
				<tr ><td colspan="2" ></td></tr>
				<tr >
					<td colspan="2" ><input type="reset" value="Reset" class="resetbutton">
					<input type="submit" value="Create" name="CAccount" class="submitbutton"></td>
				</tr>
			</table>
			</form>
		</div>
		
<div class="vl"></div>
		<div class="search">
			<form action="" method="post">
				<input type="text" name="search" id="se" placeholder="search here.......">
			</form>
		</div>
		
		<div class ="table">

			<table class="view">
				<tr class="viewTr" id ="myHeader">
						<th >Employee Name</th>
						<th >Employee Mail</th>
						<th >Password</th>
						<th >Account Type</th>
						<th >Account Status</th>
						<th >Action</th>
				</tr>
				
				<%
				AccountService acservice = new AccountServiceImpt();
				ArrayList<Account> acList = new ArrayList<Account>();
				
				String data = request.getParameter("search");
				if(data != null){
					SearchServieImpt se =new SearchServieImpt();
					acList = se.searchAccount(data);
				}
				else{
					acList = acservice.getAccount();
				}
				
				for(Account ac : acList)
				{
				%>
				<tr class="viewTr">
						<td class ="tData" ><%=ac.getEmpName()%></td>
						<td class ="tData" ><%=ac.getUserName()%></td>
						<td class ="tData" >**********</td>
						<td class ="tData" ><%=ac.getAccType()%></td>
						<td class ="tData" ><%=ac.getStatus()%></td>
						<td class ="tData"><form method="POST" action="${pageContext.request.contextPath}/Interfaces/HR/HR_Update_Accounts.jsp">
								<input type="hidden" name ="AID" value="<%=ac.getAccID()%>">
								<input type="submit" value="Edit" class="editbutton">
						</form></td>
					</tr>
				<%
				}
				%>
						
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