<%@page import="fms.Sales.service.Sales_SearchServiceImpt"%>
<%@page import="fms.Sales.service.Sales_SearchService"%>
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
<title>Sales</title>
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
				  <li><a class="menu" href="#">Tea grade price</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Sales_Return.jsp">Sales Return</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
	
	<!-- insert Form -->
	<div Class="leftSide">
	
		<br>
		<label id="insert">Insert Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/Add_TeaGradePriceServlet" style="margin-top:50px;">
		<table class="form">
		
			<tr>
				<td>Date :</td>
				<td ><input type="date" name="T-Date" size="55" required></td>
			</tr>
			<tr>
				<td>Tea Grade :</td>
				<td ><input type="text" name="Tea_Grade" size="55" required></td>
			</tr>
			<tr>
				<td>Price (per kg) :</td>
				<td ><input type="text" name="price" size="55" required></td>
			</tr>
			
			<tr ><td colspan="2" ></td></tr>
			<tr ><td colspan="2" ></td></tr>
			<tr ><td colspan="2" ></td></tr>
			<tr >
				<td colspan="2" ><input type="reset" value="Reset" class="Rest_btn">
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
  			<h3 id="Table_H"> Tea Grade & Price Details   </h3>
  			
	  		<table id="ShowTable" >
				<tr class="viewTr">
			    	<th>Tea Garde</th>
			    	<th>Price (per kg) </th>
			    	<th>Date</th>
			    	
			    	<th> Edit </th>
				</tr>
				
			<%
				Tea_Grade_PriceService TGPview = new Tea_Grade_PriceServiceImpt();
				ArrayList<Tea_Grade_Price> TeaGradePriceList = TGPview.getTeaGradePrices();
				
				String Value = request.getParameter("search");
				if(Value != null) 
				{
					Sales_SearchService ser = new Sales_SearchServiceImpt();
					TeaGradePriceList = ser.SearchTeaGradePrice(Value);
				}
				else{
					TeaGradePriceList = TGPview.getTeaGradePrices();
				}
				
				for(Tea_Grade_Price TGP : TeaGradePriceList)
				{
			%>
			
				<tr class="viewTr">
						<td class ="TblData"> <%=TGP.getTea_Grade() %> </td>
						<td class ="TblData" > <%=TGP.getPrice() %> </td>
						<td class ="TblData"> <%=TGP.getDate() %> </td>
						<td class ="TblData">
							<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Update_Tea_Grade_price.jsp">
								<input type="hidden" name="TeaID"value="<%=TGP.getTea_Grade_Price_ID() %>" /> 
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