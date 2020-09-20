<%@page import="com.fms.model.Sales_Revenue"%>
<%@page import="fms.Sales.service.Sales_RevenueServiceImpt"%>
<%@page import="fms.Sales.service.Sales_RevenueService"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Sales/Sales_Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Sales/Sales_Admin&Manager_Script.js"></script>
	
<meta charset="ISO-8859-1">
<title>Factory Sales</title>
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
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Factory Sales</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Sales Revenue.jsp">Sales Revenue</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Tea_Grade_price.jsp">Tea grade price</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Sales_Return.jsp">Sales Return</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
	
	<!-- Update Form -->
	<div Class="leftSideEdit">
	
		<%
			String RevenueID = request.getParameter("RevenueID");
		
			Sales_RevenueService getRevenueByID = new Sales_RevenueServiceImpt();
			Sales_Revenue Revenue = getRevenueByID.getSalesRevenueByID(RevenueID);
			
			request.setAttribute("Sales_Revenue", Revenue);
		%>
	
		<br>
		<label id="update">Sales Revenue Update Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/Update_SalesRevenueServlet" style="margin-top:50px;">
		<table class="form">
			
			<tr>
				<td>Date :</td>
				<td ><input type="date" name="RevDate" size="55" value="<%=Revenue.getDate() %>" ></td>
			</tr>
			<tr>
				<td>Sales Type :</td>
				<td><input type="text" name="Sales_Type" size="55" value="<%=Revenue.getSales_Type() %>" ></td>
			</tr>
			<tr>
				<td>Tea Garde :</td>
				<td><input type="text" name="Tea_Garde" size="55" value="<%=Revenue.getTea_Grade() %>" ></td>
			</tr>
			<tr>
				<td>Sold Quantity :</td>
				<td><input type="text" name="Sold_Qty" size="55" value="<%=Revenue.getSold_Quantity() %>" ></td>
			</tr>
			<tr>
				<td>Total Amount :</td>
				<td><input type="text" name="total_Amount" size="55" value="<%//=Revenue.getDate() %>" ></td>
			</tr>
			
			<tr > <input type="hidden" name="FactorySalesID" value="<%=Revenue.getFactory_SalesID()%>" /> 
				<td colspan="2" ></td></tr>
			<tr ><td colspan="2" ></td></tr>
			<tr ><td colspan="2" ></td></tr>
			<tr >
				<td></td>
				<td>
					<input type="submit" value="Update" class="submit_btn">
					<input type="hidden" name="RevID" value="<%=Revenue.getSales_RevenueID() %>" />
				</td>
		</form>
				<td>
					<form method="POST" action="${pageContext.request.contextPath}/Delete_SalesRevenueServlet">
						<input type="hidden" name="RevID" value="<%=Revenue.getSales_RevenueID() %>" />
						<input type="submit" value="Delete" class="delt_btn">
					</form>
				</td>
			</tr>
			
		</table>
		
		
	</div>			
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</body>
</html>