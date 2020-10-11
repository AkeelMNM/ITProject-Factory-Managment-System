<%@page import="com.fms.model.Job"%>
<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
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
					String jobID = request.getParameter("JID");
					JobService JS = new JobServiceImpt();
					Job job = JS.getJobByID(jobID);

		%>
		<div class ="left">
		<br><br>
		<label id="insertTit" style="margin-right:80%;">Job Details Update Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/UpdateJobServlet">
		<table class="form" style="margin-top:3%;">
				<tr>
					<td>Job Title :</td>
					<td><input type="text" name="jobtitle" size="55" value="<%=job.getJobTitle()%>" required></td>
				</tr>
				<tr>
					<td>Creating Date : </td>
					<td><input type="date" name="date" value="<%=job.getCreatingDate()%>" required></td>
				</tr>
				<tr>
					<td>Basic Salary : </td>
					<td><input type="text" name="salary" value="<%=job.getBasicSalary()%>" size="55" id ="bs" oninput="calc()" required ></td>
				</tr>
				<tr>
					<td>Salary Paying Method : </td>
					<td><input type="radio" name="salmethod" value="Monthly" checked="checked"> Monthly
					<input type="radio" name="salmethod" value="Daily" > Daily</td>
				</tr>
				<tr>
					<td>ETF Rate : </td>
					<td><input type="text" name="etf" size="55" value="<%=job.getEtfRate()%>" id ="fetf" required ></td>
				</tr>
				<tr>
					<td >EPF Rate : </td>
					<td><input type="text" name="epf" size="55" value="<%=job.getEpfRate()%>" id ="fepf" required></td>
				</tr>
				<tr>
					<td >Over Time Rate : </td>
					<td><input type="text" name="ot" size="55" value="<%=job.getOtRate()%>" required></td>
				</tr>
			</table>

					<hr id="hrid" style="margin-top:7px;">
					<input type="hidden" name="jobID" value="<%=job.getJobID()%>">
					<input type="submit" value="Update Job" class="submitbutton">

			</form>
			<form method="POST" action="${pageContext.request.contextPath}/DeleteJobServlet">
					<input type="hidden" name="jobID" value="<%=job.getJobID()%>">
					<input type="submit" value="Delete Job" class="deletebutton" onclick="return confirm('If you Wish to Remove This Data It Might Remove Other Datas that Referencing this Data \nAre you sure you want to delete?')">

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