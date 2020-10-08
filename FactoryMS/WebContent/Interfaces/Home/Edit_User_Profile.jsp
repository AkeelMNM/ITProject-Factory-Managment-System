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
	  width: 60%;
	  float:left;
	}
	
	td {
	  text-align: left;
	  padding: 9px;
	  
	}
	th{
	  text-align: left;
	  padding: 5px;
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

}

/* Change background color of submit button on hover */
.changebutton:hover {
  background-color: #434343;
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
<h2 style="margin-top:5px">Edit User Profile  </h2>
		<!-- Content Part -->
		
		<%
			if((String)request.getAttribute("Passmsg") == "PT"){
				%><script type="text/javascript">alert("Password Changed Successfully")</script>
			<%}else if((String)request.getAttribute("Perrmsg") == "PF"){
				%><script type="text/javascript">alert("Old Password Not Matching")</script>
			<%
			}else if((String)request.getAttribute("Epassmsg") == "ET"){
					%><script type="text/javascript">alert("Email Changed Successfully")</script>
			<%}else if((String)request.getAttribute("Efailmsg") == "EF"){
					%><script type="text/javascript">alert("Old Email Not Matching")</script>
			<%}else if((String)request.getAttribute("upmsg") == "IM"){
				%><script type="text/javascript">alert("Image Uploaded Successfully")</script>
			<% }%>
	<div>
	<table style=" margin-left:10px; margin-top:-10px;">
	<tr>
		<th colspan="3">Upload Profile Picture</th>
				</tr>
		<form method="POST" action="${pageContext.request.contextPath}/UpdateUserProfileServlet" enctype="multipart/form-data">		
 			<tr>
 					<td>Select <input type="file" name="file" /></td>
 					<td colspan="2"><input type="submit" value="Upload" name="img" class="changebutton"></td>
			</tr>
				<tr>
					<th colspan="2">Change Email</th>
				</tr>
				<tr>
				<input type="hidden" name ="empid" value="<%=(String)session.getAttribute("uid")%>">
					<td>Enter Existing Email:</td>
					<td><input type="text" name="oldemail" size="55"> </td>
				</tr>
				<tr>
					<td>Enter New Email:</td>
					<td colspan="2" ><input type="text" name="email" size="55" ></td>
					
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Change Email" name="getemail" class="changebutton"></td>
				</tr>
				<tr>
					<th colspan="2">Change Password</th>
				</tr>
				<tr>
					<td>Enter Existing Password:</td>
					<td colspan="2"><input type="password" name="oldpassword" size="55" ></td>
				</tr>
				<tr>
					<td>Enter New Password:</td>
					<td colspan="2"><input type="password" name="password" id="pwd" size="55" ></td>
				</tr>
				<tr>
					<td>Re-enter Password : </td>
					<td colspan="2"><input type="password" name="repassword" id="confirm_pwd" size="55" onkeyup="check()"><br>
					<span id='Pwd_msg'></td>
				</tr>
				<tr>	
					<td colspan="2"><input type="submit" value="Change Password" name ="pass" class="changebutton"></td>
			</form>
			</tr>
			</table>
			

</div>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->



</div>
<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>
</html>