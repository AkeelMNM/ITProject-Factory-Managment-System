<%@page import="com.fms.model.Employee"%>
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
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Admin_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Add_TeaLeaf_Suppliers.jsp">Purchase</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/production.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/Add_Stock.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/addExp.jsp">Exspesne</a></li>
				</a></ul>
				</li>
				 <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Employee.jsp">Manage Employee</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Jobs.jsp">Manage Jobs</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Performance_Tracking.jsp">Employee Performance Tracking</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Accounts.jsp">Manage Account</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Leave.jsp">Manage Employee Leaves</a></li>
		</ul>

<div id="bodyDiv">
		
		<!-- Body Part -->

		<%		
					String AccID = null;
					if(request.getParameter("AID") != null){
						AccID = request.getParameter("AID");
					}
					else if (request.getAttribute("id") != null){
						AccID = (String)request.getAttribute("id");
					}
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
						<select id="dep"  name="acctype" style="width: 250px;" Disabled required> 
								<option value="<%=acc.getAccType()%>"> <%=acc.getAccType()%> </option>
						</select>
					</td>
				</tr>
				<tr>
					<td for="dep">Employee Name : </td>
					<td>
						<select id="dep"  name="name" style="width: 250px;" Disabled required>  
								<option value="<%=acc.getEmpName()%>"><%=acc.getEmpName()%> </option> 
							</select>
							
					</td>
				</tr>
				<tr>
					<td>Employee Email:</td>
					<%String ename = null;
						ename=(String)request.getAttribute("ename");
					if(ename !=null){
						EmployeeService empservice = new EmployeeServiceImpt();
						Employee e = empservice.getEmployeeByID(empservice.getEmployeeID(ename));
						%>
						<td><input type="text" name="email" size="40" Value ="<%=e.getEmail()%>"> <input type="submit" value="Get Email" name="getemail" class="datagenbutton"></td>
					<%}else{ %>
						<td><input type="text" name="email" Value ="<%=acc.getUserName()%>" size="40" > <input type="submit" value="Get Email" name="getemail"  class="datagenbutton"></td>
					<%} %>
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
					<% String type = null;
						type =acc.getStatus();
					if(type.equals("active")){%>
						<td><input type="radio" name="status" value="active" checked="checked" > Active
						<input type="radio" name="status" value="inactive" > Inactive</td>
					<%}else if (type.equals("inactive")){ %>
						<td><input type="radio" name="status" value="active" > Active
						<input type="radio" name="status" value="inactive" checked="checked" > Inactive</td>
					<%} %>
				</tr>
			</table>

					<hr id="hrid" style="margin-top:7px;">
					<input type="hidden" name="AccID" value="<%=acc.getAccID()%>">
					<input type="hidden" name="empID" value="<%=acc.getEmpID()%>">
					<input type="hidden" name="empName" value="<%=acc.getEmpName()%>"> <!-- To get the send the Name to servlet -->
					<input type="submit" value="Update Account" name ="Update" class="submitbutton">


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