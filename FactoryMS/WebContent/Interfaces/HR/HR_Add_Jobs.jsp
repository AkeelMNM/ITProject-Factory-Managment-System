<%@page import="fms.HR.service.SearchServieImpt"%>
<%@page import="com.fms.model.Job"%>
<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="java.util.ArrayList"%>
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
				  <li><a class="menu" href="#">Manage Jobs</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Performance_Tracking.jsp">Employee Performance Tracking</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Accounts.jsp">Manage Account</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Leave.jsp">Manage Employee Leaves</a></li>
		</ul>

<div id="bodyDiv">
		
		<!-- Body Part -->

		<div class ="left">
		<br>
		<label id="insertTit">INSERT FORM</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/AddJobServlet" style="margin-top:50px;">
		<table class="form">
				
				<tr>
					<td>Job Title :</td>
					<td><input type="text" name="jobtitle" size="55" required></td>
				</tr>
				<tr>
					<td>Creating Date : </td>
					<td><input type="date" name="date"  required></td>
				</tr>
				<tr>
					<td>Basic Salary : </td>
					<td><input type="text" name="salary"  size="55" id ="bs" oninput="calc()" required ></td>
				</tr>		
				<tr>
					<td>Salary Paying Method : </td>
					<td><input type="radio" name="salmethod" value="Monthly" checked="checked"> Monthly
					<input type="radio" name="salmethod" value="Daily" tabindex="5" > Daily</td>
				</tr>
				<tr>
					<td>ETF Rate : </td>
					<td><input type="text" name="etf" size="55" id ="fetf" required ></td>
				</tr>
				<tr>
					<td >EPF Rate : </td>
					<td><input type="text" name="epf" size="55" id ="fepf" required></td>
				</tr>
				<tr>
					<td >Over Time Rate : </td>
					<td><input type="text" name="ot" size="55" required></td>
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
			<form action="" method="post">
				<input type="text" name="search" id="se" placeholder="search here.......">
			</form>
		</div>
		
		<div class ="table">

			<table class="view">
				<tr class="viewTr" id ="myHeader">
						<th >Job Title</th>
						<th >Created Date</th>
						<th >Basic Salary</th>
						<th >Salary Paying Method</th>
						<th >ETF Rate</th>
						<th >EPF Rate</th>
						<th >Over Time Rate</th>
						<th >Action</th>
				</tr>
				<%

					JobService jobservice = new JobServiceImpt();
					ArrayList<Job> jobList = new ArrayList<Job>();
					
					String data = request.getParameter("search");
					if(data != null){
						SearchServieImpt se = new SearchServieImpt();
						jobList = se.searchJob(data);
					}
					else{
						jobList =jobservice.getJob();
					}
					
					for( Job job : jobList)
					{
				%>
 				<tr class="viewTr">
						<td class ="tData"><%=job.getJobTitle()%></td>
						<td class ="tData"><%=job.getCreatingDate()%></td>
						<td class ="tData"><%=job.getBasicSalary()%></td>
						<td class ="tData"><%=job.getSalPayMethod()%></td>
						<td class ="tData"><%=job.getEtfRate()%></td>
						<td class ="tData"><%=job.getEpfRate()%></td>
						<td class ="tData"><%=job.getOtRate()%></td>

						<td class ="tData"><form method="POST" action="${pageContext.request.contextPath}/Interfaces/HR//HR_Update_Jobs.jsp">
								<input type="hidden" name ="JID" value="<%=job.getJobID()%>">
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