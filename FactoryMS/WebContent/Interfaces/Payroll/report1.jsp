<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.fms.DBconnection.*"%>
<%@ page import="java.sql.*" %>

<%ResultSet resultset =null;

%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="../../CSS & javaScript/Payroll/Admin_Styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../../CSS & javaScript/Payroll/Admin&Manager_Script.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href=" https://printjs-4de6.kxcdn.com/print.min.css">
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
		<!-- Body Part -->

<div id="bodyDiv" style="min-height: 485px;">
<div class="col-sm" style="padding-top: 42px;padding-right: 60px;padding-left: 60px;">
<div class="row" style="padding-left: 84px;">
  <table class="table table-hover">
   <thead class="thead-dark">
<tr>
<td>Employee name</td>
<td>DOB</td>
<td>Total Allowance</td>
<td>Total Deduction</td>
<td>Net Salary</td>
</tr>
</thead>	

<% 

	try{
		

		String empID = request.getParameter("empID");
	
		PreparedStatement ps=DBConnection.getDBConnection().prepareStatement(
				"select * from salary INNER JOIN employee ON salary.EmpID=employee.EmpID where employee.EmpID ='" + empID + "'");  
		ResultSet rs=ps.executeQuery();
	
while(rs.next())
{
	
%>
<tr>

	<td><%=rs.getString("employee.employee_name") %></td>
	<td><%=rs.getString("dob") %></td>
	<td><%=rs.getString("total_allowance") %></td>
	<td><%=rs.getString("total_deduction") %></td>
	<td><%=rs.getString("net_salary") %></td>

</tr>
<%
}
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
    <nav class="navbar navbar">
  <form class="form-inline">
    <button class="btn btn-light" onclick="window.print()">Print report</button>
  </form>
</nav>
<%
DBConnection.getDBConnection().close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
    </div>
</div>

</div>
</body>
</html>