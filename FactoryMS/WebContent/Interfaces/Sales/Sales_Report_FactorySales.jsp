<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fms.model.FactorySales"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Sales/Report_Style.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Sales/Sales_Admin&Manager_Script.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Header Part ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
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
						<img src="${pageContext.request.contextPath}/Interfaces/Home/getImages.jsp?id=<%=(String)session.getAttribute("uid")%>" alt="UserLogo" id="Userlogo">									

</div>
<hr>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Manager_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Manager.jsp">Purchase</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/reportUI.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/InventManager.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/reportUI.jsp">Exspesne</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/Manager.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="Sales_Manager_View.jsp">Sales Management</a></li>
				  <li><a class="menu" href="Sales_Manager_Report.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		
		<div class="ViewRepDiv">
			<form method="POST" action="${pageContext.request.contextPath}/Manager_Factory_Sales_Report_GenerateServlet">
			<table class="BarTable">
				<tr>
					<td class="reptoolbartxt">Select Sales Type : </td>
					<td>
						<select name="SalesType" class="reviewdr" required>
							<option>--Select Type--</option>
							<option value="Auction">Auction</option>
							<option value="Local Sales"> Local Sales </option>
							<option value="Factory"> Factory </option>
						</select>
					</td>
				
					<td class="reptoolbartxt">Month:</td>
					<td>
						<select name="month" class="Sele" class="reviewdr" required> 
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
						</select>
					</td>
					<td class="reptoolbartxt">Year :</td>
					<td><input type="number" name="year" id="reviewdate" required></td>
					<td class="month">
						<input type="radio" name="Option" value="Month" checked> Month Report
					</td>
				</tr>
				<tr>
					<td colspan="6"></td>
					<td class="year" >
						<input type="radio" name="Option" value="Year" > Year Report
					</td>
				</tr>
			</table>
      			<input type="submit" value="View" id="view_btn" name="viewbutton" >
      			<input type="submit" value="Generate" id="Generate_btn" name="genbutton" >
    		</form>
  		</div>
  		
  		<%
	  		String SYear =null;
			String SMonth = null;
			
			ArrayList<FactorySales> SalesList = new ArrayList<FactorySales>();
			SalesList = (ArrayList<FactorySales>) request.getAttribute("FactorySalesList");
			
			SYear = (String) request.getAttribute("FSyear");
			SMonth =(String) request.getAttribute("FSMonth");
			
			if(SYear == "") {
				SYear = null;
			}
  		
  		%>
  		
  		
  	<div class="table">
  		
  		<% if(SYear == null && SMonth == null){  %>
		<table style="height: 380px; width: 100%;">
			<tbody>
			<tr>
			<td style="width: 12.5043%; text-align:center;">&nbsp; <b>The Report Preview will be Displayed here </b> </td>
			</tr>
			</tbody>
		</table>
		
		<%	}
  		
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Monthly Report Table interface... +++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if(SMonth != null && SYear == null){ %>
		<table style="height: 137px; width: 88.5%; margin-left:50px;">
			<tbody>
			<tr style="height: 31px;">
			<td style="width: 12%; height: 85px;" rowspan="4"><img id="logo" src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" /></td>
			<td style="width: 316px; height: 31px;">
			<h2 style="margin-top:20px;"><strong>Dehiwatta Tea Factory</strong></h2>
			</td>
			
			<% SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy, HH:mm:ss");
				Date date = new Date();
			%>
			<td style="width: 101px; height: 85px;" rowspan="4">Date: <%=formatter.format(date) %></td>
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
			<h4 style="margin-top:20px; float:left; ">FACTORY SALES REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month: <%=SalesList.get(0).getMonth() %> </td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline; float:left; ">MONTH REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:94%; float:left; margin-left:50px; width: 90%;">

			<table border="1" cellspacing="0" class="contentTable" >  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			<tr>
				<th class ="tDataS"> Date of Sale</th>
				<th class ="tDataS"> Tea Grade</th>
				<th class ="tDataS"> Selling Quantity(kg)</th>
			</tr>
			
			<%
				for(FactorySales fs : SalesList)
				{	
			%>
			<tr>
				<td class ="tData"><%=fs.getDate() %> </td>
				<td class ="tData" ><%=fs.getTea_Grade() %> </td>
				<td class ="tData" ><%=fs.getSelling_Quantity() %> </td>
			</tr>
			<%
  				}
			%>
				</table>
		
		<%
  			}
  		
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Year Report Table interface... +++++++++++++++++++++++++++++++++++++++++++++++++++++*/

  		if(SMonth == null && SYear != null){ %>
  		<table style="height: 137px; width: 88.5%; margin-left:50px;">
			<tbody>
			<tr style="height: 31px;">
			<td style="width: 12%; height: 85px;" rowspan="4"><img id="logo" src="${pageContext.request.contextPath}/Images/MainLogo.jpeg" alt="MainLogo" /></td>
			<td style="width: 316px; height: 31px;">
			<h2 style="margin-top:20px;"><strong>Dehiwatta Tea Factory</strong></h2>
			</td>
			
			<% SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy, HH:mm:ss");
				Date date = new Date();
			%>
			<td style="width: 101px; height: 85px;" rowspan="4">Date: <%=formatter.format(date) %></td>
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
			<h4 style="margin-top:20px; float:left;">FACTORY SALES REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Year: <%=SalesList.get(0).getYear() %> </td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline; float:left;">YEAR REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px; width: 90%;">

			<table border="1" cellspacing="0" class="contentTable" >  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			<tr>
				<th class ="tDataS"> No of Sales</th>
				<th class ="tDataS"> Month of Sales </th>
				<th class ="tDataS"> Tea Grade</th>
				<th class ="tDataS"> Selling Quantity(kg)</th>
			</tr>
			
			<%
				for(FactorySales fs : SalesList)
				{	
					
			%>
			<tr>
				<td class ="tData"><%=fs.getTea_Grade_PriceID() %> </td>
				<td class ="tData" ><%=fs.getMonth() %> </td>
				<td class ="tData" ><%=fs.getTea_Grade() %> </td>
				<td class ="tData" ><%=fs.getSelling_Quantity() %> </td>
			</tr>
			<%
  				}
			%>
				</table>
		
		<%
  			}
		%>
		
  	</div>		
				
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</body>
</html>