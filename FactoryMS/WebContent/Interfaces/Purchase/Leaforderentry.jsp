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

#bodydiv{

 left: 30%;
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
	<h2 style="text-align:left">
			Leaf Order Entry 
			<hr>
		</h2>
		<!-- Body Part -->
				
				
				
				<form method="POST" action="${pageContext.request.contextPath}/AddLeafOrderEntry">

		<table>
		<br><br>
		
		<tr>
			<td>Date :</td>	
			<td><input type="date"  name="date"  ></td>
		</tr>
		
		 
			<tr><td>Supplier :</td>
			<td> <select name="name">        
                <option value="p">Willomson</option>
                <option value="b">Bandara</option>
                <option value="r">Ravi</option>
                <option value="w">William</option>
        </select></td>
		</tr>
		
		 <tr>
			<td >TeaLeaf Grade :</td>
			<td> <select name="grade">        
                <option value="p" >Best</option>
                <option value="b">Below Best</option>
                <option value="r">Poor</option>
            
        </select></td>
		</tr>
		
		<tr>
			<td>Quantity(KG) :</td>	
			<td><input type="text" name="quantity" ></td>
		</tr>
		
		<tr>
			<td>Price(Rs) :</td>	
			<td><input type="text" name="price" ></td>
		</tr>
		
		 <label name="paid"> <td>Paid?</td>	</label>
  		<td><input type="radio" id="paid" name="yes" value="yes">
  		<label for="male">Yes</label>
  		<input type="radio" id="paid" name="no" value="no">
  		<label for="female">No</label><br></td>
		</tr>
		
		
		
		
		
		
		
	
			<td><input type="submit" value ="Save" class="button1"/></td>
		
			<td><input type="reset" value ="Reset"class="button1" /> </td>
		
		</table>
		
		<br><br><br><br><br><br><br><br><br><br><br>
	</form>
			
				


<div class="tableview">



		<table border="1" cellpadding="12">
			<caption>
			<h3>Tea Leaf Details</h3>
			
				<input type="text" placeholder="Search..">
				<input type="submit" value ="Search" class="button1"/>
				
				<br><br>
			</caption>

			<tr>
				
				<th>Date</th>
				<th>Supplier</th>
				<th>Grade</th>

				<th>Quantity(Kg)</th>
				<th>Price</th>
				<th>Paid</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
 <tr>
				    <td>9/9/2020</td>
				
				    <td>Bandara</td>
				     <td>Best</td>
				    <td>30000</td>
				     <td>12</td>
				    <td>Yes</td>
			<td><input type="submit" value ="update" class="button1"/></td>
			<td><input type="submit" value ="delete"class="button1" /> </td>
			
			</tr>
			
			
			 <tr>
				    <td>10/9/2020</td>
				    
				    <td>William</td>
				     <td>Below Best</td>
				    <td>32600</td>
				    <td>11</td>
				    <td>No</td>
				   <td><input type="submit" value ="update" class="button1"/></td>
			<td><input type="submit" value ="delete"class="button1" /> </td>
			</tr>
		
		 
		</table>



</div>


		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>



	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>
</html>