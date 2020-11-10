<%@page import="com.fms.model.PaymentToSuppliers"%>
<%@page import="fms.Purchase.service.PaymenttoSuppliersimpt"%>
<%@page import="fms.Purchase.service.PaymenttoSuppliers"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>
<style>
.button1{
 background-color: #756d70;
  color: white;
   height: 25px;
    width: 60px;
    
  

}
.button2{
 background-color: #e06653;
  color: white;
    height: 25px;
    width: 60px;

}
</style>
</head>

<body>
<!-- Header Part -->

<!-- ////////////////////////////////////////////////////// -->
<%
    if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }

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
						<!-- <img src="UserPro.png" alt="UserLogo" id="Userlogo">		 -->
						
						<!-- ////////////////////////////////////////////////////// -->
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>" alt="UserLogo" id="Userlogo">
												
						<!-- ////////////////////////////////////////////////////// -->										
												

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
	<!-- 	 <ul><li><a class="menu" href="#">Home
				<ul>
					  <li><a class="menu" href="#">HR</a></li>
					  <li><a class="menu" href="#">Production</a></li>
					  <li><a class="menu" href="#">Inventory</a></li>
					  <li><a class="menu" href="#">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="#">Payroll</a></li>  -->
					  
					  
					  <ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Admin_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Employee.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/production.jsp">Production</a></li>
					  

					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/Add_Stock.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/addExp.jsp">Exspesne</a></li>
					  
				</a></ul>
				</li>
				   <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Leaforderentry.jsp">Leaf Order Entry</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Add_TeaLeaf_Suppliers.jsp">Suppliers</a></li>
				  <li><a class="menu" href="#">Payment to Suppliers</a></li>
				 <!--  <li><a class="menu" href="#">Report</a></li> -->
				
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		
		
		
			<%
		
		String PaymentID =request.getParameter("PaymentId");
		
		 PaymenttoSuppliers getPaymentByID =new PaymenttoSuppliersimpt();
		 PaymentToSuppliers payment =getPaymentByID.getPaymentByID(PaymentID);
		
		request.setAttribute("payment", payment);

		%>
			
				
				
				
	<form method="POST" action="${pageContext.request.contextPath}/UpdateSupplierPayment" style="margin-top:50px;">


		<table>

		
		
		<tr>
			<td>Date :</td>	
			<td><input type="date"  name="Date" size="55"value="<%=payment.getDate()%>"  ></td>
		</tr>
		
		
		
		<tr>
			<td>Month:</td>	
			<td><input type="text"  name="month" size="55" value="<%=payment.getMonth()%>" ></td>
		</tr>
		
		
		
		
		
		<tr>
			<td>Suppier Name :</td>	
			<td><input type="text"  name="name" size="55" value="<%=payment.getName()%>" disabled></td>
		</tr>
		
			<tr>
		  <td>Quantity</td>
  		<td><input type="text"  name="paid" value="<%=payment.getIspaid()%>" size="55" id ="quantity" oninput="calc();">
  		
		</tr>
			<tr>
			<td>Rate(Rs):</td>
			<td><input type="text" name="rate" size="55" value="<%=payment.getRate()%>"  id ="rate" oninput="calc();" ></td>
		</tr>
		
			<tr>
			<td>Value(Rs):</td>
			<td><input type="text" name="value" size="55"value="<%=payment.getValue()%>"id ="total" ></td>
		</tr>
		<tr>
			<td>Final Amount(Rs):</td>
			<td><input type="text" name="finalamount" size="55"value="<%=payment.getFinal_Amount() %>" ></td>
		</tr>
		
	

		<tr>
			<td>Payment Type:</td>	
		<td> <input type="text"  name="paymenttype" size="55"value="<%=payment.getPayment_Type()%>" >   </td>    
		</tr>
		
	

		
	<tr>	<br>
			<td><input type="submit" value ="Update" class="button1"/></td>
			<td><input type="hidden" name="PaymentID" value ="<%=payment.getPaymenID()%>"/></td>
		
			<td><input type="reset" value ="Reset"class="button2" /> </td>
		</tr>
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