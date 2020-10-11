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
						<select id="dep"  name="job" tabindex="1" style="width: 250px;" Disabled required> 
								<option value="<%=pt.getJobTitle()%>"><%=pt.getJobTitle()%></option> 
							</select>
					</td>
					
				</tr>
				<tr>
					<td for="dep">Employee Name : </td>
					<td>
						<select id="dep"  name="name" tabindex="2" style="width: 250px;" Disabled required> 
								<option value="<%=pt.getEmpName()%>"> <%=pt.getEmpName()%> </option> 
							</select>
					</td>
					
				</tr>
				<tr>
						<td>Month :</td>
						<td>
							<select name="month" style="width: 200px;" required> 
									<option value="<%=pt.getMonth()%>"> <%=pt.getMonth()%></option>
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
				<tr>
					<td>Date:</td>
					<td><input type="date" name="date" value="<%=pt.getDate()%>"  required></td>
				</tr>
				<tr>
					<td>Time in: </td>
					<td><input type="time" name="timein" tabindex="4" value="<%=pt.getTimeIn()%>" required></td>
					
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
			<table style="margin-left:450px;margin-top:-320px;">
				<tr>
					<td colspan="2" ><label style="font-weight:bold;">Performance Details</label><hr></td>
				</tr>
				<tr>
					<td>Performance : </td>
					<td>
						<select id="dep"  name="performance" tabindex="3" style="width: 250px;" required>
						<%if(pt.getPerformace().equals("1")){ %>  
								<option value="1" selected>Poor</option> <option value="2">Fair </option><option value="3">Average</option> <option value="4">Good</option> <option value="5">Excellent </option> 
						<%}else if(pt.getPerformace().equals("2")){ %>	
								<option value="1" >Poor</option> <option value="2" selected>Fair </option><option value="3">Average</option> <option value="4">Good</option> <option value="5">Excellent </option>
						<%}else if(pt.getPerformace().equals("3")){ %>	
								<option value="1" >Poor</option> <option value="2">Fair </option><option value="3" selected>Average</option> <option value="4">Good</option> <option value="5">Excellent </option>
						<%}else if(pt.getPerformace().equals("4")){ %>	
								<option value="1" >Poor</option> <option value="2">Fair </option><option value="3">Average</option> <option value="4" selected>Good</option> <option value="5">Excellent </option>
						<%}else if(pt.getPerformace().equals("5")){ %>	
								<option value="1" >Poor</option> <option value="2">Fair </option><option value="3">Average</option> <option value="4">Good</option> <option value="5" selected>Excellent </option>
						<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td>Description : </td>
					<td><textarea rows="5" cols="55" name="description" tabindex="5" required><%=pt.getDescription()%></textarea></td>
				</tr>
			</table><%for(int j=0;j<8;j++){ %><br><%} %>
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