<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.button1{
 background-color: #706a69;
  color: white;
 height: 50px;
  width: 10%;
  
}

.button2{

 height: 50px;
  width: 45%;
}


.center {
  margin: auto;
  width: 50%;
  padding: 10px;
}
#bodyDiv{

background-color:"powderblue;"
}
.search{

 height: 20px;
    width: 500px;
  

}


</style>



	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>




</head>

<body >
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
				  <li><a class="menu" href="#">Leaf Order Entry</a></li>
				  <li><a class="menu" href="#">Suppliers</a></li>
				  <li><a class="menu" href="#">Payment to Suppliers</a></li>
				  <li><a class="menu" href="#">Report</a></li>
		</ul>

<div id="bodyDiv" >
	
		<!-- Body Part -->
				
			<h2 >Purchase Report</h2>
			<hr>
			<input type="text" placeholder="Search.." class="search">
			
				<input type="submit" value ="Search" class="button1"/><br><br>
		<table class="center "border="1" cellpadding="12">
			<caption>
				
				
			</caption>

			<tr class="tablerowreport" >
				<th>Purchase Date</th>
				<th>Supplier ID</th>
				<th>Supplier Name</th>
				<th>Tea Leaf Grade</th>

				<th>Purchase Quantity(Kg)</th>
				<th>Price (Rs) </th>
				<th>Net Amount(Rs)</th>
			
			</tr>
			
		 <tr class="tr1">
				    <td>9/9/2020</td>
				    <td>P001</td>
				    <td>Smith</td>
				     <td>Best</td>
				    <td>30000</td>
				    <td>112</td>
				    <td>3360000.00</td>
			</tr>
			
			
			 <tr class="tr2">
				    <td>10/9/2020</td>
				    <td>P0011</td>
				    <td>Smith</td>
				     <td>Below Best</td>
				    <td>326</td>
				    <td>10</td>
				    <td>3260.00</td>
			</tr>
			
			
			
			 <tr  class="tr3">
				    <td>11/9/2020</td>
				    <td>P0021</td>
				    <td>Wilson</td>
				     <td>Poor</td>
				    <td>30000</td>
				    <td>10</td>
				    <td>300000.00</td>
			</tr>
			
			
			 <tr  class="tr4">
				    <td>15/9/2020</td>
				    <td>P00551</td>
				    <td>Smith</td>
				     <td>Best</td>
				    <td>30000</td>
				    <td>112</td>
				    <td>3360000.00</td>
			</tr>
			 <tr>
				    <td>21/9/2020</td>
				    <td>P0011</td>
				    <td>Smith</td>
				     <td>Best</td>
				    <td>30000</td>
				    <td>112</td>
				    <td>3360000.00</td>
			</tr>
			 <tr>
				    <td>22/9/2020</td>
				    <td>P0051</td>
				    <td>Smith</td>
				     <td>Best</td>
				    <td>30000</td>
				    <td>112</td>
				    <td>3360000.00</td>
			</tr>
			 <tr>
				    <td>23/9/2020</td>
				    <td>P0012</td>
				    <td>Smith</td>
				     <td>Best</td>
				    <td>30000</td>
				    <td>112</td>
				    <td>3360000.00</td>
			</tr>
			

			
	</table>
		
	
			
				
				
				
				
				
		
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->








</body>
</html>