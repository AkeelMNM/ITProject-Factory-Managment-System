
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
				
				  <li><a class="menu" href="#">Production Details</a></li>
				  <li><a class="menu" href="wastage.jsp">Wastage Details</a></li>
				  <li><a class="menu" href="#">Report</a></li>

		</ul>

<div id="bodyDiv" style="min-height: 485px;">
	
		<!-- Body Part -->
<div class="row">
    <div class="col-sm">
<form action="addProduction.jsp" method="post" class="formAlign" style="padding-top: 120px;">
  <div class="form-row">
  <div class="form-group col-md-4">
  <label for="dateSelect">Select Date</label>
  </div>
  <div class="form-group col-md-6">
  <input type="date" class="form-control" id="date" name="date" required>
  </div>
  
  <!-- Get select box data -->
  <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from qulity");  
	        ResultSet rs=ps.executeQuery();  
%>
    <div class="form-group col-md-4">
      <label for="inputState">Tea Quality</label>
      <select name="teaGrade" class="form-control" required>
		<%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
      </select>
    </div>
    <%
        }
        catch(Exception e)
        {
             out.println("Error"+e);
        }
%>
    <div class="form-group col-md-6">
      <label for="inputQuantity">Quantity</label>
      <input type="text" class="form-control" id="tq" name="quntity" placeholder="Quantiy" required="required">
    </div>
  </div>

  <div class="position-fixed  bottom-left" style="padding-bottom: 225px;"> 
  <button type="submit" class="btn btn-primary" style="padding-left: 23px;padding-right: 23px;">Rest</button>
   </div>
     <div class="position-fixed bottom2-left" style="padding-bottom: 225px;"> 
  <button type="submit" class="btn btn-primary" >Submit</button>
            <button type="button" onclick="reply_click(this)"class="btn btn-primary">Demo</button><br>
    </div>
</form>
    </div>
    <script>
    
    function reply_click(element)
    {
    document.getElementById('date').value = "2020/09/08";
	document.getElementById('tq').value = "125";
    }    
    
</script>
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

    <div class="col-sm" style="padding-top: 42px;padding-right: 30px;">
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
      <th scope="col">Quantity</th>   
      <th scope="col">Date</th>   
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
      <td> <button class="btn btn-warning" data-toggle="modal" onclick="location.href = 'updateUI.jsp?id=${u.getId()}';">Update</button></td>
      <td> <button class="btn btn-danger" data-toggle="modal" onclick="location.href = 'deleteProd.jsp?id=${u.getId()}';">Delete</i></button></td>
    </tr>
 </c:forEach>
  </tbody>
</table>
    </div>
</div>
</div> 
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>


</html>