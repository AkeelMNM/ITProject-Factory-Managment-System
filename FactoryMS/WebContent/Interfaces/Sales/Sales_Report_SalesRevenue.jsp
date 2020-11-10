<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fms.model.Sales_Revenue"%>
<%@page import="com.fms.model.Sales_Return"%>
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
/*   if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }
*/
	if((String)request.getAttribute("erMsg")!=null)
	{%>
	    <script>alert("Don't have Datas to View or Generate")</script>
	<%}

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
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/ReportMain.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_View.jsp">Sales Management</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_Report.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		
		<div class="ViewRepDiv">
			<form method="POST" action="${pageContext.request.contextPath}/Manager_Sales_Revenue_Report_GenerateServlet">
			<table class="BarTable">
				<tr>
					<td class="reptoolbartxt">Select Sales Type : </td>
					<td>
						<select name="SalesType" class="reviewdr" required>
							<%String key = null;
							key = (String) request.getAttribute("SalesType");
							if(key != null) { %>
								<option value="<%=key %>"> <%=key %> </option>
							<%}else{ %>
								<option>--Select Type--</option>
							<%} %>
							<option value="Auction">Auction</option>
							<option value="Local Sales"> Local Sales </option>
							<option value="Factory"> Factory </option>
						</select>
					</td>
				
					<td class="reptoolbartxt">Month:</td>
					<td>
						<select name="month" class="reviewdr" class="reviewdr" required>
							<%String key2 = null;
							key2 = (String) request.getAttribute("month");
							if(key2 != null) { %> 
								<option value="<%=key2 %>"> <%=key2 %> </option>
							<%} else{ %>
								<option> --Select Month-- </option>
							<%} %>
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
					
					<%String key3 =null;
					key3 = (String) request.getAttribute("Year");
					if(key3 != null) { %>
						<td><input type="number" name="year" id="reviewdate" value="<%=key3 %>" min="2019" max="2050" pattern="[0-9]{4}" required></td>
					<%}else { %>
						<td><input type="number" name="year" id="reviewdate" maxlength="4" min="2019" max="2050" pattern="[0-9]{4}" required></td>
					<%} %>
					
					<td class="month">
						<input type="radio" name="Option" value="Month" class="Option" checked> Month Report
					</td>
				</tr>
				<tr>
					<td colspan="6"></td>
					<td class="year" >
						<input type="radio" name="Option" value="Year" class="Option" > Year Report
					</td>
				</tr>
			</table>
      			<input type="submit" value="View" id="view_btn" name="viewbutton" >
      			<input type="submit" value="Generate" id="Generate_btn" name="genbutton" >
    		</form>
  		</div>
  		
  		
  		<%
	  		String ReYear =null;
			String ReMonth = null;
			
			ArrayList<Sales_Revenue> RevenueList = new ArrayList<Sales_Revenue>();
			RevenueList = (ArrayList<Sales_Revenue>) request.getAttribute("ReturnList");
			
			ReYear = (String) request.getAttribute("ReYear");
			ReMonth =(String) request.getAttribute("ReMonth");
			
			if(ReYear == "") {
				ReYear = null;
			}
  		
  		%>
  		
  		
  	<div class="table">
  		
  		<% if(ReYear == null && ReMonth == null){  %>
		<table style="height: 380px; width: 100%;">
			<tbody>
			<tr>
			<td style="width: 12.5043%; text-align:center;">&nbsp; <b>The Report Preview will be Displayed here </b> </td>
			</tr>
			</tbody>
		</table>
		
		<%	}
  		
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Monthly Report Table interface... +++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if(ReMonth != null && ReYear == null){ %>
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
			<h4 style="margin-top:20px; float:left; ">SALES REVENUE REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month: <%=ReMonth %> </td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline; float:left; ">MONTH REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:94%; float:left; margin-left:50px; width: 90%;">

			<table border="1" cellspacing="0" class="contentTable" >  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
				
				<tr>
					<th class ="tDataS"> Date of Sold</th>
					<th class ="tDataS"> Tea Grade</th>
					<th class ="tDataS"> Sold Quantity(kg)</th>
					<th class ="tDataS"> Revenue </th>
				</tr>
				
				<%
					for(Sales_Revenue re : RevenueList)
					{	
				%>
				<tr>
					<td class ="tData"><%=re.getDate() %> </td>
					<td class ="tData" ><%=re.getTea_Grade() %> </td>
					<td class ="tData" ><%=re.getSold_Quantity() %> </td>
					<td class ="tData" ><%=re.getAmount() %> </td>
				</tr>
				<%
	  				}
				%>
				
				<tr>
					<td colspan="2" style="padding-left: 25px ; padding: 8px;"> <b> Total Sold Quantity(kg) </b> </td>
				<%
					float sumQty = 0;
					for (int i = 0; i < RevenueList.size(); i++) {
					sumQty = sumQty +Float.parseFloat((RevenueList.get(i).getSold_Quantity()));
					}
					String Tot = String.valueOf(sumQty);
				%>
				<td> <b> <%=Tot %> </b> </td> 
				<td></td>
				</tr>
				
				<tr>
					<td colspan="3" style="padding-left: 25px ; padding: 8px;"> <b> Total Revenue(Rs) </b> </td>
				<%
					float sumAmo = 0;
					for (int i = 0; i < RevenueList.size(); i++) {
					sumAmo = sumAmo +Float.parseFloat((RevenueList.get(i).getAmount()));
					}
					String Total = String.valueOf(sumAmo);
				%>
				<td> <b> <%=Total %> </b> </td>
				</tr>
				
			</table>
		
		<%
  			}
  		
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Year Report Table interface... +++++++++++++++++++++++++++++++++++++++++++++++++++++*/

  		if(ReMonth == null && ReYear != null){ %>
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
			<h4 style="margin-top:20px; float:left;">SALES REVENUE REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Year: <%=RevenueList.get(0).getYear() %> </td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline; float:left;">YEAR REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px; width: 90%;">

			<table border="1" cellspacing="0" class="contentTable" >  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
		
				<tr>
					<th class ="tDataS"> No of Sold</th>
					<th class ="tDataS"> Month of Sold </th>
					<th class ="tDataS"> Tea Grade</th>
					<th class ="tDataS"> Sold Quantity(kg)</th>
					<th class ="tDataS"> Revenue </th>
				</tr>
				
				<%
					for(Sales_Revenue re : RevenueList)
					{	
						
				%>
				<tr>
					<td class ="tData"><%=re.getFactory_SalesID() %> </td> <!-- Count -->
					<td class ="tData" ><%=re.getMonth() %> </td>
					<td class ="tData" ><%=re.getTea_Grade() %> </td>
					<td class ="tData" ><%=re.getSold_Quantity() %> </td>
					<td class ="tData" ><%=re.getAmount() %> </td>
				</tr>
				<%
	  				}
				%>
			
				<tr>
					<td colspan="3" style="padding-left: 25px ; padding: 8px;"> <b> Total Sold Quantity(kg) </b> </td>
				<%
					float sumQty = 0;
					for (int i = 0; i < RevenueList.size(); i++) {
					sumQty = sumQty +Float.parseFloat((RevenueList.get(i).getSold_Quantity()));
					}
					String Tot = String.valueOf(sumQty);
				%>
				<td> <b> <%=Tot %> </b> </td>
				</tr>
				
				<tr>
					<td colspan="4" style="padding-left: 25px ; padding: 8px;"> <b> Total Revenue(Rs) </b> </td>
				<%
					float sumAmo = 0;
					for (int i = 0; i < RevenueList.size(); i++) {
					sumAmo = sumAmo +Float.parseFloat((RevenueList.get(i).getAmount()));
					}
					String Total = String.valueOf(sumAmo);
				%>
				<td> <b> <%=Total %> </b> </td>
				</tr>
				
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