<%@page import="fms.Purchase.service.Purchase_SearchServiceImpt"%>
<%@page import="fms.Purchase.service.Purchase_SearchService"%>
<%@page import="com.fms.model.TeaLeaf_Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.Purchase.service.SupplierServiceImpt"%>
<%@page import="fms.Purchase.service.SupplierService"%>
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
 background-color:#88dba0;
  color: white;
   height: 25px;
    width: 60px;
    
  

}
.button2{
 background-color: #e06653;
  color: white;
    height: 25px;
    width: 60px;

}
.button3{
 background-color: #289c96#f7025c;
  color: black;
   height: 25px;
    width: 60px;

}
.tableh{
 	background-color: #dbbc97;
  	color: black;
  	

}
.search{

 height: 20px;
    width: 500px;
  

}
.tabled{

background-color:#d6ab76;
}

.heading{

margin-left: 0;
text-decoration-line: underline;

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
				 <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Leaforderentry.jsp">Leaf Order Entry</a></li>
				  <li><a class="menu" href="#">Suppliers</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/AddPaymentToSuppliers.jsp">Payment to Suppliers</a></li>
				 <!--   <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp">Report</a></li>-->
				
		</ul>

<div id="bodyDiv">

		<!-- Body Part -->
				
				
				
				<form method="POST" action="${pageContext.request.contextPath}/AddTeaLeaf_Suppliers">



			<h2 class="heading" style="color:#596b70;" >Tea Leaf Suppliers </h2>
			<br>
		
		<table>
<br><br><br>
		
			 <tr>
			<td>Supplier Name :</td>	
			<td> <input type="text"  name="supname" size="40" required>   </td>  
			
			</tr> 
			<tr>
			<td>License No:</td>
			<td><input type="text"  name="licenseno" size="40" required ></td>
		</tr>  
     
		<tr>
			<td>Address:</td>
			<td><input type="text" name="address " size="40" required></td>
		</tr>
		
		<tr>
			<td>Estate:</td>
			<td><input type="text" name="estate"  size="40" required></td>
		</tr>
		<tr>
			<td>NIC:</td>
			<td><input type="text" name="nic" size="40" required></td>
		</tr>
		<tr>
			<td>Contact NO:</td>
			<td><input type="text" name="contactno" size="40" required></td>
			
		</tr>
	
		
		
		
			<tr>
			<td><input type="submit" value ="Save" class="btnsave"/></td>
		
			<td><input type="reset" value ="Reset"class="btnreset" /> </td>
		</tr>
			
		</table>
	</form>


			<div class="tableview">

<br>
		<table  cellpadding="12">
			<caption>
			<br>
			 
				<form action=""  method="POST" >	
					<input type="text" placeholder="Search.." class="search" name="supsearch">
				</form>
				
				<br><br>
			</caption>

			<tr class="tableh">
			
				
				<th>License No</th>
				<th>Supplier Name</th>
				<th>Address</th>
				<th>Estate</th>
				<th>NIC</th>
				<th>Contact No</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			
			
			<%
			
	
	SupplierService supservice= new SupplierServiceImpt();
	ArrayList<TeaLeaf_Supplier> supplierList=new ArrayList<TeaLeaf_Supplier>();
	
	String data=request.getParameter("supsearch");
	
	if(data != null) 
	{
		Purchase_SearchService purchasesearch=new Purchase_SearchServiceImpt();
		supplierList=purchasesearch.SearchTeaLeafSupplier(data);

	}
	
	
		else{
			
			supplierList=supservice.getSupplier();
		}
	
	
	
	
	for(TeaLeaf_Supplier supplier : supplierList)
	{

%>			
<tr class="tabled">
				    
				      <td><%=supplier.getLicense_No()%></td>
				      <td><%=supplier.getName()%></td>
				          <td><%=supplier.getAddress()%></td>
				            <td><%=supplier.getEstate()%></td>
				              <td><%=supplier.getNIC()%></td>
				              <td><%=supplier.getContact_No()%></td>
			
				    
			
			
			
			<td>
					<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Purchase/Update_TeaLeaf_Suppliers.jsp">
						<input type="hidden" name="SupplierID" value="<%=supplier.getSupID() %>" /> 
							<input type="submit" value="Edit" class="button1" />
					</form>
				</td>
				
				<td>
					<form method="POST" action="${pageContext.request.contextPath}/DeleteSupplier">
						<input type="hidden" name="SupplierID" value="<%=supplier.getSupID() %>" /> 
							<input type="submit" value="Delete" class="button2" />
					</form>
				</td>
			
			
			
			
			</tr>
			<%} %>
	
			
			
		</table>

</div>
	
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>		
				
		
				
	
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>



</body>
</html>