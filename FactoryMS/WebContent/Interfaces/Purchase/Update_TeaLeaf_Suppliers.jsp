<%@page import="fms.Purchase.service.SupplierServiceImpt"%>
<%@page import="fms.Purchase.service.SupplierService"%>
<%@page import="com.fms.model.TeaLeaf_Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>
<style>
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

</style>
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
						<!--  <img src="UserPro.png" alt="UserLogo" id="Userlogo">		-->			
						
						<!-- ////////////////////////////////////////////////////// -->
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>"	>
												
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
				 <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Leaforderentry.jsp">Leaf Order Entry</a></li>
				  <li><a class="menu" href="#">Suppliers</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/AddPaymentToSuppliers.jsp">Payment to Suppliers</a></li>
				<!--   <li><a class="menu" href="#">Report</a></li> -->
				
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		
		<%
		
		String SupID =request.getParameter("SupplierID");
		
		SupplierService getSupplierByID =new SupplierServiceImpt();
		TeaLeaf_Supplier Suppplier =getSupplierByID.getTeaLeafSupplierByID(SupID);
		
		request.setAttribute("TeaLeaf_Supplier",Suppplier);

		%>
	<br>
		
		<label> Tea Leaf Supplier Update Form</label> 
			
				
		<form method="POST" action="${pageContext.request.contextPath}/UpdateTeaLeaf_Suppliers" style="margin-top:50px;">


		<table>

		 <tr>
			<td>Supplier Name :</td>	
			<td> <input type="text"  name="supname" size="55" value="<%=Suppplier.getName()%>">   </td>     
     
		<tr>
		
			<td>NIC:</td>
			<td><input type="text" name="nic"  size="55" value="<%=Suppplier.getNIC()%>"></td>
		</tr>
		<tr>
			<td>Contact NO:</td>
			<td><input type="text" name="contactno" size="55" value="<%=Suppplier.getContact_No()%>" ></td>
		</tr>
		<tr>
			<td>Address:</td>
			<td><input type="text" name="address" size="55" value="<%=Suppplier.getAddress()%>"></td>
		</tr>
		
		<tr>
			<td>License No:</td>
			<td><input type="text" name="licenseno"  size="55" value="<%=Suppplier.getLicense_No()%>"></td>
		</tr>
		<tr>
		
		
		<tr>
			<td>Estate:</td>
			<td><input type="text" name="estate"  size="55" value="<%=Suppplier.getEstate()%>"></td>
		</tr>
		<tr>
		
		
	
		
	<tr>	<br>
			<td><input type="submit" value ="Update" class="button1"/></td>
			<td><input type="hidden" name="SuppId" value ="<%=Suppplier.getSupID()%>"/></td>
		
			<td><input type="reset" value ="Reset"class="button2" /> </td>
		</tr>
		</table>
	</form>
			
				<br>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>		
				
		
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>




</body>
</html>