<%@page import="fms.Purchase.service.PaymenttoSuppliersimpt"%>
<%@page import="fms.Purchase.service.PaymenttoSuppliers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fms.model.PaymentToSuppliers"%>
<%@page import="fms.Purchase.service.Purchase_SearchServiceImpt"%>
<%@page import="fms.Purchase.service.Purchase_SearchService"%>
<%@page import="fms.Purchase.service.SupplierService"%>
<%@page import="fms.Purchase.service.SupplierServiceImpt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<style>
.tableview{

float:right;
  position: absolute;
    height: 200px;
    width: 400px;
    margin: -100px 0 0 -200px;
    top: 50%;
    right: 30%;
}
.button1{
 background-color: #756d70;
  color: black;
   height: 25px;
    width: 60px;
    
  

}
.button2{
 background-color: #e06653;
  color: black;
    height: 25px;
    width: 60px;

}
.button3{
 background-color: #289c96#f7025c;
  color: black;
   height: 25px;
    width: 60px;

}
.tableh{
 background-color: #0a5c54;
  color: white;

}
.search{

 height: 20px;
    width: 500px;
  

}

.tabled{

background-color:#a0dbd6;
}

.center {
  margin-left: auto;
  margin-right: auto;
}
.title1{

font-family:'Gabriela';
	font-size:30px;
	color:  #0a5c54;
	padding-left:60px;
text-decoration-line: underline;

}


</style>


<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>

</head>

<body>
<!-- Header Part -->
<div id="headDiv">
					<img src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" id="logo"> 
				<div id="name">
					<label id="title">Dehiwatta Tea Factory</label><br>
					<label id="address">Hapugahayatatenna,Handessa</label>
				</div>
				<div id="manage">
					<!-- <div class="dropdown">
							  <button onclick="myFunction()" class="dropbtn">User Name</button>
									  <div id="myDropdown" class="dropdown-content">
											<a href="#home">View Profile</a>
											<a href="#about">Logout</a>
									  </div>-->	
					</div> 
				</div>
					<!--<img src="UserPro.png" alt="UserLogo" id="Userlogo">		  -->					

</div>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
	<!--  <ul><li><a class="menu" href="#">Home
				<ul>
					  <li><a class="menu" href="#">Purchase</a></li>
					  <li><a class="menu" href="#">Production</a></li>
					  <li><a class="menu" href="#">Inventory</a></li>
					  <li><a class="menu" href="#">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="#">Payroll</a></li>
				</a></ul>
				</li>
				   <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Leaforderentry.jsp">Leaf Order Entry</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Add_TeaLeaf_Suppliers.jsp">Suppliers</a></li>
				  <li><a class="menu" href="#">Payment to Suppliers</a></li>
				  <li><a class="menu" href="#">Report</a></li>
				
		</ul>-->	
		
		
		
		

<div id="bodyDiv">
<br>
<label class="title1">TEA LEAF ORDER REPORT</label>
	
		<!-- Body Part -->
				<div class="viewlist">
		<!-- <form method="POST" action="${pageContext.request.contextPath}/EPTReportGenerateServlet">
			<table class="repviewtable">
			<tr>
					<td class="reptoolbartxt">Select Employee:</td><td><select name="emp_name" tabindex="10" class="reviewdr" required>
									<option> --Select Name-- </option> 
									<%
									SupplierService empservice= new SupplierServiceImpt();
									ArrayList<String> nameList =empservice.getallSupplierName();
									
									for(String name : nameList)
									{
								%>
							
										<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>  
									
					</select></td>
					<td class="reptoolbartxt">Month:</td><td><select name="month" tabindex="2" class="reviewdr" required> 
								<option> --Select Month-- </option>
								<option value="January">January</option>
								<option value="February"> February </option>
								<option value="March"> March </option>
								<option value="April"> April </option>
								<option value="May"> May </option>
								<option value="June"> June </option>
								<option value="July"> July </option>
								<option value="August"> August </option>
								<option value="September"> September </option>
								<option value="October"> October </option>
								<option value="November"> November </option>
								<option value="December"> December </option>
												
						</select></td>
					<td class="reptoolbartxt">Date:</td>
					<td><input type="date" name="r_date" id="reviewdate"></td>
					<input type="hidden" name="key" value ="CkhDate">
				</tr>
				</table>
				<input type="submit" value="View" id="viewbutton" name="viewbutton">
				<input type="submit" value="Generate" id="genbutton" name="genbutton">
			</form> -->	
		</div>	
	

<br>
<table cellpadding="12" class="center">
	<caption>
		<form action=""  method="POST" >	
				<input type="text" placeholder="Search.." class="search" name="paysearch">
				<!--  <input type="submit" value="Generate " id="viewbutton" name="viewbutton">
				<input type="submit" value="Print" id="genbutton" name="genbutton">-->
				<br>
		</form>
		
			<br><br>
		</caption>
		<br>
			
		
		
			<tr class="tableh">
			
				<th>Order ID</th>
				<th>Supplier Name</th>
				<th>Purchase Date</th>
					<th>Purchase Month</th>
				
				<th>Purchase Quantity</th>
				<th>Payment Type</th>
				<th>Rate</th>
				<th>Value</th>
				<th>Net Amount</th>
				
				
			
			</tr>
			
			
			<%					
					PaymenttoSuppliers paymentservice= new PaymenttoSuppliersimpt();
  				
					ArrayList<PaymentToSuppliers> paymentList=new ArrayList<PaymentToSuppliers>();
					
  				String data=request.getParameter("paysearch");
  				
  				if(data != null) 
  				{
  					Purchase_SearchService purchasesearch=new Purchase_SearchServiceImpt();
  					paymentList=purchasesearch.SearchTeaLeafpayment(data);

  				}
  				
  				
  					else{
  						
  						paymentList=paymentservice.getpayment();
  					}
  				
				
					for(PaymentToSuppliers payment : paymentList)
					{
						
			%>			
			
		<tr class="tabled">
		
			     <td><%=payment.getPaymenID()%></td>
				
				 <td><%=payment.getName() %></td>
				  <td><%=payment.getDate() %></td>
				   <td><%=payment.getMonth() %></td>
				  
				  <td><%=payment.getIspaid() %></td>
				  <td><%=payment.getPayment_Type() %></td>
				 <td><%=payment.getRate() %></td>
				 <td><%=payment.getValue() %></td>
				 <td><%=payment.getFinal_Amount() %></td>
				
				 
				 
	
		</tr>
		
		<%
			} 
		%>
		
		</table>

<br><br><br><br><br><br><br><br><br><br><br>
	
			
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>		
				
		
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</body>
</html>