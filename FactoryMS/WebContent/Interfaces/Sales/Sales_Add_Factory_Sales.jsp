<%@page import="fms.Sales.service.Sales_SearchServiceImpt"%>
<%@page import="fms.Sales.service.Sales_SearchService"%>
<%@page import="com.fms.model.FactorySales"%>
<%@page import="fms.Sales.service.FactorySalesServiceImpt"%>
<%@page import="fms.Sales.service.FactorySalesService"%>
<%@page import="fms.Sales.service.Tea_Grade_PriceServiceImpt"%>
<%@page import="fms.Sales.service.Tea_Grade_PriceService"%>
<%@page import="com.fms.model.Tea_Grade_Price"%>
<%@page import="java.util.ArrayList"%>

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
				  <li><a class="menu" href="#">Factory Sales</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Sales Revenue.jsp">Sales Revenue</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Tea_Grade_price.jsp">Tea grade price</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Sales_Return.jsp">Sales Return</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
	
	<!-- insert Form -->
	<div Class="leftSide">
	
		<br>
		<label id="insert"> Insert Form </label>
		
		<form method="POST" action="${pageContext.request.contextPath}/Add_FactorySalesServlet" style="margin-top:50px;">
		<table class="form">
		
			<tr>
				<td>Date :</td>
				<td colspan="2"><input type="date" name="fs-Date" size="55" required></td>
			</tr>
			
			<tr>
				<td for="dep">Sales Type : </td>
				<td colspan="2">
					<select id="dep"  name="salesType"  required> 
						<option> --Select Type-- </option>
						<option value="Auction">Auction</option>
						<option value="Local Sales"> Local Sales </option>
						<option value="Factory"> Factory </option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>Tea Garde : </td>
				<td>Selling Quantity :</td>
				<td>Price (per kg) :</td>
			</tr>
			
			<tr>
				<td>
					<select id="dep"  name="TeaGradeID[]" required> 
						<option> --Select Grade-- </option>
						<%
							Tea_Grade_PriceService AllTeaGradePrice = new Tea_Grade_PriceServiceImpt();
							ArrayList<Tea_Grade_Price> TeaGradePriceList = AllTeaGradePrice.getTeaGradePrices();
							
							for(Tea_Grade_Price TGP : TeaGradePriceList)
							{
						%>
					
						<option value="<%=TGP.getTea_Grade_Price_ID() %>">  <%=TGP.getTea_Grade() %>  </option> 
						
						<%
							}
						%>
					</select>
				</td>
				<td> <input type="text" name="Selling_Qty[]"  required> </td>
				<td> <input type="text" name="Price"  required> </td>
			</tr>
			<tr>
				<td>
					<select id="dep"  name="TeaGradeID[]" > 
						<option> --Select Grade-- </option>
						<%
							ArrayList<Tea_Grade_Price> TeaGradePriceList1 = AllTeaGradePrice.getTeaGradePrices();
							
							for(Tea_Grade_Price TGP : TeaGradePriceList1)
							{
						%>
					
						<option value="<%=TGP.getTea_Grade_Price_ID() %>">  <%=TGP.getTea_Grade() %>  </option> 
						
						<%
							}
						%>
					</select>
				</td>
				<td> <input type="text" name="Selling_Qty[]" > </td>
				<td> <input type="text" name="Price" > </td>
			</tr>
			<tr>
				<td>
					<select id="dep"  name="TeaGradeID[]" > 
						<option> --Select Grade-- </option>
						<%
							ArrayList<Tea_Grade_Price> TeaGradePriceList3 = AllTeaGradePrice.getTeaGradePrices();
							
							for(Tea_Grade_Price TGP : TeaGradePriceList3)
							{
						%>
					
						<option value="<%=TGP.getTea_Grade_Price_ID() %>">  <%=TGP.getTea_Grade() %>  </option> 
						
						<%
							}
						%>
					</select>
				</td>
				<td> <input type="text" name="Selling_Qty[]" > </td>
				<td> <input type="text" name="Price" > </td>
			</tr>
			
			<tr ><td colspan="3" ></td></tr>
			<tr ><td colspan="3" ></td></tr>
			<tr ><td colspan="3" ></td></tr>
			<tr >
				<td colspan="3" ><input type="reset" value="Reset" class="Rest_btn">
					<input type="submit" value="Submit" class="submit_btn"></td>
			</tr>
			
		</table>
		</form>
		
	</div>			
		
<div class="v_line"></div>
				
	<!-- view Table -->
	<div class="RightSide">
		
		<div class="search">
   			<form action="" method="POST">
     			<input type="text" placeholder="Search..." name="search" id="SerchBox" >
      		</form>
  		</div>
  		
  		<div class="table">
  			<h3 id="Table_H"> Factory Sales Details  </h3>
  			
	  		<table id="ShowTable" >
				<tr class="viewTr">
			    	<th>Sales Type</th>
			    	<th>Date</th>
			    	<th>Tea Garde</th>
			    	<th>Selling Quantity</th>
			    	
			    	<th> Edit </th>
				</tr>
				
			<%
				FactorySalesService FsalesView = new FactorySalesServiceImpt();
				ArrayList<FactorySales> SalesList = new ArrayList<FactorySales>() ;
				
				String Value = request.getParameter("search");
				if(Value != null) 
				{
					Sales_SearchService ser = new Sales_SearchServiceImpt();
					SalesList = ser.SearchFactorySales(Value);
				}
				else{
					SalesList = FsalesView.getAllFactorySales();
				}
				
				for(FactorySales fs : SalesList)
				{
			%>			
				<tr class="viewTr">
						<td class ="TblData"> <%=fs.getSales_Type() %> </td>
						<td class ="TblData" > <%=fs.getDate() %></td>
						<td class ="TblData"> <%=fs.getTea_Grade() %> </td>
						<td class ="TblData"> <%=fs.getSelling_Quantity() %></td>
						<td class ="TblData">
							<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Update_Factory_Sales.jsp">
								<input type="hidden" name="SalesID"value="<%=fs.getFactory_Sales_ID() %>" />
								<input type="submit" value="Edit" class="Edit_btn">
							</form>
						</td>
				</tr>
			<%
				}
			%>
				
	 		</table>
  		
  		</div>
		
	</div>			
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</body>
</html>