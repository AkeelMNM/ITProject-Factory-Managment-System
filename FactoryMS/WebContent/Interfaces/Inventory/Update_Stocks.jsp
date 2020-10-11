<%@page import="com.fms.model.TeaStock"%>
<%@page import="fms.Inventory.service.stockServiceImp"%>
<%@page import="fms.Inventory.service.stockService"%>
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
  		background-color: #CE9737;
		}
		#ShowTab tr:nth-child(odd) {
  		background-color: #669934;
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
  align:center;
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
				  <li><a class="menu" href="#">Sales Stock</a></li>
				  <li><a class="menu" href="#">Report</a></li>

		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		<h1 id ="top" style="background-color:#669934; color:white;" >Update Stock</h1>
		
		<%
			String StockId = request.getParameter("StockId");
		
			stockService updatest = new stockServiceImp();
			TeaStock tea = updatest.getTeaStockById(StockId);
			
			
			
		%>
		
				<form method="POST" action="${pageContext.request.contextPath}/editStockServlet">
				<table id = "formTab">
					<tr>
					<td>Date: </td> 
					<td><input type="date" name ="udate"  value ="<%=tea.getStoring_Date() %>" ></td>
					</tr>
					
					<tr><td>Tea Grades: </td>
					<td><select name="grades">
					<option value = "BOP">BOP</option>
					<option value = "FBOPF">FBOPF</option>
					<option value = "FBOPFSP">FBOPFSP</option>
					<option value = "DUST">DUST</option>
					<option value = "BOP1">BOP1</option>
					</select></td></tr>
					<tr><td>Tea Grade Quantity: </td> <td><input type="text" name ="TeaGQty" value= "<%=tea.getTea_Grades_Qty()%> " ></td></tr>
					<tr><td>Storing Location: </td> 
					<td><select name="location">
					<option value = "storeRoom">Store Room</option>
					<option value = "blockA">Block A</option>
					<option value = "blockB">Block B</option>
					<option value = "blockC">Block C</option>
					
					</select></td></tr>
					
					<tr><td></td><td>
					<input type="hidden" name="id" value ="<%=StockId %>" >
					<input type="submit"  class ="sub" value="Update">
					
					</td></tr>
				</table>
				
				</form>
				
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</body>

</html>