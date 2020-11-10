<%@page import="fms.Purchase.service.SupplierServiceImpt"%>
<%@page import="fms.Purchase.service.SupplierService"%>
<%@page import="fms.Purchase.service.LeaforderentryServiceimpt"%>
<%@page import="fms.Purchase.service.LeaforderentryService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.Purchase.service.Purchase_SearchService"%>
<%@page import="fms.Purchase.service.Purchase_SearchServiceImpt"%>
<%@page import="fms.Purchase.service.LeaforderentryService"%>
<%@page import="fms.Purchase.service.LeaforderentryServiceimpt"%>
<%@page import="com.fms.model.TeaLeaves"%>
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

.button1{
 background-color: #756d70;
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
 background-color: #a18a87;
  color: black;

}
.search{

 height: 20px;
    width: 500px;
  

}

#new{
height: 20px;
width:150px;
  position: relative;
    
  

}




</style>







<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>

</head>

<body>
<!-- Header Part -->

<!-- ////////////////////////////////////////////////////// -->
<%
    if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }

%>

<!-- ////////////////////////////////////////////////////// -->



<div id="headDiv">
					<img src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" id="logo"> 
				<div id="name">
					<label id="title">Dehiwatta Tea Factory</label><br>
					<label id="address">Hapugahayatatenna,Handessa</label>
				</div>
				<div id="manage">
					<div class="dropdown">
						<!-- ////////////////////////////////////////////////////// -->	
					<button onclick="myFunction()" class="dropbtn"><%=(String)session.getAttribute("uname")%></button>
	 <div id="myDropdown" class="dropdown-content">
		<a href="${pageContext.request.contextPath}/Interfaces/Home/User_Profile.jsp">View Profile</a>
		<a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
	</div>
					
					
					</div>
				</div>
						<!-- <img src="UserPro.png" alt="UserLogo" id="Userlogo"> -->
						
						<!-- ////////////////////////////////////////////////////// -->
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>"	alt="UserLogo" id="Userlogo">
												
						<!-- ////////////////////////////////////////////////////// -->										

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Admin_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Employee.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/production.jsp">Production</a></li>
					  

					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/Add_Stock.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/addExp.jsp">Exspesne</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">Leaf Order Entry</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Add_TeaLeaf_Suppliers.jsp">Suppliers</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/AddPaymentToSuppliers.jsp">Payment to Suppliers</a></li>
				<!--   <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp">Report</a></li> -->
				
		</ul>
		
		
		

<div id="bodyDiv">
		<h2 class="heading" style="color:#596b70;" >Tea Leaf Order </h2>
		</h2>
		<!-- Body Part -->
				
				
				
				<form method="POST" action="${pageContext.request.contextPath}/AddLeafOrderEntry">

		<table>
		<br><br>
		
			<tr>
			<td>Date </td>	
			<td><input type="date"  name="date" size="45" required ></td>
		</tr> 
		
		
		
			
		<tr>
			
		
		 

			<td> Select Supplier Name </td><td><select name="supname"  id="new" required >
			<option> ---Supplier Name--- </option>
			<%
				SupplierService supservice =new SupplierServiceImpt();
			ArrayList<String> namelist=supservice.getallSupplierName();
			
				for(String name : namelist)
				{
					
			%>
		<option value="<%=name%>"> <%=name%> </option> 
			
			<%
			
				}
			
			%>
			
	
		 </select>	</td>
	
		
	
		
		<!--  	<tr><td>Supplier :</td>
		<td> <input type="text"  name="supname" size="50" required>   </td>    
		</tr> -->
		
		
		<tr>
			<td>Quantity(KG) </td>	
			<td><input type="text" name="quantity" size="50" required></td>
		</tr>
		
		<tr>
			<td>Unit Price(Rs) </td>	
			<td><input type="text" name="price" size="50" required></td>
		</tr>
		<tr>
		 <label name="paid" required> <td>Paid</td>	</label>
  		<td><input type="radio" id="paid" name="paid" value="yes"size="50"required>
  		<label for="male">Yes</label>
  		<input type="radio" id="paid" name="paid" value="no"required>
  		<label for="female">No</label><br></td>
  		
  		
		</tr>

	<tr>
			  <td><input type="submit" value ="Save" class="btnsave"></td> 
		
			  <td><input type="reset" value ="Reset"class="btnreset" > </td> 
			  
	</tr>
		
		</table>
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
	</form>
			
				


<div class="tableview">
<br>
		<table cellpadding="12" >
		<caption>
			<br>
			 
				<form action=""  method="POST" >	
					<input type="text" placeholder="Search.." class="search" name="teasearch">
				</form>
				
				<br><br>
			</caption>
		
		
			<tr class="tableh">
				
				
				<th>Date Of Order</th>
				<th>Name</th>
				<th>Quantity</th>
				
				<th>Paid</th>
				<th>Unit price</th>
				
				
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			
			
		<%
		
		
		
		LeaforderentryService leaforderentryservice= new LeaforderentryServiceimpt();
		ArrayList<TeaLeaves> tealeaveList=new ArrayList<TeaLeaves>();
		
		String data=request.getParameter("teasearch");
		
		if(data != null) 
		{
			Purchase_SearchService purchasesearch=new Purchase_SearchServiceImpt();
			tealeaveList=purchasesearch.SearchTeaLeaf(data);

		}
		
		
			else{
				
				tealeaveList=leaforderentryservice.getTealeaves();
			}	
	
	
	
	
		
	
	for(TeaLeaves tealeave : tealeaveList)
	{

%>	
<tr class="tabled">
			
			 		    <td><%=tealeave.getPDate()%></td>
				      <td><%=tealeave.getSupplier_Name()%></td>
				          <td><%=tealeave.getQuantity()%></td>
				        
				              <td><%=tealeave.getPaid()%></td>
				              <td><%=tealeave.getUnit_Price()%></td>
				              
			
				    
			
			
			
			<td>
					<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Purchase/LeaforderentryUpdate.jsp">
						<input type="hidden" name="TLID" value="<%=tealeave.getTLID() %>" /> 
							<input type="submit" value="Edit" class="button1" />
					</form>
				</td>
				
				<td>
					<form method="POST" action="${pageContext.request.contextPath}/DeleteLeafOrderEntry">
						<input type="hidden" name="TealeafId" value="<%=tealeave.getTLID() %>" /> 
							<input type="submit" value="Delete" class="button2" />
							
						
					</form>
				
				</td>
			
			
			</tr>
			<%} %> 
		
		
		</table>

</div>

<br><br><br><br><br><br><br><br><br><br>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

<br><br><br>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</body>
</html>