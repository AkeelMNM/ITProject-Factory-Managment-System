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




</style>


<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin&Manager_Script.js"></script>

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
					<img src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" id="logo"> 
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
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>"	alt="UserLogo" id="Userlogo">
							

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
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
				   <!--  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp">Report</a></li>-->
				
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				
				
				<form method="POST" action="${pageContext.request.contextPath}/AddSupplierPayment">


<h2 class="heading" style="color:#596b70;" > Leaf Supplier Payment </h2>
		
	
	
	
		<table>
		
		<br><br><br>
		

	
		
		<tr>
			<td>Date :</td>	
			<td><input type="date"  name="Date" size="45" required ></td>
		</tr>
		
		<tr>
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
		</tr>
		
		
			<tr>
			
		
		 

			<td> Select Supplier Name </td><td><select name="supname" required id="new" >
			<option> ---Supplier Name--- </option>
			<%
				SupplierService supservice =new SupplierServiceImpt();
			ArrayList<String> namelist=supservice.getallSupplierName();
			
				for(String name : namelist)
				{
					
			%>
		<option value="<%=name%>"> <%=name%> </option> 
			
			<%
			
				}
			
			%>
			
	
		 </select>	</td>
		 
		 
		 	<tr>
			<td>Quantity</td>
			<td><input type="number" name="paid" size="45" id ="quantity" required oninput="calc();"></td>
		</tr>
		
				
			<tr>
			<td>Rate(Rs):</td>
			<td><input type="number" name="rate" size="45" id ="rate"  required  oninput="calc();"></td>
		</tr>
			<tr>
			<td>Value(Rs):</td>
			<td><input type="number" name="value" size="45" id ="total" required></td>
		</tr>
		
		<tr>
			<td>Final Amount(Rs):</td>
			<td><input type="text" name="finalamount" size="45"  required></td>
		</tr>
		
		<!--  <tr>
		
		 <label name="ispaid" required> <td>Paid?</td>	</label>
  		<td><input type="radio" id="paid" name="paid" value="yes" size="45" required>
  		<label for="male">Yes</label>
  		<input type="radio" id="paid" name="paid" value="no" required>
  		<label for="female">No</label><br></td>
		</tr>-->
		
		
		
		
		
		
		<tr>
		<td>Payment Type:</td>	
		<td> <input type="text"  name="paymenttype" size="45" required>   </td>    
		</tr>
		

			<tr>
		
			<td><input type="submit" value ="Save" class="btnsave"/></td>
		
			<td><input type="reset" value ="Reset"class="btnreset" /> </td>
		</tr>
		
		</table>
	</form>
	<br><br><br><br><br><br><br><br><br><br>
	<div class="tableview">

<br>
<table cellpadding="12">
	<caption>
		<form action=""  method="POST" >	
				<input type="text" placeholder="Search.." class="search" name="paysearch">
				<br>
		</form>
			<br><br>
		</caption>
		<br>
			
		
		
			<tr class="tableh">
			
				
				<th>Date</th>
				<th>Month</th>
				<th>Supplier Name</th>
				<th>Quantity</th>
				<th>Rate</th>
				<th>Value</th>
				<th>Final Amount</th>
				<!-- <th>Is Paid</th> -->
				
				<th>Payment Type</th>
				<th>Edit</th>
				<th>Delete</th>
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
			
				 <td><%=payment.getDate() %></td>
				 <td><%=payment.getMonth() %></td>
				 <td><%=payment.getName() %></td>
				 <td><%=payment.getIspaid() %></td>
				 <td><%=payment.getRate() %></td>
				 <td><%=payment.getValue() %></td>
				 <td><%=payment.getFinal_Amount() %></td>
				 
				 <td><%=payment.getPayment_Type() %></td>
				 
			
				<td>
					<form method="POST" action="${pageContext.request.contextPath}/Interfaces/Purchase/PaymenttosupplierUpdate.jsp">
						<input type="hidden" name="PaymentId" value="<%=payment.getPaymenID() %>" /> 
							<input type="submit" value="Edit" class="button1" />
					</form>
				</td>
				
				<td>
					<form method="POST" action="${pageContext.request.contextPath}/DeleteSupplierPayment">
						<input type="hidden" name="PaymentId" value="<%=payment.getPaymenID()%>" /> 
							<input type="submit" value="Delete" class="button2" />
					</form>
				</td>
			
			
		</tr>
		
		<%
			} 
		%>

		</table>

</div>
	
					<br><br><br><br><br><br><br><br><br>
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<hr>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>		
				
		
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</body>
</html>