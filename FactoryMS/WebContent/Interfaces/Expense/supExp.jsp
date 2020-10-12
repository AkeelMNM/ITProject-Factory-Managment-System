
<%@page import="fms.Expense.service.ExSupplierDao"%>
<%@page import="fms.Expense.service.ExSupplier"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.Connection"%>
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
<link rel="stylesheet" href="../../CSS & javaScript/Expense/Admin_Styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../../CSS & javaScript/Expense/Admin&Manager_Script.js"></script>
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
				 <li><a class="menu" href="addExp.jsp">Add Expenses</a></li>
				  <li><a class="menu" href="#">Expense Supplier</a></li>
				 

		</ul>

<div id="bodyDiv" style="min-height: 485px;">
	
		<!-- Body Part -->

<div class="row">
    <div class="col-sm">
<form action="addSupEx.jsp" method="post" class="formAlign" style="padding-top: 40px;">
      <div class="form-group row">
      
      <div class="col-md-12">
      <label for="inputQuantity" style="font-size: 20px;font-style: italic;font-weight: bold;" class="col-sm-8">Dealer Insertion Form</label>
    </div>
  </div>
      <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Dealer name</label>
          <div class="col-md-8">
      <input type="text" class="form-control" id="dname" name="dealerName" placeholder="Dealer name" required="required">
    </div>
  </div>
        <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Contact No</label>
          <div class="col-md-8">
      <input type="number" class="form-control" id="tep" name="tep" placeholder="Contact No" pattern="^\d{10}$" required maxlength="10" >
    </div>
  </div>
  

    <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from dealingstatus");  
	        ResultSet rs=ps.executeQuery();  
%>
<div class="form-group row">
      <label for="inputState" class="col-sm-2 col-form-label">Dealing Status</label>
     <div class="col-md-8" style="padding-top: 12px;">
      <select name="status" class="form-control" required>
		<%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
      </select>
      </div>
    </div>
    <%
        }
        catch(Exception e)
        {
             out.println("Error"+e);
        }
%>
        <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Address</label>
          <div class="col-md-8">
      <input type="text" class="form-control" id="add" name="address" placeholder="Address" required="required">
    </div>
  </div>
      <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Remark</label>
          <div class="col-md-8">
      <textarea name="remark"  class="form-control" id="rem" placeholder="Remark" required="required"></textarea>
    </div>
  </div>
     <div class="position-absolute bottom2-left"> 
  <button type="submit" class="btn btn-primary" >Submit</button>
  <button type="button" onclick="reply_click(this)"class="btn btn-primary">Demo</button><br>
 
    </div>
</form>
    </div>
     <script>
    
    function reply_click(element)
    {
    document.getElementById('dname').value = "Demo user";
	document.getElementById('tep').value = "1234567890";
	document.getElementById('add').value = "abc123";
	document.getElementById('rem').value = "test";
    }    
    
</script>
    <!-- Filter data -->
    <% 
String query=request.getParameter("filter");
String data;
if(query!=null){
	List<ExSupplier> list=ExSupplierDao.getAllRecords(query);  
	request.setAttribute("list",list);
	
}else{
	List<ExSupplier> list=ExSupplierDao.getAllRecords(null);  
	request.setAttribute("list",list);
}

%>

<!-- --Table data -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <div class="col-sm" style="padding-top: 42px;padding-right: 60px;">
    <nav class="navbar navbar">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="filter">
    <button class="btn btn-primary" type="submit">Search</button>
  </form>
</nav>
      <table class="table table-hover">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Dealer Name</th>
      <th scope="col">Contact no</th>   
      <th scope="col">Address</th>
      <th scope="col">Dealing Status</th> 
       <th scope="col">Remark</th>      
      <th scope="col">Action1</th> 
      <th scope="col">Action2<th> 
    </tr>
  </thead>
  <tbody>
<c:forEach items="${list}" var="u">  
    <tr>
      <th scope="row">${u.getId()}</th> 
      <td> ${u.getDealerName()}</td>
      <td> ${u.getTep()}</td>
      <td> ${u.getAddress()}</td>
      <td> ${u.getStatus()}</td>
      <td> ${u.getRemark()}</td>
<td> <button class="btn btn-warning" data-toggle="modal" onclick="location.href = 'updateSupExp.jsp?id=${u.getId()}';">Update</button></td>
      <td> <button class="btn btn-danger" data-toggle="modal" onclick="location.href = 'deleteSupExp.jsp?id=${u.getId()}';">Delete</button></td>
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