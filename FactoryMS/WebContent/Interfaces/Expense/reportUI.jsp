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
<%
//Connection connection = null;
//Statement statement = null;
//ResultSet resultSet = null;
%>
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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
$( function() {
$( "#datepicker" ).datepicker({ changeMonth: true, changeYear: true });
$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
} );
</script>
<script>
$( function() {
$( "#datepicker1" ).datepicker({ changeMonth: true, changeYear: true });
$( "#datepicker1" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
} );
</script>
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


<div id="bodyDiv" style="min-height: 485px;">
	
		<!-- Body Part -->

<div class="row">
    <div class="col-sm">
<form method="post" action="report1.jsp">
      <div class="form-group row" style="padding-top: 25px;">
      <label for="inputQuantity" class="col-sm-2 col-form-label">From Date:</label>
          <div class="col-md-8">
      <input type="text" class="form-control" id="datepicker" name="form_date" required="required" style="width: 298px;">
    </div>
  </div>
        <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">To Date:</label>
          <div class="col-md-8">
      <input type="text" class="form-control" id="datepicker1" name="to_date" required="required" style="width: 298px;">
    </div>
  </div>
<%
try{
Connection con=DBConnection.getDBConnection(); 
PreparedStatement ps=con.prepareStatement("select * from ex_type");  
ResultSet rs=ps.executeQuery();  
%>
<div class="form-group row">
      <label for="inputState" class="col-sm-2 col-form-label">Expen Type</label>
     <div class="col-md-8" style="padding-top: 12px;">
      <select name="exp_type" class="form-control" required style="width: 298px;">
<option value="" disabled selected>Choose Expenses type</option>
<%
while(rs.next()) {
%>
<option><%= rs.getString(2)%></option>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</select>
<input type="submit" value="Generate Report" class="btn btn-primary"><br>
</div>
</div>
<!-- --Table data -->


    <div class="col-sm" style="padding-top: 42px;padding-right: 60px;">
    <nav class="navbar navbar">

</nav>

    </div>
    </form>
</div>

				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>


</html>