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
	
.th1{
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
<h2>Technical Support  </h2>
<h2>Contact Us  </h2>
		<!-- Content Part -->
		
		<div>
		
		<table style="height: 228px; width:554px; margin-left:485px; border: 1px solid black;">
		<tbody>
		<tr>
		<td style="width: 269.6px;" class="th1">Contect No</td>
		<td style="width: 269.6px;">123456789</td>
		</tr>
		<tr>
		<td style="width: 269.6px;" >Contact Email</td>
		<td style="width: 269.6px;" class="th1">123@gmail.com</td>
		</tr>
		<tr>
		<td style="width: 269.6px;" class="th1">System Design By</td>
		<td style="width: 269.6px;">SLIIT 2nd year 2nd Semester Students</td>
		</tr>
		</tbody>
		</table>
		
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