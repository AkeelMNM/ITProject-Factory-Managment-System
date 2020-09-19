<%@page import="com.fms.model.Account"%>
<%@page import="fms.HR.service.AccountServiceImpt"%>
<%@page import="fms.HR.service.AccountService"%>
<%@page import="com.fms.model.Employee"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="fms.HR.service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Home & Login/Home_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/EmployeeScript.js"></script>

<style type="text/css">

	table {
	  border-collapse: collapse;
	  width: 96%;
	  float:left;
	}
	
	td {
	  text-align: left;
	  padding: 12px;
	}
	th{
	  text-align: left;
	  padding: 6px;
	}
	
	tr:nth-child(even){background-color: #f2f2f2}
	
	th {
	  background-color:#2c2c2c;
	  color: white;
	}

#Userlogo2
{
		display:block;
		width:80px;
		height:80px;
		border-radius: 50%;
		float:left;
		margin-left:725px;
		margin-top:30px;
}


</style>

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
							  <button onclick="myFunction()" class="dropbtn">User Name</button>
									  <div id="myDropdown" class="dropdown-content">
											<a href="#home">View Profile</a>
											<a href="#about">Logout</a>
									  </div>
					</div>
				</div>
						<img src="${pageContext.request.contextPath}/Images_UserProfile/AB.jpg" alt="UserLogo" id="Userlogo">								

</div>
<div style="float:left; width:100%; margin-top:-4px"><hr></div>
<div id="bodyDiv">
<h2>User Profile  </h2>
		<!-- Content Part -->
		
		<%
			String EmployeeID = "E001";
			
			//Accsessing the Cookie
			/*Cookie[] cookies = request.getCookies();
			for(Cookie aCookie : cookies){
				if(aCookie.getName().equals("employeeid"))
				{
					EmployeeID = aCookie.getValue();
				}
			}*/
			
			AccountService acservice = new AccountServiceImpt();
			String ACCID = acservice.getAccountID(EmployeeID);
			Account ac = acservice.getAccountByID(ACCID);
			
			
		%>
	<div>
			<img src="<%=ac.getProfileImage()%>" alt="UserLogo" id="Userlogo2">
			<form action="${pageContext.request.contextPath}/UploadUserImageServlet" method="post" enctype="multipart/form-data" >
 					Select<input type="file" name="file" /><br>
 					<input type="hidden" name="Accid" value="<%=ACCID%>">
 					<input type="hidden" name="empid" value="<%=EmployeeID%>">
 					<input type="submit" value="upload" />
			</form>
		</div>
		  
		<%
			//get the employee details
			EmployeeService  empservie = new EmployeeServiceImpt();
			Employee emp = empservie.getEmployeeByID(EmployeeID);
			
			request.setAttribute("employee", emp);
		%>

				<table>
					<tr>
						<td>Employee Name</td>
						<td> <%=emp.getName() %> </td>
						<td>NIC</td>
						<td> <%=emp.getNIC() %> </td>
					</tr>
					<tr>
						<td>Job Title</td>
						<td> <%=emp.getJobTitle() %> </td>
						<td>Phone Number</td>
						<td> <%=emp.getContactNo() %>  </td>
					</tr>
					<tr>
						<td>Address</td>
						<td> <%=emp.getAddress() %> </td>
						<td>Joint Date</td>
						<td> <%=emp.getJointDate() %> </td>
					</tr>
					<tr>
						<td>Gender</td>
						<td> <%=emp.getGender() %> </td>
					</tr>
					<tr>
						<td>Date of birth</td>
						<td> <%=emp.getDOB() %> </td>
					</tr>
					<tr>
						<td>Marital Status</td>
						<td> <%=emp.getMaritalStatus() %> </td>
					</tr>
					
				</table>


		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</div>

</div>
<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>
</html>