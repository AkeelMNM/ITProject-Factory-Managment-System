
<%@page import="fms.Purchase.service.SupplierServiceImpt"%>
<%@page import="fms.Purchase.service.SupplierService"%>
<%@page import="com.fms.model.PaymentToSuppliers"%>
<%@page import="fms.Purchase.service.PaymenttoSuppliersimpt"%>
<%@page import="fms.Purchase.service.PaymenttoSuppliers"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
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
					<div class="dropdown">
							  <button onclick="myFunction()" class="dropbtn">User Name</button>
									  <div id="myDropdown" class="dropdown-content">
											<a href="#home">View Profile</a>
											<a href="#about">Logout</a>
									  </div>
					</div>
				</div>
						<img src="UserPro.png" alt="UserLogo" id="Userlogo">								

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="#">Home
				<ul>
					  <li><a class="menu" href="#">Purchase</a></li>
					  <li><a class="menu" href="#">Production</a></li>
					  <li><a class="menu" href="#">Inventory</a></li>
					  <li><a class="menu" href="#">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="#">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR Management</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/leaforderreportnew.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				<div class="vl"></div>
		<div class="viewlist">
	 		<form method="POST" action="${pageContext.request.contextPath}/ViewSupplierPayment">
			<table class="repviewtable">
			<tr>
					<td class="reptoolbartxt">Select Employee:</td><td><select name="emp_name" tabindex="10" class="reviewdr" required>
									<option> --Select Name-- </option> 
									<%
									 SupplierService supservice = new SupplierServiceImpt();
									ArrayList<String> nameList =supservice.getallSupplierName();
									
			
									
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
			</form>
		</div>
		
		<%
			String SDate =null;
			String SMonth = null;
			String SKey = null;
			
			ArrayList<PaymentToSuppliers> ptList = new ArrayList<PaymentToSuppliers>();
			ptList=(ArrayList<PaymentToSuppliers>) request.getAttribute("PerTList");
			
			SDate =(String) request.getAttribute("EPDate");
			SMonth =(String) request.getAttribute("EPMonth");
			SKey=(String) request.getAttribute("Key");
			
			if(SDate == ""){
				SDate = null;
			}
		%>
		
		<div class ="table">
		
		<%if(SDate == null && SMonth == null){ %>
		<table style="height: 49%;" width="100%">
			<tbody>
			<tr>
			<td style="width: 12.5043%; text-align:center;">&nbsp;The Report Preview will be Displayed here</td>
			</tr>
			</tbody>
		</table>

		<%
		}
		
		if(SMonth != null && SDate == null){ %>
		<table style="height: 137px; width: 88.5%; margin-left:50px;">
			<tbody>
			<tr style="height: 31px;">
			<td style="width: 12%; height: 85px;" rowspan="4"><img id="logo" src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" /></td>
			<td style="width: 316px; height: 31px;">
			<h2 style="margin-top:20px;"><strong>Dehiwatta Tea Factory</strong></h2>
			</td>
			<td style="width: 101px; height: 85px;" rowspan="4">Date:</td>
			</tr>
			<tr style="height: 18px;">
			<td style="width: 316px; height: 18px;">Address : Hapugahayatatenna,Handessa</td>
			</tr>
			<tr style="height: 18px;">
			<td style="width: 316px; height: 18px;">Tel : 0815630035</td>
			</tr>
			<tr style="height: 18px;">
			<td style="width: 316px; height: 18px;">Email : nmmbrosdtf@gmail.com</td>
			</tr>
			</tbody>
		</table>
		
		
		<hr style="width:90%; float:left; margin-left:50px;">
		<table style="height: 112px; width: 88.5%; margin-left:50px;">
			<tbody>
			<tr>
			<td style="width: 400px;">
			<h4 style="margin-top:20px;">TEA LEAF ORDER &amp;  REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ptList.get(0).getDate()%></td> 
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">MONTH REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td colspan="2" class ="tDataS">Employee Name</td>
				<td colspan="7" class ="tDataS" ><%=ptList.get(0).getName() %></td>
			</tr>
			<tr>
				<td colspan="2" class ="tDataS" >Job Title</td>
				<td colspan="7" class ="tDataS"><%=ptList.get(0).getIspaid() %></td>
			</tr>
		
				<tr>
						<th colspan="2" >Date Of Order</th>
						<th >Supplier Name</th>
						<th >Quantity</th>
					
						
				</tr>
				<%
					for(PaymentToSuppliers pt : ptList){
				%>
				<tr >
						
						<td colspan="2" class ="tData"><%=pt.getDate() %></td>
						<td class ="tData"><%=pt.getName()%></td>
						<td class ="tData"><%=pt.getIspaid()%></td>
						
					
						
						
				</tr>
				</table>
				<%
					}
			}
			
			if(SDate != null && SKey != null){ %>
			<table style="height: 137px; width: 88.5%; margin-left:50px;">
				<tbody>
				<tr style="height: 31px;">
				<td style="width: 12%; height: 85px;" rowspan="4"><img id="logo" src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" /></td>
				<td style="width: 316px; height: 31px;">
				<h2 style="margin-top:20px;"><strong>Dehiwatta Tea Factory</strong></h2>
				</td>
				<td style="width: 101px; height: 85px;" rowspan="4">Date:</td>
				</tr>
				<tr style="height: 18px;">
				<td style="width: 316px; height: 18px;">Address : Hapugahayatatenna,Handessa</td>
				</tr>
				<tr style="height: 18px;">
				<td style="width: 316px; height: 18px;">Tel : 0815630035</td>
				</tr>
				<tr style="height: 18px;">
				<td style="width: 316px; height: 18px;">Email : nmmbrosdtf@gmail.com</td>
				</tr>
				</tbody>
		</table>

		<hr style="width:90%; float:left; margin-left:50px;">
		<table style="height: 112px; width: 88.5%; margin-left:50px;">
			<tbody>
			<tr>
			<td style="width: 400px;">
			<h4 style="margin-top:20px;">TEA LEAF ORDER ENTRY REPORT&amp; </h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ptList.get(0).getDate()%></td><!-- month -->
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">DAY REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px; width:88.5%;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td  class ="tDataS">Supplier Name</td>
				<td class ="tDataS" ><%=ptList.get(0).getName() %></td>
			</tr>
			<tr>
				<td class ="tDataS" >Quantity</td>
				<td  class ="tDataS"><%=ptList.get(0).getIspaid() %></td>
			</tr>
				<tr>
						<td class ="tDataS">Date Of Order</td>
						<td class ="tDataS"><%=ptList.get(0).getDate() %></td>
						
	
				</table>
				<%
					}
				%>		
				<br>
		</div>
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>


	<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>


</html>