<%@page import="fms.HR.service.SearchServieImpt"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="com.fms.model.Employee"%>
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
				  <li><a class="menu" href="#">Manage Employee</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Jobs.jsp">Manage Jobs</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Performance_Tracking.jsp">Employee Performance Tracking</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Accounts.jsp">Manage Account</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Leave.jsp">Manage Employee Leaves</a></li>
		</ul>

<div id="bodyDiv">
		
		<!-- Body Part -->

		<div class ="left">

		<label id="insertTit">INSERT FORM</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/AddEmployeeServlet">
		<table class="form">
				<tr>
					<td>Employee Name : </td>
					<td><input type="text" name="name" size="55" required></td>
				</tr>
				<tr>
					<td>Date of birth : </td>
					<td><input type="Date" name="DOB"  required></td>
				</tr>
				<tr>
					<td>NIC : </td>
					<td><input type="text" name="NIC" size="55" required pattern="[0-9]{9}[v|V]|[0-9]{12}"></td>
				</tr>
				<tr>
					<td>Gender : </td>
					<td><input type="radio" name="gender" value="Male"  checked="checked"> Male
					<input type="radio" name="gender" value="Female" > Female</td>
				</tr>
				<tr>
					<td>Marital Status : </td>
					<td><input type="radio" name="MaritalStatus" value="Single" checked="checked"> Single	
					<input type="radio" name="MaritalStatus" value="Married"> Married</td>
				</tr>
				<tr>
					<td>Contact Number : </td>
					<td><input type="text" name="PhoneNo"  size="55" required pattern="[0-9]{10}" ></td>
				</tr>
				<tr>
					<td>Email : </td>
					<td><input type="text" name="email"  size="55" required pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A_Za-z]{2,3}" ></td>
				</tr>
				<tr>
					<td>Address : </td>
					<td><textarea rows="3" cols="55" name="Address"  required></textarea></td>
				</tr>
				<tr>
					<td>Job Title : </td>
					<td>
						<select  name="job" style="width: 250px;" required> 
								<option> --Select Job-- </option> 
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
				</tr>
				<tr>
					<td >Joint Date : </td>
					<td><input type="date" name="Joint_date" required></td>
				</tr>
				<tr>
					<td>Qualification : </td>
					<td><textarea rows="3" cols="55" name="qualification" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="Reset" class="resetbutton">
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
						<th >Action</th>
				</tr>
				<%
				EmployeeService empservice = new EmployeeServiceImpt();
				ArrayList<Employee> employeeList = new ArrayList<Employee>();
				
				String data = request.getParameter("search");
				if(data != null){
					SearchServieImpt se =new SearchServieImpt();
					employeeList = se.searchEmployee(data);
				}
				else{
					employeeList = empservice.getEmployee();
				}
				
				for(Employee employee : employeeList)
				{
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
						<td class ="tData"><form method="POST" action="${pageContext.request.contextPath}/Interfaces/HR/HR_Update_Employee.jsp">
								<input type="hidden" name ="EID" value="<%=employee.getEmpID()%>">
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