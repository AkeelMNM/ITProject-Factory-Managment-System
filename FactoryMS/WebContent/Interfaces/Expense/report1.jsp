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
String name=request.getParameter("exp_type");
String form_date=request.getParameter("form_date");
String to_date=request.getParameter("to_date");
//Connection connection = null;
//Statement statement = null;
//ResultSet resultSet = null;
%>
<html>
<head>
<title> Expense Report</title>>
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
	<h1>Report</h1>
		<!-- Body Part -->

<div class="row" style="padding-left: 84px;">
  <table class="table table-hover">
   <thead class="thead-dark">
<tr>
<td>Date</td>
<td>Exp_type</td>
<td>Discription</td>
<td>Sup_name</td>
<td>Payment type</td>
<td>Cheque_no</td>
<td>Amount</td>
</tr>
</thead>
<%
try{
	Connection con=DBConnection.getDBConnection(); 
	PreparedStatement ps=con.prepareStatement("select * from expenses where date between '"+form_date+"' and '"+to_date+"' and exp_type='"+name+"'");  
	ResultSet rs=ps.executeQuery();
double totalAmmount = 0;

while(rs.next())
{
	double tot=rs.getDouble("ammount");
	totalAmmount += tot ;
%>

<tr>
<td><%=rs.getString("date") %></td>
<td><%=rs.getString("exp_type") %></td>
<td><%=rs.getString("discrp") %></td>
<td><%=rs.getString("sup_name") %></td>
<td><%=rs.getString("p_method") %></td>
<td><%=rs.getString("chk_no") %></td>
<td><%=rs.getString("ammount") %></td>
</tr>
<%
}
%>
<td colspan="6">Total Amount</td>   
      <td id="total_1"><%=totalAmmount %></td>
<%

con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
    </div>
</div>
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>


</html>