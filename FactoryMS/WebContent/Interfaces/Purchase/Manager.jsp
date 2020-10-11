<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>


.viewreport{
	background-color:#4d4d4d;
  color: white;
    height: 45px;
    width: 500px;

}

.genaratereport{
	background-color:#4d4d4d;
  color: white;
    height: 45px;
    width: 500px;

}
.title1{

font-family:'Gabriela';
	font-size:30px;
	color:  #0a5c54;
	padding-left:60px;
text-decoration-line: underline;

}



</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Manager_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>

</head>
<body>
<!-- Header Part -->

<!-- ////////////////////////////////////////////////////// -->
<%
    /*if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }
*/
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
						<!--  <img src="UserPro.png" alt="UserLogo" id="Userlogo">-->
						
							<!-- ////////////////////////////////////////////////////// -->
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>"	>
												
						<!-- ////////////////////////////////////////////////////// -->										

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="#">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/reportUI.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/InventManager.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_View.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/reportUI.jsp">Exspesne</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/ReportMain.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">HR Management</a></li>
				  <li><a class="menu" href="#">Report</a></li>
		</ul>

<div id="bodyDiv">
<br>
	<label class="title1">PURCHASING REPORT</label>
	<br><br><br><br><br>
	
	
	
						<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp">
						<input type="submit" name="report" value="VIEW REPORT" size="40" class="viewreport"/> 
						
					</form>
					
					<br> <br>
							<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Purchase/FinalReport.jsp">
						<input type="submit" name="report" value="GENARATE REPORT" size="40" class="genaratereport"/> 
							
					</form>
						
						<!-- <input type="submit" value ="VIEW LEAF ORDER REORT"class="btnreset" href="${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp"/>  --> 
						
						
						
						
						
						
						
	<br><br><br><br><br><br><br><br><br><br><br>
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>
</html>