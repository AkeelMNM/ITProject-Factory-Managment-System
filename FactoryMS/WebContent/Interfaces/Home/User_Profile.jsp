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
		<script src="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin&Manager_Script.js"></script>

<style type="text/css">

	table {
	  border-collapse: collapse;
	  width: 90%;
	  margin-left:50px;
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
	
.t1{
	border-collapse: collapse;
	 width: 12%;
	 margin-left:670px;
}
#Userlogo2
{
		display:block;
		width:80px;
		height:80px;
		border-radius: 50%;
		margin-left:40px;
		
}

.homebutton {  /* Home button */

  background-color:	#ed3330;
  border: none;
  color: white;
  padding: 7px ;
  text-align: center;
  text-decoration: none;
  font-size: 13px;
  transition: 0.3s;
  cursor:pointer;
  width:300px;
  margin-left:-1215px;
  margin-top:3px;

}

/* Change background color of Home button on hover */
.homebutton:hover {
  background-color: #434343;
}

.changebutton {  /* Update form table Update button */

  background-color:	#2B7A78;
  border: none;
  color: white;
  padding: 7px ;
  text-align: center;
  text-decoration: none;
  font-size: 13px;
  transition: 0.3s;
  cursor:pointer;
  width:150px;
  align:center;
  float:left;

}

/* Change background color of submit button on hover */
.changebutton:hover {
  background-color: #434343;
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
							  <button onclick="myFunction()" class="dropbtn"><%=(String)session.getAttribute("uname")%></button>
									  <div id="myDropdown" class="dropdown-content">
											<a href="${pageContext.request.contextPath}/Interfaces/Home/User_Profile.jsp">View Profile</a>
											<a href="${pageContext.request.contextPath}/Interfaces/Home/LogoutServlet">Logout</a>
									  </div>
					</div>
				</div>
						<img src="${pageContext.request.contextPath}/Images_UserProfile/AB.jpg" alt="UserLogo" id="Userlogo">								

</div>
<div style="float:left; width:100%; margin-top:-4px"><hr></div>
<div id="bodyDiv">
<%if("Administrator".equals((String)session.getAttribute("type"))){ %>
<a href = "${pageContext.request.contextPath}/Interfaces/Home/Admin_Home.jsp"><button class ="homebutton">Home</button></a>
<%}else if("Accountant".equals((String)session.getAttribute("type"))){ %>
<a href = "${pageContext.request.contextPath}/Interfaces/Home/Accountant_Home.jsp"><button class ="homebutton">Home</button></a>
<%}else if("Manager".equals((String)session.getAttribute("type"))){ %>
<a href = "${pageContext.request.contextPath}/Interfaces/Home/Manager_Home.jsp"><button class ="homebutton">Home</button></a>
<%} %>
<h2 style="margin-top:5px">User Profile  </h2>
		<!-- Content Part -->
		
		<%
			String EmployeeID = (String)session.getAttribute("uid") ;
			AccountService acservice = new AccountServiceImpt();
			String ACCID = acservice.getAccountID(EmployeeID);
			Account ac = acservice.getAccountByID(ACCID);
			
			
		%>
	<table class="t1">
		<tr>
			<td><img src="<%=ac.getProfileImage()%>" alt="UserLogo" id="Userlogo2"></td>
		</tr>
		<tr>
 			<td><a href = "${pageContext.request.contextPath}/Interfaces/Home/Edit_User_Profile.jsp"><button class="changebutton">Edit Profile</button></a></td>
		</tr>
	</table>
		  
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
						<td>Email</td>
						<td> <%=emp.getEmail() %> </td>
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