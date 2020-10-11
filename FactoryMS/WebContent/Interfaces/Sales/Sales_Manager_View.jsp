<%@page import="fms.Sales.service.Tea_Grade_PriceServiceImpt"%>
<%@page import="fms.Sales.service.Tea_Grade_PriceService"%>
<%@page import="com.fms.model.Tea_Grade_Price"%>
<%@page import="fms.Sales.service.Sales_ReturnServiceImpt"%>
<%@page import="fms.Sales.service.Sales_ReturnService"%>
<%@page import="com.fms.model.Sales_Return"%>
<%@page import="fms.Sales.service.Sales_RevenueServiceImpt"%>
<%@page import="fms.Sales.service.Sales_RevenueService"%>
<%@page import="com.fms.model.Sales_Revenue"%>
<%@page import="fms.Sales.service.FactorySalesServiceImpt"%>
<%@page import="fms.Sales.service.FactorySalesService"%>
<%@page import="com.fms.model.FactorySales"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.Sales.service.Sales_SearchServiceImpt"%>
<%@page import="fms.Sales.service.Sales_SearchService"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Sales/Sales_Manager_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Sales/Sales_Admin&Manager_Script.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Manager_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Manager.jsp">Purchase</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/reportUI.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/InventManager.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/reportUI.jsp">Exspesne</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/Manager.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">Sales Management</a></li>
				  <li><a class="menu" href="Sales_Manager_Report.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		
		<div class="search">
   			<form action="" method="post">
     			<input type="text" name="ManagerSearch" id="ser" placeholder="Search.." >
     			<select name="DataTbl" id="Search_Tbl" required>
     				<option> Select... </option>
					<option value="FactorySales"> Factory Sales </option>
					<option value="Revenue"> Sales Revenue </option>
					<option value="Return"> Sales Return </option>
					<option value="TeaGardeprice"> Tea Garde price </option>			
				</select>
      			<input type="submit" id="Search_btn" value="Search" >
    		</form>
  		</div>
  		
  		<div class="table">
	  		<table id="ShowTable" >
	  		
	  		<%
	  		
		  		String Table = null;
	  			String Value = null;
	  			Table = request.getParameter("DataTbl");
	  			Value = request.getParameter("ManagerSearch");
	  			
	  			Sales_SearchService search = new Sales_SearchServiceImpt();
	  		
	  			if("FactorySales".equals(Table))
		  		{
		  			ArrayList<FactorySales> SalesList = new ArrayList<FactorySales>();
		  			
		  			if(Value == ""){
			  			FactorySalesService FactorySalesView = new FactorySalesServiceImpt();
			  			SalesList = FactorySalesView.getAllFactorySales();
		  			}
		  			else {
		  				SalesList = search.SearchFactorySales(Value);
		  			}
	  			
	  		%>
	  		
	  			<h3 id="Table_H"> Factory Sales Details  </h3>
	  		
				<tr class="viewTr">
			    	<th>Sales Type</th>
			    	<th>Date</th>
			    	<th>Tea Garde</th>
			    	<th>Selling Quantity</th>
				</tr>
			<%
					for(FactorySales FS : SalesList)
					{
			%>
				<tr class="viewTr">
						<td class ="TblData"> <%=FS.getSales_Type() %> </td>
						<td class ="TblData" > <%=FS.getDate() %></td>
						<td class ="TblData"> <%=FS.getTea_Grade() %> </td>
						<td class ="TblData"> <%=FS.getSelling_Quantity() %></td>
				</tr>
			<%		}
				}
			
	  			else if("Revenue".equals(Table))
		  		{
					ArrayList<Sales_Revenue> RevenueList = new ArrayList<Sales_Revenue>();
					
					if(Value == ""){
						Sales_RevenueService RevenueView = new Sales_RevenueServiceImpt();
						RevenueList = RevenueView.getAllSalesRevenue();
					}
					else{
						RevenueList = search.SearchSalesRevenue(Value);
					}
					
			%>
			
				<h3 id="Table_H"> Sales Revenue Details  </h3>
	
				<tr class="viewTr">
			    	<th>Sales Type</th>
			    	<th>Date</th>
			    	<th>Tea Garde</th>
			    	<th>Sold Quantity (kg)</th>
			    	<th>Total Amount</th>
				</tr>
			<%
					for(Sales_Revenue Revenue : RevenueList)
					{
			%>
				<tr class="viewTr">
						<td class ="TblData"> <%=Revenue.getSales_Type() %> </td>
						<td class ="TblData" > <%=Revenue.getDate() %> </td>
						<td class ="TblData"> <%=Revenue.getTea_Grade() %> </td>
						<td class ="TblData"> <%=Revenue.getSold_Quantity() %> </td>
						<td class ="TblData"> <%=Revenue.getAmount() %> </td>
				</tr>
			<%		}
				}
			
	  			else if("Return".equals(Table))
	  			{
					ArrayList<Sales_Return> ReturnList = new ArrayList<Sales_Return>();
					
					if(Value == ""){
						Sales_ReturnService ReturnView = new Sales_ReturnServiceImpt();
						ReturnList = ReturnView.getSalesReturn();
					}
					else{
						ReturnList = search.SearchSalesReturn(Value);
					}
					
			%>
	
				<h3 id="Table_H"> Sales Return Details  </h3>
	
				<tr class="viewTr">
			    	<th>Tea Garde</th>
			    	<th>Date</th>
			    	<th>Return Quantity (kg)</th>
				</tr>
			<%
					for(Sales_Return Return : ReturnList)
					{
			%>
				<tr class="viewTr">
						<td class ="TblData"> <%=Return.getTea_Grade() %> </td>
						<td class ="TblData" > <%=Return.getDate() %> </td>
						<td class ="TblData"> <%=Return.getReturn_Quantity() %> </td>
				</tr>
			<%		}
				}
			
	  			else if("TeaGardeprice".equals(Table))
	  			{
					ArrayList<Tea_Grade_Price> TGPList = new ArrayList<Tea_Grade_Price>();
					
					if(Value == ""){
						Tea_Grade_PriceService TGPView = new Tea_Grade_PriceServiceImpt();
						TGPList = TGPView.getTeaGradePrices();
					}
					else{
						TGPList = search.SearchTeaGradePrice(Value);
					}
			
			%>
			
				<h3 id="Table_H"> Tea Grade Price Details   </h3>
			
				<tr class="viewTr">
			    	<th>Tea Garde</th>
			    	<th>Price (per kg) </th>
			    	<th>Date</th>
				</tr>
			<%
					for(Tea_Grade_Price TGP : TGPList)
					{
			%>
				<tr class="viewTr">
						<td class ="TblData"> <%=TGP.getTea_Grade() %> </td>
						<td class ="TblData" > <%=TGP.getPrice() %> </td>
						<td class ="TblData"> <%=TGP.getDate() %> </td>
				</tr>
			<%		}
				}
				
	  			else
			  		{
			  			
		  			FactorySalesService FactorySalesView = new FactorySalesServiceImpt();
		  			ArrayList<FactorySales> SalesList = FactorySalesView.getAllFactorySales();
		  		
		  		%>
		  		
		  			<h3 id="Table_H"> Factory Sales Details  </h3>
		  		
					<tr class="viewTr">
				    	<th>Sales Type</th>
				    	<th>Date</th>
				    	<th>Tea Garde</th>
				    	<th>Selling Quantity</th>
					</tr>
				<%
						for(FactorySales FS : SalesList)
						{
				%>
					<tr class="viewTr">
							<td class ="TblData"> <%=FS.getSales_Type() %> </td>
							<td class ="TblData" > <%=FS.getDate() %></td>
							<td class ="TblData"> <%=FS.getTea_Grade() %> </td>
							<td class ="TblData"> <%=FS.getSelling_Quantity() %></td>
					</tr>
				<%		}
					}
				%>
				
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