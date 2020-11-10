
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fms.model.PaymentToSuppliers"%>
<%@page import="fms.Purchase.service.PaymenttoSuppliersimpt"%>
<%@page import="fms.Purchase.service.PaymenttoSuppliers"%>
<%@page import="fms.Purchase.service.SupplierServiceImpt"%>
<%@page import="fms.Purchase.service.SupplierService"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
		<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Purchase/Admin_Styles.css"> -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Manager_Report_View_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Admin&Manager_Script.js"></script>
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
					<button onclick="myFunction()" class="dropbtn"><%=(String)session.getAttribute("uname")%></button>
					 <div id="myDropdown" class="dropdown-content">
						<a href="${pageContext.request.contextPath}/Interfaces/Home/User_Profile.jsp">View Profile</a>
						<a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
					</div>
					
					</div>
				</div>
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>" alt="UserLogo" id="Userlogo"	>
						

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Manager_Home.jsp">Home
				<ul>
					 <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/reportUI.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/InventManager.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_View.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/reportUI.jsp">Exspesne</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/ReportMain.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href=""${pageContext.request.contextPath}/Interfaces/Purchase/lastreport.jsp">Purchase Management</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Manager.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				<div class="vl"></div>
		<div class="viewlist">
			<form method="POST" action="${pageContext.request.contextPath}/ReportGenarateServlet">
			<table class="repviewtable">
			<tr>
					<td class="reptoolbartxt">Select Supplier:</td><td><select name="emp_name" tabindex="10" class="reviewdr" required>
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
			<% SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
					Date date = new Date();
				%>
			
			<td style="width: 101px; height: 85px;" rowspan="4">Date:<%=formatter.format(date)%></td>
			
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
			<h4 style="margin-top:20px;"> TEA LEAF ORDER REORT </h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ptList.get(0).getMonth()%></td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">MONTH REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px;width:90%;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td colspan="2" class ="tDataS">Supplier Name</td>
				<td colspan="6" class ="tDataS" ><%=ptList.get(0).getName() %></td>
			</tr>
		
		
				<tr>
						<th colspan="2" >Date</th>
						<th >Quantity</th>
						<th >Payment Type</th>
						<th >Rate</th>
						<th >Value</th>
						<th >Net Amount</th>
				
						
				</tr>
				<%
					for(PaymentToSuppliers pt : ptList){
				%>
				<tr >
						
						<td colspan="2" class ="tData"><%=pt.getDate() %></td>
						<td class ="tData"><%=pt.getIspaid() %></td>
						<td class ="tData"><%=pt.getPayment_Type() %></td>
						<td class ="tData"><%=pt.getRate()%></td>
						<td class ="tData"><%=pt.getValue()%></td>
						<td class ="tData"><%=pt.getFinal_Amount() %></td>
					
						 
						
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
			<h4 style="margin-top:20px;">EMPLOYEE PERFORMANCE TRACKING &amp; TIME CARD REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ptList.get(0).getMonth()%></td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">DAY REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px; width:88.5%;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td  class ="tDataS">Supplier  Name</td>
				<td class ="tDataS" ><%=ptList.get(0).getName() %></td>
			</tr>
			<tr>
				<td class ="tDataS" >Quantity</td>
				<td  class ="tDataS"><%=ptList.get(0).getIspaid()%></td>
			</tr>
				<tr>
						<td class ="tDataS">Date</td>
						<td class ="tDataS"><%=ptList.get(0).getDate() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Value</th>
						<td class ="tDataS"><%=ptList.get(0).getValue() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS" >Rate</td>
						<td class ="tDataS"><%=ptList.get(0).getRate() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Net Amount</td>
						<td class ="tDataS"><%=ptList.get(0).getFinal_Amount() %></td>
				
				</tr>
				
				
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