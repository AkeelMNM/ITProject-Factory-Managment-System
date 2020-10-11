
<%@page import="fms.HR.service.E_LeaveServiceImpt"%>
<%@page import="fms.HR.service.E_LeaveService"%>
<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="fms.HR.service.AccountServiceImpt"%>
<%@page import="fms.HR.service.AccountService"%>
<%@page import="fms.HR.service.PerformanceTrackingServiceImpt"%>
<%@page import="fms.HR.service.PerformanceTrackingService"%>
<%@page import="com.fms.model.E_Leave"%>
<%@page import="com.fms.model.Job"%>
<%@page import="com.fms.model.Account"%>
<%@page import="com.fms.model.PerformanceTracking"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="com.fms.model.Employee"%>
<%@page import="fms.HR.service.SearchServieImpt"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Manager_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin&Manager_Script.js"></script>
</head>
<body>
<!-- Header Part -->
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
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Manager_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Manager.jsp">Purchase</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/index_maneger.html">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/InventManager.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_View.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/reportUI.jsp">Exspense</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/Manager.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">HR Management</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_Report.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				<div class="vl"></div>
		<div class="search">
			<form action="" method="post">
				<input type="text" name="sdata"  id="se" placeholder="Search here......">
				<select name="db_tables" tabindex="10" id="sedr" required>
								<option> Select </option>
								<option value="Employee"> Employee </option>
								<option value="Perfomance_Tracking"> Performance Tracking </option>
								<option value="Account"> Accounts </option>
								<option value="Jobs"> Jobs </option>
								<option value="E_Leave"> Employee Leave </option>  
								
				</select>
				<input type="submit" value="Search" id="searchbutton">
			</form>
		</div>
		
		<div class ="table">
			<table class="view">
		<%
		String tname = null;
		String data = null;
		tname =request.getParameter("db_tables");
		data = request.getParameter("sdata");
		SearchServieImpt se =new SearchServieImpt();
		
		if("Employee".equals(tname)){
			
			ArrayList<Employee> employeeList = new ArrayList<Employee>();
			
			if(data == ""){
				EmployeeService empservice = new EmployeeServiceImpt();
				employeeList = empservice.getEmployee();
			}
			else{
				employeeList = se.searchEmployee(data);
			}
		%>
					<tr class="viewTr">

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
						
				</tr>
		<% 
				for(Employee employee : employeeList){
		%>
				 <tr class="viewTr">
						<td class ="tData"><%=employee.getName()%></td>
						<td class ="tData"><%=employee.getDOB()%></td>
						<td class ="tData"><%=employee.getNIC()%></td>
						<td class ="tData"><%=employee.getGender()%></td>
						<td class ="tData"><%=employee.getMaritalStatus()%></td>
						<td class ="tData"><%=employee.getEmail()%></td>
						<td class ="tData"><%=employee.getContactNo()%></td>
						<td class ="tData"><%=employee.getAddress()%></td>
						<td class ="tData"><%=employee.getJobTitle()%></td>
						<td class ="tData"><%=employee.getJointDate()%></td>
						<td class ="tData"><%=employee.getQualification()%></td>
					</tr>
		
		<%}
		}
		else if ("Perfomance_Tracking".equals(tname)){
			
			ArrayList<PerformanceTracking> PTList = new ArrayList<PerformanceTracking>();
			
			if(data == ""){
				PerformanceTrackingService PTservice = new PerformanceTrackingServiceImpt();
				PTList = PTservice.getPerformacneTracking();
			}
			else{
				PTList = se.searchPerformanceTracking(data);
			}
			
		%>
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
							
					</tr>
				
				<% for(PerformanceTracking pt : PTList){
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
						<td class ="tData"><%=pt.getPerformace()%></td>
						<td class ="tData"><%=pt.getDescription()%></td>
					</tr>
				<%
				}
		}
		else if ("Account".equals(tname)){
			
			ArrayList<Account> acList = new ArrayList<Account>();
			
			if(data == ""){
				
				AccountService acservice = new AccountServiceImpt();
				acList = acservice.getAccount();
			}
			else{
		 		acList = se.searchAccount(data);
				
			}
		%>
				<tr class="viewTr" id ="myHeader">
							<th >Employee Name</th>
							<th >Employee Mail</th>
							<th >Password</th>
							<th >Account Type</th>
							<th >Account Status</th>
							
					</tr>
					
				<% for(Account ac : acList){
				%>
				<tr class="viewTr">
						<td class ="tData" ><%=ac.getEmpName()%></td>
						<td class ="tData" ><%=ac.getUserName()%></td>
						<td class ="tData" ><%=ac.getPassword()%></td>
						<td class ="tData" ><%=ac.getAccType()%></td>
						<td class ="tData" ><%=ac.getStatus()%></td>
					</tr>
		<%
			}
		}
		else if ("Jobs".equals(tname)){
			
			ArrayList<Job> jobList = new ArrayList<Job>();
			
			if(data == ""){
				JobService jobservice = new JobServiceImpt();
				jobList =jobservice.getJob();
			}
			else{
				jobList = se.searchJob(data);
			}
			%>
			<tr class="viewTr" id ="myHeader">
				<th >Job Title</th>
				<th >Created Date</th>
				<th >Basic Salary</th>
				<th >Salary Paying Method</th>
				<th >ETF Rate</th>
				<th >EPF Rate</th>
				<th >Over Time Rate</th>
				
			</tr>
			<% for( Job job : jobList){
			%>
 				<tr class="viewTr">
						<td class ="tData"><%=job.getJobTitle()%></td>
						<td class ="tData"><%=job.getCreatingDate()%></td>
						<td class ="tData"><%=job.getBasicSalary()%></td>
						<td class ="tData"><%=job.getSalPayMethod()%></td>
						<td class ="tData"><%=job.getEtfRate()%></td>
						<td class ="tData"><%=job.getEpfRate()%></td>
						<td class ="tData"><%=job.getOtRate()%></td>
					</tr>
					
			
		<%}
		}
		else if ("E_Leave".equals(tname)){
			
			ArrayList<E_Leave> leaveList = new ArrayList<E_Leave>();
			
			if(data == ""){
				E_LeaveService leaveservice = new E_LeaveServiceImpt();
				leaveList = leaveservice.getLeave();
			}
			else{
				
				leaveList = se.searchLeave(data);
			}
			
			%>
				<tr class="viewTr" id ="myHeader">
						<th >Employee Name</th>
						<th >Date</th>
						<th >Month</th>
						<th >Status</th>
						
				</tr>
				
				<% for(E_Leave leave : leaveList){
				%>
				
				<tr class="viewTr">
						<td class ="tData" ><%=leave.getEmpName()%></td>
						<td class ="tData"><%=leave.getDate()%></td>
						<td class ="tData"><%=leave.getMonth()%></td>
						<td class ="tData"><%=leave.getLeave_Status()%></td>

				</tr>
				</table>
		<% }
		}
		else{
			%>
			<table style="height: 49%;" width="100%">
			<tbody>
			<tr>
			<td style="width: 12.5043%; text-align:center;">&nbsp;The Search Preview will be Displayed here</td>
			</tr>
			</tbody>
		</table>
		
		<%
		}
		%>
		
		</div>
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>


</html>