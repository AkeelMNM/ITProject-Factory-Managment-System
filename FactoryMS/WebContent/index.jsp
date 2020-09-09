<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Home & Login/Home_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Home & Login/Home_Script.js"></script>
<style>

.button {

  background-color:#E85A4F;
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  font-size: 14px;
  transition: 0.3s;
  width:100%;
  size:10%;
  cursor:pointer;
  margin-top:5px;
  
}
/* Change background color of buttons on hover */
.button:hover {
  background-color: #0299a6;
}

/* Create an active/current "tab button" class */
.button button.active {
  background-color: #ccc;
}
.headdiv
{
	float:left;
	width:100%;
	height:20%;
	
	
}
.logindiv
{
	float:left;
	width:755px;
	height:500px;
	
	
	
	
}
.loginform
{
	float:left;
	width:30%;
	height:70%;
	margin-top:70px;
	margin-left:540px;
	box-shadow: 5px 5px 5px #888888;
	background: #def2f1;
	
}
.descdiv
{
	float:left;
	width:49%;
	height:500px;
	
	
}
.vl 
{
	  border-left: 2px solid white;
	  height: 500px;
	  float:left;
	  
	  
}
.inputtype {width:95%;}
table{width:100%;}

h2
{
	font-family:'Gabriela';
	font-size:50px;
	text-align:center;
}
h3
{
	font-family:'Gabriela';
	font-size:25px;
	text-align:center;
}
tr{width:100%;}

input[type="text"]{ padding: 10px 10px; line-height:5px; border: 1.5px solid #555; }
input[type="password"]{ padding: 10px 10px; line-height:5px; border: 1.5px solid #555; }
input[type="submit"]{ padding: 10px 10px; line-height:15px; }

.tbltd
{
	font-size:20px;
	padding-top:10px;
	text-align:left;
}
#tdbutton{padding-top:20px;}
.tdsp{padding-top:5px;}

.footer
{
	width:100%;
	color:white;
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
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


<div id="bodyDiv">
		
		<!-- Body Part -->

		<%
				
				//Accsessing the Cookie
				/*Cookie[] cookies = request.getCookies();;
				String EmployeeID = null;
				String AttendanceID;
				for (Cookie aCookie : cookies) {
					if (aCookie.getName().equals("employeeid"))
					{
						EmployeeID = aCookie.getValue();
					}
				}
				
					AttendanceService attendanceService = new AttendanceServiceImpt();
					ArrayList<Attendance> attendanceList = attendanceService.getAttendance(); //Getting Employees All Attendance*/
					
		%>
		
		 
		<div  class="loginform">
		<h3><u>LOGIN</u></h3>
				<form method="POST" action="LoginServlet">
				<table>
						<tr>
							 <td class="tbltd">Username</td>
						</tr>
						
						<tr >
							 <td class="tdsp"><input type ="text" name ="username" placeholder="Email Address" class="inputtype"></td>
						</tr> 
						<tr>
							<td class="tbltd">Password</td>
						</tr>
						
						<tr>
							<td class="tdsp"><input type="password" name="password" placeholder="Password" class="inputtype"></td>
						</tr>
						
						<tr>
							<td id="tdbutton"><input type="submit" value="Sign in" class="button"></td>
						</tr>
						<%
							if(request.getAttribute("result") == "NoResult"){
						%>
						<tr>
						<td>Username or Password is Invalid</td>
						</tr>
						<%
							}
						%>
				</table>
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