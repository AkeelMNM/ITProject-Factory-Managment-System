<%@page import="fms.HR.service.SearchServieImpt"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.HR.service.PerformanceTrackingServiceImpt"%>
<%@page import="fms.HR.service.PerformanceTrackingService"%>
<%@page import="com.fms.model.PerformanceTracking"%>
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
					  <li><a class="menu" href="${pageContext.request.contextPath}Interfaces/Production/production.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/Add_Stock.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/addExp.jsp">Exspesne</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Employee.jsp">Manage Employee</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Jobs.jsp">Manage Jobs</a></li>
				  <li><a class="menu" href="#">Employee Performance Tracking</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Accounts.jsp">Manage Account</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Leave.jsp">Manage Employee Leaves</a></li>
		</ul>

<div id="bodyDiv">
		
		<!-- Body Part -->
		<div class ="left">

		<label id="insertTit">INSERT FORM</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/AddPerfromanceTrackingServlet">
		<table class="form">
				<tr>
					<td >Job Title : </td>
					<td>
						<select name="job" tabindex="1" style="width: 250px;" required>
						<%String key =null;
							key = (String) request.getAttribute("jName");
						if(key !=null){ %>
								<option value="<%=key%>"><%=key%></option>
						<%}else{ %>
							<option> --Select Job-- </option>  
								<%}
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
				</tr>
				<tr>
					<td>Employee Name : </td>
					<td>
						<select name="name" tabindex="2" style="width: 250px;" required> 
								<option> --Select Name-- </option> 
								<%
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
					<td>Month :</td>
					<td><select name="month" style="width: 200px;" required> 
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
								<option value="October" selected> October </option>
								<option value="November"> November </option>
								<option value="December"> December </option>
												
						</select>&emsp;Date:&emsp;<input type="date" name="date" ></td>
				</tr>
				<tr>
					<td>Time in: </td>
					<td><input type="time" name="timein" tabindex="3" ></td>
				</tr>
				<tr>
					<td>Lunch in : </td>
					<td><input type="time" name="lunchin" tabindex="4" size="55" ></td>
				</tr>
				<tr>
					<td>Lunch out : </td>
					<td><input type="time" name="lunchout" tabindex="5" size="55" ></td>
				</tr>
				<tr>
					<td>Time out : </td>
					<td><input type="time" name="timeout" tabindex="6" size="55" ></td>
				</tr>
				<tr>
					<td >Over Time (hr) : </td>
					<td><input type="number" name="overtime" tabindex="7"  min="0" max="24" step=".1"></td>
				</tr>
				<tr>
					<td colspan="2" ><label style="font-weight:bold;">Performance Details</label><hr></td>
				</tr>
				<tr>
					<td>Performance : </td>
					<td>
						<select name="performance" tabindex="8" style="width: 250px;" required> 
								<option> --Select State-- </option>
								<option value="1">Poor</option>
								<option value="2">Fair </option>
								<option value="3" selected>Average</option>
								<option value="4">Good</option>
								<option value="5">Excellent </option> 
								
							</select>
					</td>
				</tr>
				<tr>
					<td>Description : </td>
					<td><textarea rows="4" cols="55" name="description" tabindex="9"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="Reset" class="resetbutton">
					<input type="submit" value="Submit" name="add" class="submitbutton"></td>
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
						<th >Job Title</th>
						<th >Month</th>
						<th >Date</th>
						<th >Time In</th>
						<th >Lunch In</th>
						<th >Lunch Out</th>
						<th >Time Out</th>
						<th >Over Time (hr)</th>
						<th >Performance</th>
						<th >Description</th>
						<th >Action</th>
				</tr>
				<%
				PerformanceTrackingService PTservice = new PerformanceTrackingServiceImpt();
				ArrayList<PerformanceTracking> PTList = new ArrayList<PerformanceTracking>();
				
				String data = request.getParameter("search");
				if(data != null){
					SearchServieImpt se =new SearchServieImpt();
					PTList= se.searchPerformanceTracking(data);
				}
				else{
					PTList = PTservice.getPerformacneTracking();
				}
				
				for(PerformanceTracking pt : PTList)
				{
				%>
				
				 <tr class="viewTr">
						<td class ="tData"><%=pt.getEmpName()%></td>
						<td class ="tData"><%=pt.getJobTitle()%></td>
						<td class ="tData"><%=pt.getMonth()%></td>
						<td class ="tData"><%=pt.getDate()%></td>
						<td class ="tData"><%=pt.getTimeIn()%></td>
						<td class ="tData"><%=pt.getLunchIn()%></td>
						<td class ="tData"><%=pt.getLunchOut()%></td>
						<td class ="tData"><%=pt.getTimeOut()%></td>
						<td class ="tData"><%=pt.getOvetTime()%></td>
						<td class ="tData">
						<%int starfull =Integer. parseInt(pt.getPerformace());
							int starempty = 5 - starfull;
							
							for(int i = 0;i < starfull;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/FullStar.png" alt="FullStar" id="FullStar">
						<%
							}
							for(int i = 0;i < starempty;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/EmptyStar.png" alt="EmptyStar" id="EmptyStar">
						<%
							}
						%>
						</td>
						<td class ="tData"><%=pt.getDescription()%></td>
						
						<td class ="tData"><form method="POST" action="${pageContext.request.contextPath}/Interfaces/HR/HR_Update_Performance_Tracking.jsp">
								<input type="hidden" name ="PTID" value="<%=pt.getEPTID()%>">
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