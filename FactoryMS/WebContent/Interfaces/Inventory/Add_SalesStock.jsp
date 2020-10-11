<%@page import="fms.Inventory.service.stockServiceImp"%>
<%@page import="fms.Inventory.service.stockService"%>
<%@page import="com.fms.model.TeaStock"%>
<%@page import="fms.Inventory.service.SalesStockServiceImp"%>
<%@page import="fms.Inventory.service.SalesStockService"%>
<%@page import="com.fms.model.SalesTeaStock"%>
<%@page import="com.fms.model.Tea_Grades"%>
<%@page import="fms.Inventory.service.Tea_Grades_ServiceImpt"%>
<%@page import="fms.Inventory.service.Tea_Grades_Service"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Inventory/InAdmin_Styles.css">
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
  padding: 15px 25px;
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
    /*if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }*/

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
				  <li><a class="menu" href="#">Sales Stock</a></li>
				  <li><a class="menu" href="#">Report</a></li>

		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		<div id = "left_side">
		
		<h1 id ="top" style="background-color:#99CA36; color:white;">Insert Sales Stock</h1>
				<form method ="POST" action = "${pageContext.request.contextPath}/AddSalesStockServlet">
				<table id = "formTab">
					
					<tr><td>Date: </td> <td><input type="date" name ="Sdate"/></td></tr>
					
					<tr><td>Tea Grades: </td>
					<td><select name="grades">
					<option >Select Tea Grade</option>
					
						<%
						
						ArrayList<Tea_Grades > array = new ArrayList<Tea_Grades>();
						
						Tea_Grades_Service teaS = new Tea_Grades_ServiceImpt();
						array = teaS.getAllTeaGrades();
						
						for(Tea_Grades t : array){
			
					%>
					<option value ="<%=t.getTea_Grade_Name()%>"><%=t.getTea_Grade_Name()%></option>
					<%
						}
					%>
				
					</select></td></tr>
										
					
					<tr><td>Storing Location: </td> 
					<td><select name="location">
					<option>Select Location</option>
					
					<%
						
						ArrayList<TeaStock > locationArray = new ArrayList<TeaStock>();
						
						stockService locationS = new stockServiceImp();
						locationArray = locationS.getAllTeaStock();
						
						for(TeaStock l : locationArray){
			
					%>
					<option value ="<%=l.getLocation()%>"><%=l.getLocation()%></option>
					<%
						}
					%>
					
					</select></td></tr>
					
					
					
					<tr><td>Tea Grade Quantity: </td> <td><input type="text" name ="Sqty"/></td></tr>
					
					
					<tr><td><input type = "submit" class ="sub" value ="reset"></td><td><input type="submit" class ="sub" value="submit"></td></tr>
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
		<div><h2 style="background-color:#99CA36; color:white;">Sales Out Details</h2></div>
		<br>
		
		<div>
		<table id ="ShowTab" border = "1">
		<tr >
		
		<th>Date</th>
		<th>Tea Grades</th>
		<th>Tea Grade Quantity</th>
		<th>Edit</th>
		<th>Delete</th>
		</tr>
		<tr >
		
			<td >20.05.2020</td>
			<td >BOP</td>
			<td    >12</td>
			
			<td    ><input type ="submit" value ="edit" class ="EditBtn"></td>
			<td  ><input type="button" value="Delete" class ="delete" onclick="deleteRow(this)"></td>
		</tr>
		<tr >
			
			<td    >25.02.2020</td>
			<td    >BOP1</td>
			<td    >18</td>
			
			<td    ><input type ="submit" value ="edit" class ="EditBtn"></td>
			<td  ><input type="button" value="Delete" class ="delete" onclick="deleteRow(this)"></td>
		</tr>
		<tr >
			
			<td    >12.06.2020</td>
			<td    >FBOPF</td>
			<td    >16</td>
			
			<td    ><input type ="submit" value ="edit" class ="EditBtn"></td>
			<td  ><input type="button" value="Delete"  class ="delete" onclick="deleteRow(this)"></td>
		</tr >
		<tr >
			
			<td    >20.05.2020</td>
			<td    >BOP</td>
			<td    >12</td>
			
			<td    ><input type ="submit" value ="edit" class ="EditBtn"></td>
			<td  ><input type="button" value="Delete" class ="delete"onclick="deleteRow(this)"></td>
		</tr>
			
		
		
		</table>
		</div>
	
	</div>
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<div id ="viewDiv">
	
	
	
	
	
	
	</div>
	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</body>						
	
</html>