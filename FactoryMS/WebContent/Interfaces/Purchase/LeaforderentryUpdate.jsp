<%@page import="fms.Purchase.service.LeaforderentryServiceimpt"%>
<%@page import="fms.Purchase.service.LeaforderentryService"%>
<%@page import="com.fms.model.TeaLeaves"%>


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
#bodyDiv{

height: 100%
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
						<!-- <img src="UserPro.png" alt="UserLogo" id="Userlogo">			 -->
						
						<!-- ////////////////////////////////////////////////////// -->
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>" alt="UserLogo" id="Userlogo">
												
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
				 <!--   <li><a class="menu" href="#">Report</a></li>-->
				
		</ul>
		
		
		

<div id="bodyDiv">
	<h2>
			Leaf Order Entry Update Form
			<hr>
		</h2>
		<!-- Body Part -->
		
		
		<%
		
		String TLID =request.getParameter("TLID");
		
		LeaforderentryService getTeaLeafByID =new LeaforderentryServiceimpt();
		TeaLeaves tealeaves =getTeaLeafByID.getTeaLeafByID(TLID);
		
		request.setAttribute("TeaLeaves", tealeaves);

		%>
				
				
				
				<form method="POST" action="${pageContext.request.contextPath}/UpdateLeafOrderEntry" style="margin-top:50px;">


		<table>

		
		
		
		<td>Supplier Name:</td>
			<td><input type="text" name="supname" size="55" value="<%=tealeaves.getSupplier_Name()%> " disabled ></td>
		</tr>
		<tr>
			<td>Quantity(KG):</td>
			<td><input type="text" name="quantity" size="55" value="<%=tealeaves.getQuantity()%>"></td>
		</tr>
		
		<tr>
			<td>Unit Price(Rs) :</td>
			<td><input type="text" name="price"  size="55" value="<%=tealeaves.getUnit_Price()%>"></td>
		</tr>
		<tr>
			<tr>
		 <label name="paid" value="<%=tealeaves.getPaid()%>"> <td>Paying?</td>	</label>
  		<td><input type="radio" id="paid" name="paid" value="yes"size="50">
  		<label for="male">Yes</label>
  		<input type="radio" id="paid" name="paid" value="no">
  		<label for="female">No</label><br></td>
		</tr>
  			
  				<td>Date:</td>
			<td><input type="text" name="date"  size="55" value="<%=tealeaves.getPDate()%>"></td>
		</tr>
		<tr>
			</tr>
		
	
		<tr>
		
		
	
		
	<tr>	<br>
			<td><input type="submit" value ="Update" class="button1"/></td>
			<td><input type="hidden" name="TLID" value ="<%=tealeaves.getTLID()%>"/></td>
		
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


</body>
</html>