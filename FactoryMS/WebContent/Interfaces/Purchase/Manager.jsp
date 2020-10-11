<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>


.viewreport{
	background-color:#4d4d4d;
  color: white;
    height: 45px;
    width: 500px;

}

.genaratereport{
	background-color:#4d4d4d;
  color: white;
    height: 45px;
    width: 500px;

}
.title1{

font-family:'Gabriela';
	font-size:30px;
	color:  #0a5c54;
	padding-left:60px;
text-decoration-line: underline;

}



</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Manager_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>

</head>
<body>
<!-- Header Part -->
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
						<img src="UserPro.png" alt="UserLogo" id="Userlogo">								

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="#">Home
				<ul>
					  <li><a class="menu" href="#">Purchase</a></li>
					  <li><a class="menu" href="#">Production</a></li>
					  <li><a class="menu" href="#">Inventory</a></li>
					  <li><a class="menu" href="#">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="#">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">HR Management</a></li>
				  <li><a class="menu" href="#">Report</a></li>
		</ul>

<div id="bodyDiv">
<br>
	<label class="title1">PURCHASING REPORT</label>
	<br><br><br><br><br>
	
	
	
						<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp">
						<input type="submit" name="report" value="VIEW REPORT" size="40" class="viewreport"/> 
						
					</form>
					
					<br> <br>
							<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Purchase/FinalReport.jsp">
						<input type="submit" name="report" value="GENARATE REPORT" size="40" class="genaratereport"/> 
							
					</form>
						
						<!-- <input type="submit" value ="VIEW LEAF ORDER REORT"class="btnreset" href="${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp"/>  --> 
						
						
						
						
						
						
						
	<br><br><br><br><br><br><br><br><br><br><br>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>
</html>