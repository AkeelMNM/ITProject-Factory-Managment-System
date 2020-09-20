<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.tableview{

float:right;
  position: absolute;
    height: 200px;
    width: 400px;
    margin: -100px 0 0 -200px;
    top: 50%;
    right: 30%;
}


.sidenav{
border-left:2px solid black;
height:500px;
float:left;
margin-top:05px;

}

.button1{
 background-color: #706a69;
  color: white;

}

</style>



<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css">
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
				  <li><a class="menu" href="#">Leaf Order Entry</a></li>
				  <li><a class="menu" href="#">Suppliers</a></li>
				  <li><a class="menu" href="#">Payment to Suppliers</a></li>
				  <li><a class="menu" href="#">Report</a></li>
				
		</ul>

<div id="bodyDiv">

		<!-- Body Part -->
				
				
				
				<form method="POST" action="${pageContext.request.contextPath}/AddSuppliers">


<h2>
			Suppliers Insert Form
			<hr>
		</h2>
		<table>
	
	
	
	<tr>
			<td>Supplier ID:</td>
			<td><input type="text" " name="suppid" ></td>
		</tr>
		<tr>
			<td>License No:</td>
			<td><input type="text" " name="licenseno" ></td>
		</tr>
			 <tr>
			<td>Supplier Name :</td>	
			<td> <select name="supname">        
                <option value="p">Willomson</option>
                <option value="b">Bandara</option>
                <option value="r">Ravi</option>
                <option value="w">William</option>
        </select></td>
		</tr>
		
		
		<tr>
			<td>Address:</td>
			<td><input type="text" name="address "></td>
		</tr>
		
		<tr>
			<td>Estate:</td>
			<td><input type="text" name="estate" ></td>
		</tr>
		<tr>
			<td>NIC:</td>
			<td><input type="text" name="nic" ></td>
		</tr>
		<tr>
			<td>Contact NO:</td>
			<td><input type="text" name="contactno" ></td>
		</tr>
		
		
		
		
			<tr>
			<td><input type="submit" value ="Save" class="button1"/></td>
		
			<td><input type="reset" value ="Reset"class="button1" /> </td>
		</tr>
			
		</table>
	</form>


			<div class="tableview">


		<table border="1" cellpadding="12">
			<caption>
			
				<h2>Supplier Details</h2>
				
				<input type="text" placeholder="Search..">
				<input type="submit" value ="Search" class="button1"/>
				<br><br>
			</caption>

			<tr>
				<th>Supllier ID</th>
				<th>License No</th>
				<th>Supplier Name</th>
				<th>Address</th>
				<th>Estate</th>
				<th>NIC</th>
				<th>Contact No</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
<tr>
				    <td>S0025</td>
				      <td>L30</td>
				    <td>Smith</td>
				    <td>Kandy</td>
				    <td>Nuwaraeliya</td>
				    <td>N001254</td>
				      <td>0775844555</td>
				    
			<td><input type="submit" value ="update"class="button1"/></td>
			<td><input type="submit" value ="delete" class="button1" /> </td>
			
			</tr>
			
		<tr>
				    <td>S0025</td>
				      <td>L30</td>
				    <td>Smith</td>
				    <td>Kandy</td>
				    <td>Nuwaraeliya</td>
				    <td>N001254</td>
				      <td>0775844555</td>
				    
			<td><input type="submit" value ="update" class="button1"/></td>
			<td><input type="submit" value ="delete"class="button1" /> </td>
			
			</tr>
			
			
		</table>

</div>
	
				<br><br><br><br><br><br><br><br><br><br>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>		
				
		
				
	
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>



</body>
</html>