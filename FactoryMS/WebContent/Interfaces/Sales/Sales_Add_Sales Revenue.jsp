<%@page import="com.fms.model.FactorySales"%>
<%@page import="fms.Sales.service.FactorySalesServiceImpt"%>
<%@page import="fms.Sales.service.FactorySalesService"%>
<%@page import="fms.Sales.service.Sales_SearchServiceImpt"%>
<%@page import="fms.Sales.service.Sales_SearchService"%>
<%@page import="com.fms.model.Sales_Revenue"%>
<%@page import="java.util.ArrayList"%>
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
<title>Sales Revenue</title>
</head>
<body>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Header Part ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<%
    if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }

%>

<div id="headDiv">
					<img src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" id="logo"> 
				<div id="name">
					<label id="title">Dehiwatta Tea Factory</label><br>
					<label id="address">Hapugahayatatenna,Handessa</label>
				</div>
				<div id="manage">
					<div class="dropdown">
							  <button onclick="myFunction()" class="dropbtn"><%=(String)session.getAttribute("uname")%></button>
								 <div id="myDropdown" class="dropdown-content">
									<a href="${pageContext.request.contextPath}/Interfaces/Home/User_Profile.jsp">View Profile</a>
									<a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
								</div>
					</div>
				</div>
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>" alt="UserLogo" id="Userlogo">									

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Admin_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Add_TeaLeaf_Suppliers.jsp">Purchase</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/production.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/Add_Stock.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Employee.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/addExp.jsp">Exspesne</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Factory Sales</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Sales_Return.jsp">Sales Return</a></li>
				  <li><a class="menu" href="#">Sales Revenue</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Tea_Grade_price.jsp">Tea grade price</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		
	
	<!-- insert Form -->
	<div Class="leftSide">
	
		<br>
		<label id="insert">Insert Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/Add_SalesRevenueServlet" style="margin-top:50px;">
		<table class="form">
		
			
			<tr>
				<td>Sales Type : </td>
				<td >
					<select name="SalesType"  required> 
						<%String key2 = null;
						key2 = (String) request.getAttribute("SalesType");
						if(key2 != null) { %>
							<option value="<%=key2 %>"> <%=key2 %> </option>
						<%}else{ %>
							<option> --Select Type-- </option>
							<option value="Auction">Auction</option>
							<option value="Local Sales"> Local Sales </option>
							<option value="Factory"> Factory </option>
						<%} %>
						
					</select>
				</td>
			</tr>
			
			<%
				String key = null;
				key = (String) request.getAttribute("SalDate");
				if(key != null)
				{
			
			%>
				<tr>
					<td> Date :</td>
					<td ><input type="date" name="RevDate" size="55" required >
						<input type="submit" name="Get" value="Generate" class="RneDataGenButton">
					</td>
			<%
				}
				else{
			%>
				<tr>
					<td>Sales Date :</td>
					<td ><input type="date" name="SalDate" size="55" required >
						<input type="submit" name="Get" value="Generate" class="RneDataGenButton">
					</td>
			<%
				}
			%>
			</tr>
			
			<tr>
				<td>Tea Garde : </td>
				<td>Sold Quantity :</td>
				<td>Total Amount :</td>
			</tr>
			
			<%
				
				ArrayList<Sales_Revenue> SoldList = new ArrayList<Sales_Revenue>();
				SoldList = (ArrayList<Sales_Revenue>) request.getAttribute("SoldList");
			
				if(SoldList != null)
				{
					for(Sales_Revenue re : SoldList)
					{
					
			%>
			
			<tr>
				<td>
					<input type="text" value="<%=re.getTea_Grade() %>"  disabled>
					<input type="hidden" name="FactorySalesID[]" value="<%=re.getFactory_SalesID() %>" >
				</td>
				<td> <input type="text" name="Sold_Qty[]" value="<%=re.getSold_Quantity() %>" required> </td>
				<td> <input type="text" name="total_Amount[]" value="<%=re.getAmount() %>" required> </td>
			</tr>
			
			<%
					}
				}
				else
				{
			%>
			
			<tr>
				<td> <input type="text" name="FactorySalesID[]" > </td>
				<td> <input type="text" name="Sold_Qty[]" pattern="\d+" > </td>
				<td> <input type="text" name="total_Amount[]" id="num1" > </td>
			</tr>
			<tr>
				<td> <input type="text" name="FactorySalesID[]" > </td>
				<td> <input type="text" name="Sold_Qty[]"  > </td>
				<td> <input type="text" name="total_Amount[]" id="num2" > </td>
			</tr>
			<tr>
				<td> <input type="text" name="FactorySalesID[]" > </td>
				<td> <input type="text" name="Sold_Qty[]"  > </td>
				<td> <input type="text" name="total_Amount[]" id="num3" > </td>
			</tr>
			<tr>
				<td> <input type="text" name="FactorySalesID[]" > </td>
				<td> <input type="text" name="Sold_Qty[]"  > </td>
				<td> <input type="text" name="total_Amount[]" id="num3" > </td>
			</tr>
			<tr>
				<td> <input type="text" name="FactorySalesID[]" > </td>
				<td> <input type="text" name="Sold_Qty[]"  > </td>
				<td> <input type="text" name="total_Amount[]" id="num3" > </td>
			</tr>
			
			<%
				}
			%>
			
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
  			<h3 id="Table_H"> Sales Revenue Details  </h3>
  			
	  		<table id="ShowTable" >
				<tr class="viewTr">
			    	<th>Sales Type</th>
			    	<th>Date</th>
			    	<th>Tea Garde</th>
			    	<th>Sold Quantity (kg)</th>
			    	<th>Total Amount</th>
			    	
			    	<th> Edit </th>
				</tr>
			
			<%
				Sales_RevenueService RevenueView = new Sales_RevenueServiceImpt();
				ArrayList<Sales_Revenue> SalesRevenueList = new ArrayList<Sales_Revenue>();
				
				String Value = request.getParameter("search");
				if(Value != null) 
				{
					Sales_SearchService ser = new Sales_SearchServiceImpt();
					SalesRevenueList = ser.SearchSalesRevenue(Value);
				}
				else{
					SalesRevenueList = RevenueView.getAllSalesRevenue();
				}
				
				for(Sales_Revenue Revenue : SalesRevenueList)
				{
			%>
				<tr class="viewTr">
						<td class ="TblData"> <%=Revenue.getSales_Type() %> </td>
						<td class ="TblData" > <%=Revenue.getDate() %> </td>
						<td class ="TblData"> <%=Revenue.getTea_Grade() %> </td>
						<td class ="TblData"> <%=Revenue.getSold_Quantity() %> </td>
						<td class ="TblData"> <%=Revenue.getAmount() %> </td>
						<td class ="TblData">
							<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Update_Sales Revenue.jsp">
								<input type="hidden" name="SalesID"value="<%=Revenue.getSales_RevenueID() %>" />
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