<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Inventory/InManager_Styles.css">
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
		background-color:#CE9737;
		
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
		<ul><li><a class="menu" href="
${pageContext.request.contextPath}/Interfaces/Home/Manager_Home.jsp
		">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Manager.jsp">Purchase</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/index_maneger.html">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_View.jsp">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/ReportMain.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">HR Management</a></li>
				  <li><a class="menu" href="#">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
			<div id = "left_side">
	
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
		<div><h2 style="background-color:#99CA36; color:white;" >Inventry Deatils</h2></div>
		<br>
		
		<div>
		<table id ="ShowTab" border = "1">
		<tr >
		<th>Date</th>
		<th>Tea Grades</th>
		<th>Tea Grade Quantity(KG)</th>
		<th>Storing Location</th>
		 
		 
		</tr>
		<tr >
			<td >20.05.2020</td>
			<td >BOP</td>
			<td    >12</td>
			<td    >Store Room</td>
			 
			
			 
		
		</tr>
		<tr >
			<td    >25.02.2020</td>
			<td    >BOP1</td>
			<td    >18</td>
			<td    >Lodge</td>
			 
			 
		</tr>
		<tr >
			<td    >12.06.2020</td>
			<td    >FBOPF</td>
			<td    >16</td>
			<td    >Store Room</td>
			 
			
		</tr >
		<tr >
			<td    >20.05.2020</td>
			<td    >BOP</td>
			<td    >12</td>
			<td    >Store Room</td>
			 
			 
		</tr>
			
		
		
		</table>
		</div>
	
	</div>	
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
		<div><h2 style="background-color:#99CA36; color:white;">Sales Out Deatils</h2></div>
		<br>
		
		<div>
		<table id ="ShowTab" border = "1">
		<tr >
		<th>Date</th>
		<th>Tea Grades</th>
		<th>Tea Grade Quantity(KG)</th>
		
		</tr>
		<tr >
			<td >20.05.2020</td>
			<td >BOP</td>
			<td    >12</td>
			
			 
			
		</tr>
		<tr >
			<td    >25.02.2020</td>
			<td    >BOP1</td>
			<td    >18</td>
			
			
		</tr>
		<tr >
			<td    >12.06.2020</td>
			<td    >FBOPF</td>
			<td    >16</td>
			
			 
		</tr >
		<tr >
			<td    >20.05.2020</td>
			<td    >BOP</td>
			<td    >12</td>
			
			 
			 
		</tr>
			
		
		
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