
<%@page import="fms.Expense.serviceANDservlet.Expe_DAO"%>
<%@page import="fms.Expense.serviceANDservlet.Expenses"%>
<%@page import="fms.Expense.serviceANDservlet.ExSupplierDao"%>
<%@page import="fms.Expense.serviceANDservlet.ExSupplier"%>
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
<title>Expenses Form</title>>
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
<%

if((String)session.getAttribute("uid")==null)
{
	response.sendRedirect("/FactoryMS/index.jsp");
}
%>  


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
				 <li><a class="menu" href="#">Add Expenses</a></li>
				  <li><a class="menu" href="supExp.jsp">Expense Supplier</a></li>
				 

		</ul>

<div id="bodyDiv" style="min-height: 485px;">
	
		<!-- Body Part -->

<div class="row">
    <div class="col-sm">
<form action="addExpRq.jsp" method="post" class="formAlign" style="padding-top: 10px;height: 700px;">
      <div class="form-group row">
      
      <div class="col-md-12">
      <label for="inputQuantity" style="font-size: 20px;font-style: italic;font-weight: bold;" class="col-sm-8">Expenses Form</label>
    </div>
  </div>
      <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Date</label>
          <div class="col-md-8">
      <input type="date" class="form-control" id="date" name="date" required="required">
    </div>
  </div>
  
    <%
    try{

	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from ex_type");  
	        ResultSet rs=ps.executeQuery();  
%>
<div class="form-group row">
      <label for="inputState" class="col-sm-2 col-form-label">Expense Type</label>
     <div class="col-md-8" style="padding-top: 12px;">
      <select name="exp_type" class="form-control" required>
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
      <label for="inputQuantity" class="col-sm-2 col-form-label">Description</label>
          <div class="col-md-8">
      <textarea name="descrp"  class="form-control" id="dis" required="required"></textarea>
    </div>
  </div>
  
        <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Ammount</label>
          <div class="col-md-8">
      <input type="number" class="form-control"name="ammount" id="amm" required="required">
    </div>
  </div>
      <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Expense Supplier<br>Name</label>
          <div class="col-md-8">
      <textarea name="ex_supp"  class="form-control" id="sup" required="required"></textarea>
    </div>
  </div>
      <%
    try{

	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from payment_mothod");  
	        ResultSet rs=ps.executeQuery();  
%>
<div class="form-group row">
      <label for="inputState" class="col-sm-2 col-form-label">Dealing Status</label>
     <div class="col-md-8" style="padding-top: 12px;">
      <select name="pay_method" class="form-control" required>
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
      <label for="inputQuantity" class="col-sm-2 col-form-label">Cheque number</label>
          <div class="col-md-8">
      <input type="text" class="form-control"name="chek_no" id="chq">
    </div>
    </div>
     <div class="position-absolute bottom2-left" style="padding-bottom: 110px;"> 
  <button type="submit" class="btn btn-primary" >Submit</button>
  <button type="button" onclick="reply_click(this)"class="btn btn-primary">Demo</button><br>
 
    </div>
</form>
    </div>
     <script>
    
    function reply_click(element)
    {
    document.getElementById('date').value = "09/24/2020";
	document.getElementById('dis').value = "post dated cheque";
	document.getElementById('amm').value = "25000";
	document.getElementById('sup').value = "John";
	document.getElementById('chq').value = "9987667";
    }    
    
</script>
    <!-- Filter data -->
    <% 
String query=request.getParameter("filter");
String data;
if(query!=null){
	List<Expenses> list=Expe_DAO.getAllRecords(query);  
	request.setAttribute("list",list);
	
}else{
	List<Expenses> list=Expe_DAO.getAllRecords(null);  
	request.setAttribute("list",list);
}

%>

<!-- --Table data -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <div class="col-sm" style="padding-top: 42px;padding-right: 60px;">
    <nav class="navbar navbar">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="filter">
    <button class="btn btn-primary" type="submit">Search </button>
  </form>
</nav>
      <table class="table table-hover">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Date</th>
      <th scope="col">Expen_Type</th>   
      <th scope="col">Description</th>
      <th scope="col">Amount</th> 
       <th scope="col">Sup_Name</th> 
        <th scope="col">Pay_method</th>  
         <th scope="col">Cheque_No</th>       
      <th scope="col">Action1</th> 
      <th scope="col">Action2<th> 
    </tr>
  </thead>
  <tbody>
<c:forEach items="${list}" var="u">  
    <tr>
      <th scope="row">${u.getId()}</th> 
      <td> ${u.getDate()}</td>
      <td> ${u.getExp_type()}</td>
      <td> ${u.getDescrp()}</td>
      <td> ${u.getAmmount()}</td>
      <td> ${u.getEx_supp()}</td>
      <td> ${u.getPay_method()}</td>
      <td> ${u.getChek_no()}</td>
<td> <button class="btn btn-warning" data-toggle="modal" onclick="location.href = 'updateExpen.jsp?id=${u.getId()}';">Update</button></td>
      <td> <button class="btn btn-danger" data-toggle="modal" onclick="location.href = 'deleteExpen.jsp?id=${u.getId()}';">Delete</button></td>
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