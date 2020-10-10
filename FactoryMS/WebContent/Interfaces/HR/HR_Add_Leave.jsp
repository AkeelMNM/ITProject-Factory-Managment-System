<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="fms.HR.service.SearchServieImpt"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="com.fms.model.E_Leave"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.HR.service.E_LeaveServiceImpt"%>
<%@page import="fms.HR.service.E_LeaveService"%>
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
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Accounts.jsp">Manage Account</a></li>
				  <li><a class="menu" href="#">Manage Employee Leaves</a></li>
		</ul>

<div id="bodyDiv">
		
		<!-- Body Part -->

		<div class ="left">
		<br>
		<label id="insertTit">INSERT FORM</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/AddLeaveServlet" style="margin-top:50px;">
		<table class="form">
				
				<tr>
					<td style="text-align: center;">Date:</td>
					<%if((String) request.getAttribute("Date") != null){ %>
							<td><input type="date" name="date" value="<%=(String) request.getAttribute("Date")%>"></td>
					<%}else{ %>
							
							<td><input type="date" name="date"></td>
					<%} %>
				</tr>
				<tr>
					<td style="text-align: center;">Month : </td>
					<td>
						<select name="month" style="width: 200px;" required> 
								<%if((String) request.getAttribute("Month") != null){ %>
											<option value="<%=(String) request.getAttribute("Month")%>"><%=(String) request.getAttribute("Month")%></option>
								<%}else{ %>
									<option> --Select Month-- </option>
								<%} %>
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
					<td style="text-align: center;">Select Job:</td><td><select name="jobList"  class="reviewdr" required>
					<%String key =null;
						key = (String) request.getAttribute("jName");
						if(key !=null){ %>
								<option value="<%=key%>"><%=key%></option>
						<%}else{ %> 
									<option> --Select Title-- </option> 
									<%}
									JobService jobservice = new JobServiceImpt();
									ArrayList<String> jobList =jobservice.getJobName();
									
									for(String name : jobList)
									{
								%>
							
										<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>
					</select>
					<input type="submit" value="Get Employees" name="getJob" class="datagenbutton">
					</td>		
				</tr>
					<tr><td style="text-align: center; text-decoration: underline;">Employee Name</td>
					<td  style="text-align: center; text-decoration: underline;">Absent</td></tr>
				<%
					for(int i=0;i<7;i++){
				%>
				<tr>
					<td style="text-align: center">
					<select  name="name[]" style="width: 150px;">
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
					</td>
					<td style="text-align: center"><input type="checkbox"  name="absent[]" value="Absent" checked></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="2" ><input type="reset" value="Reset" class="resetbutton" style="margin-top:12px;">
					<input type="submit" value="Submit" name="CL" class="submitbutton" style="margin-top:12px;"></td>
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
						<th >Date</th>
						<th >Month</th>
						<th >Status</th>
						<th >Action</th>
				</tr>
				
				<%
				E_LeaveService leaveservice = new E_LeaveServiceImpt();
				ArrayList<E_Leave> leaveList = new ArrayList<E_Leave>();
				
				String data = request.getParameter("search");
				if(data != null){
					SearchServieImpt se =new SearchServieImpt();
					leaveList = se.searchLeave(data);
				}
				else{
					leaveList = leaveservice.getLeave();
				}
				
				for(E_Leave leave : leaveList)
				{
				%>
				
				<tr class="viewTr">
						<td class ="tData" ><%=leave.getEmpName()%></td>
						<td class ="tData" ><%=leave.getJobTitle()%></td>
						<td class ="tData"><%=leave.getDate()%></td>
						<td class ="tData"><%=leave.getMonth()%></td>
						<td class ="tData"><%=leave.getLeave_Status()%></td>
						<td><form method="POST" action="${pageContext.request.contextPath}/Interfaces/HR/HR_Update_Leave.jsp">
								<input type="hidden" name ="Date" value="<%=leave.getDate()%>">
								<input type="hidden" name ="umonth" value="<%=leave.getMonth()%>">
								<input type="hidden" name ="empJ" value="<%=leave.getJobTitle()%>">
								<input type="submit" value="Edit" class="editbutton" style ="margin-left:28px;">
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