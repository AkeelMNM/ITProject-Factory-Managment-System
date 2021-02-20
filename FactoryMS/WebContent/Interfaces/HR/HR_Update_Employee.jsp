<%@page import="com.fms.model.Employee"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@page import="java.util.ArrayList"%>
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
				String EmployeeID = request.getParameter("EID");
				EmployeeService ES = new EmployeeServiceImpt();
				Employee emp = ES.getEmployeeByID(EmployeeID);
					
		%>
		<div class ="left">
		<br>
		<label id="insertTit">Employee Details Update Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/UpdateEmployeeServlet">
		<table class="form">
				<tr>
					<td>Employee Name : </td>
					<td><input type="text" name="name"  size="55" value="<%=emp.getName()%>" required></td>
					<td for="dep">Job Title : </td>
					<td>
						<select name="job"  style="width: 250px;"  required> 
								<option value="<%=emp.getJobTitle()%>"><%=emp.getJobTitle()%></option> 
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
					<td>Date of birth : </td>
					<td><input type="Date" name="DOB" value="<%=emp.getDOB()%>" required></td>
					
					<td >Joint Date : </td>
					<td><input type="date" name="Joint_date" value="<%=emp.getJointDate()%>" required></td>
					
				</tr>
				<tr>
					<td>NIC : </td>
					<td><input type="text" name="NIC" size="55" required pattern="[0-9]{9}[v|V]|[0-9]{12}" value="<%=emp.getNIC()%>"></td>
					<td>Qualification : </td>
					<td><textarea rows="4" cols="55" name="qualification" required><%=emp.getQualification()%></textarea></td>
					
				</tr>
				<tr>
					<td>Gender : </td>
					<% String gen = null;
						gen =emp.getGender();
					if(gen.equals("Male")){%>
						<td><input type="radio" name="gender" value="Male" checked="checked"> Male
						<input type="radio" name="gender" value="Female" > Female</td>
					<%}else if (gen.equals("Female")){ %>
						<td><input type="radio" name="gender" value="Male"> Male
						<input type="radio" name="gender" value="Female" checked="checked" > Female</td>
					<%} %>
				</tr>
				<tr>
					<td>Marital Status : </td>
					<% String mar = null;
						mar =emp.getMaritalStatus();
					if(mar.equals("Single")){%>
						<td><input type="radio" name="MaritalStatus" value="Single" checked="checked"> Single	
						<input type="radio" name="MaritalStatus" value="Married" > Married</td>
					<%}else if (mar.equals("Married")){ %>
						<td><input type="radio" name="MaritalStatus" value="Single" > Single	
						<input type="radio" name="MaritalStatus" value="Married" checked="checked"> Married</td>
					<%} %>
					
				</tr>
				<tr>
					<td>Contact Number : </td>
					<td><input type="text" name="PhoneNo" size="55" required pattern="[0-9]{10}" value="<%=emp.getContactNo()%>"></td>
					
				</tr>
				<tr>
					<td>Email : </td>
					<td><input type="text" name="email" size="55" required pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A_Za-z]{2,3}" value="<%=emp.getEmail()%>" ></td>
					
				</tr>
				<tr>
					<td>Address : </td>
					<td><textarea rows="4" cols="55" name="Address" required><%=emp.getAddress()%></textarea></td>
				</tr>
			</table>

					<hr id="hrid">
					<input type="hidden" name="EmployeeID" value="<%=emp.getEmpID()%>">
					<input type="hidden" name="jobID" value="<%=emp.getJobID()%>">
					<input type="submit" value="Update Employee" class="submitbutton">

			</form>
				
			<form method="POST" action="${pageContext.request.contextPath}/DeleteEmployeeServlet">
					<input type="hidden" name="EmployeeID" value="<%=emp.getEmpID()%>">
					<input type="submit" value="Delete Employee" class="deletebutton" onclick="return confirm('If you Wish to Remove This Data It Might Remove Other Datas that Referencing this Data \nAre you sure you want to delete?')">
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