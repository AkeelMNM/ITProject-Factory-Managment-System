<%@page import="com.fms.model.TeaStock"%>
<%@page import="fms.Inventory.service.stockServiceImp"%>
<%@page import="fms.Inventory.service.stockService"%>
<%@page import="com.fms.model.Tea_Grades"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.Inventory.service.Tea_Grades_ServiceImpt"%>
<%@page import="fms.Inventory.service.Tea_Grades_Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Inventory/Admin_inventry.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Inventory/InAdmin&Manager_Script.js"></script>
</head>
<style>
	table {
	  	font-family: arial, sans-serif;
  		border-collapse: collapse;
  		width: 100%;
	}

	#ShowTab  th {
  		border: 1px solid #dddddd;
  		text-align: left;
  		padding: 8px;
  		background-color: #989933;
  		
		}
		td, th {
  		border: 1px solid #dddddd;
  		text-align: left;
  		padding: 8px;
  		
  		
		}

	#ShowTab tr:nth-child(even) {
  	
		}
		#ShowTab tr:nth-child(odd) {
  	
		}
		#formTab tr{
		
		
		}
		.sub,.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.delete {
  background-color: #f44336; /* Green */
  border: none;
  color: white;
  padding: 15px 23px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.EditBtn {
  background-color:#1a1a1a /* Green */;
  border: none;
  color: white;
  padding: 15px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<body>
	<!-- Header Part -->
<div id="headDiv">
<%
   /* if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }
*/
%>
	
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
					  <li><a class="${pageContext.request.contextPath}Interfaces/Production/production.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Employee.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  
				</a></ul>
				</li>
				  <li><a class="menu" href="#">Tea Stock</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/Add_SalesStock.jsp">Sales Stock</a></li>
				  <li><a class="menu" href="#">Report</a></li>

		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		<div id = "left_side">
		<br><br>
		<h1 id ="top" style="background-color:#99CA36; color:white;"    >Insert Data</h1>
				<form method ="POST" action = "${pageContext.request.contextPath}/AddStocksServlet" >
				<table id ="formTab">
					
					
					<tr><td>Date: </td> <td><input type="date" name ="Date"/></td></tr>
					
					<tr><td>Tea Grades: </td>
					<td><select name="grades">
					<option >Select Tea Grade</option>
					<%
					
					ArrayList<Tea_Grades> array = new ArrayList<Tea_Grades>();
					
					Tea_Grades_Service teagServ = new Tea_Grades_ServiceImpt();	
					
					array = teagServ.getAllTeaGrades();
					
					for(Tea_Grades t : array){
					
					%>
					<option value ="<%=t.getTea_Grade_Name()%>"><%=t.getTea_Grade_Name()%></option>
					<%
					
						}
					%>
					
					</select></td></tr>
					<tr><td>Tea Grade Quantity(KG): </td> <td><input type="text" name = "TeaGradeQ"/></td></tr>
					<tr><td>Storing Location: </td> 
					<td><select name="location">
					<option value = "storeRoom">Store Room</option>
					<option value = "blockA">Block A</option>
					<option value = "blockB">Block B</option>
					<option value = "blockC">Block C</option>
					
					</select></td></tr>
					
					<tr><td><input  class ="sub" type = "submit" value ="reset"></td><td><input class ="sub" type="submit" value="submit"></td></tr>
				</table>
				
				</form>
				
		</div>
		
		<!-- horizontal line -->
	<div id ="h_line"> </div>
	
	<!-- ------------------------------------------------------------------------------------- -->
	
	<div id = "right_side">
	
	<!-- Search bar -->
		<div class="topnav">
  
  <div class="search-container">
    <form action="#">
      <input type="text" placeholder="Search.." name="search">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</div>
		
		
		<!-- view Table -->
		<div><h2 style="background-color:#99CA36; color:white;" >Inventory Details</h2></div>
		<br>
		
		<div>
		<table id ="ShowTab" border = "1">
		<tr >
		
		<th>Date</th>
		<th>Tea Grades</th>
		<th>Quantity(KG)</th>
		<th>Storing Location</th>
		<th>Edit</th>
		<th>Delete</th>
		</tr>
		<%
			stockService view = new stockServiceImp();
			
			ArrayList<TeaStock> arrayList = view.getAllTeaStock();
			
			for (TeaStock teas : arrayList) {
		%>
		<tr>
		<td><%=teas.getStoring_Date()%></td>
		<td><%=teas.getTea_Grades() %></td>
		<td><%=teas.getTea_Grades_Qty() %></td>
		<td><%=teas.getLocation() %></td>
		 <td >
            		<form method="POST" action="Update_Stocks.jsp" >
            			<input type="hidden" name="StockId" value="<%=teas.getStockID()%>">
            			<input type="submit" value = "Edit" class="EditBtn" > 
				 	</form>
				 </td>
				 
				 <td >
            		<form method="POST" action="${pageContext.request.contextPath}/deleteStockServlet">
            			<input type="hidden" name="StockId" value="<%=teas.getStockID()%>"/>
				 		<input type="submit" value="Delete" class="delete"> 
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
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</body>
</html>