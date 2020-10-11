
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="fms.Production.service.ProductionDao"%>
<%@page import="fms.Production.service.Production"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.fms.DBconnection.*"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="../../CSS & javaScript/Production/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="../../CSS & javaScript/Production/Admin&Manager_Script.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body>
<!-- Header Part -->
<div id="headDiv">
					<img src="../../Images/MainLogo.jpeg" alt="MainLogo" id="logo"> 
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
						<img src="../../Images/user.png" alt="UserLogo" id="Userlogo">								

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="../../index.html">Home
				
				  <li><a class="menu" href="production.jsp">Production Details</a></li>
				  <li><a class="menu" href="#">Wastage Details</a></li>
				  <li><a class="menu" href="#">Report</a></li>

		</ul>

<div id="bodyDiv" style="min-height: 485px;">
	
		<!-- Body Part -->

<div class="row">
  
    <!-- Filter data -->
    <% 
String query=request.getParameter("filter");
String data;
if(query!=null){
	List<Production> list=ProductionDao.getAllRecords(query);  
	request.setAttribute("list",list);
	
}else{
	List<Production> list=ProductionDao.getAllRecords(null);  
	request.setAttribute("list",list);
}

%>

<!-- --Table data -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <div class="col-sm" style="padding-top: 42px;padding-right: 60px;padding-left: 60px;">
    <nav class="navbar navbar">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="filter">
    <button class="btn btn-primary" type="submit">Search</button>
  </form>
</nav>
      <table class="table table-hover">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Prod.ID</th>
      <th scope="col">Tea Grade</th>
      <th scope="col">Quntity</th>   
      <th scope="col">Date</th>
      <th scope="col">Type of wastage</th> 
       <th scope="col">Wastage ammount</th> 
        <th scope="col">Net ammount</th>       
      <th scope="col">Action1</th> 
      <th scope="col">Action2<th> 
    </tr>
  </thead>
  <tbody>
<c:forEach items="${list}" var="u">  
    <tr>
      <th scope="row">${u.getId()}</th> 
      <td> ${u.getTeaGrade()}</td>
      <td> ${u.getQuntity()}</td>
      <td> ${u.getDate()}</td>
      <td> ${u.getWastageType()}</td>
      <td> ${u.getLeavesWastage()}</td>
      <td> ${u.getFinalAmmount()}</td>
      <td> <button class="btn btn-warning" data-toggle="modal" onclick="location.href = 'updateWastages.jsp?id=${u.getId()}';">Update</button></td>
      <td> <button class="btn btn-danger" data-toggle="modal" onclick="location.href = 'deleteProd.jsp?id=${u.getId()}';">Delete</button></td>
    </tr>
 </c:forEach>
  </tbody>
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