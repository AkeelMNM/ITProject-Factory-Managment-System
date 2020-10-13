
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fms.model.TeaStock"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Manager_Report_View_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin&Manager_Script.js"></script>
</head>
<body>
<!-- Header Part -->
<%
   /* if((String)session.getAttribute("uid")==null)
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
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/index_maneger.html">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_View.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/reportUI.jsp">Exspense</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/ReportMain.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				<div class="vl"></div>
		<div class="viewlist">
			<form method="POST" action="${pageContext.request.contextPath}/TeaStockReportGenerateServlet">
			<table class="repviewtable">
			<tr>
					<td class="reptoolbartxt">Month:</td><td><select name="month" tabindex="2" class="reviewdr" required> 
								<%if((String) request.getAttribute("EPMonth") != null){ %>
											<option value="<%=(String) request.getAttribute("EPMonth")%>"><%=(String) request.getAttribute("EPMonth")%></option>
								<%}else{ %>
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
												
						</select></td>
					<td class="reptoolbartxt">Date:</td>
					<td><input type="date" name="r_date" id="reviewdate"></td>
					<input type="hidden" name="key" value ="CkhDate">
				</tr>
				</table>
				<input type="submit" value="View" id="viewbutton" name="viewbutton">
				<input type="submit" value="Generate" id="genbutton" name="genbutton" onclick="return alert('Report Generated Successfully')">
			</form>
		</div>
		
		<%
			String SDate =null;
			String SMonth = null;
			String SKey = null;
			String RepSucc = null;
			
			ArrayList<TeaStock> ptList = new ArrayList<TeaStock>();
			ptList=(ArrayList<TeaStock>) request.getAttribute("TSList");
			
			SDate =(String) request.getAttribute("EPDate");
			SMonth =(String) request.getAttribute("EPMonth");
			SKey=(String) request.getAttribute("Key");
			RepSucc=(String) request.getAttribute("message");
			
			if(SDate == ""){
				SDate = null;
			}
		%>
		
		<div class ="table">
		
		<%if(SDate == null && SMonth == null){ %>
		<table style="height: 49%;" width="100%">
			<tbody>
			<tr>
			<td style="width: 12.5043%; text-align:center;">&nbsp;The TeaStock Report Preview will be Displayed here</td>
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
			<h4 style="margin-top:20px;">TEA STOCK REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ptList.get(0).getMonth()%></td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">MONTH REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px; width:93% ;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td class ="tDataS">Month</td>
				<td colspan="4" class ="tDataS" ><%=ptList.get(0).getMonth()%></td>
			</tr>
				<tr>
						<th colspan="2" >Stored Date</th>
						<th >Tea Grade</th>
						<th >Stored Quantity</th>
						<th >Stored Location</th>
						
				</tr>
				<%
					for(TeaStock t : ptList){
				%>
				<tr >
						
						<td colspan="2" class ="tData"><%=t.getStoring_Date() %></td>
						<td class ="tData"><%=t.getTea_Grades() %></td>
						<td class ="tData"><%=t.getTea_Grades_Qty() %></td>
						<td class ="tData"><%=t.getLocation() %></td>
				</tr>
				<%  }
				
				%>
				<tr>
						<td style = "padding-left:800px; "colspan="3" >Total Stored Qty(Kg):</td>
						<% 
							float sumOT = 0;
					        for (int i = 0; i < ptList.size(); i++) {
								
					        	sumOT = sumOT +Float.parseFloat((ptList.get(i).getTea_Grades_Qty()));
							}
					        String Tot = String.valueOf(sumOT);
						%>
						<td colspan = "2" style =padding-left:65px;><%=Tot%></td>
				</tr>
				</table>
				<%
					
			}
			
			if(SDate != null && SMonth == null){ %>
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
			<h4 style="margin-top:20px;">TEA STOCK REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ptList.get(0).getMonth()%></td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">DAY REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px; width:93%">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td class ="tDataS">Month</td>
				<td colspan="2" class ="tDataS" ><%=ptList.get(0).getMonth()%></td>
			</tr>
				<tr>
						<th >Tea Grade</th>
						<th >Stored Location</th>
						<th >Stored Quantity</th>
						
				</tr>
				<%
					for(TeaStock t : ptList){
				%>
				<tr>
						<td class ="tData"><%=t.getTea_Grades() %></td>
						<td class ="tData"><%=t.getLocation() %></td>
						<td class ="tData"><%=t.getTea_Grades_Qty() %></td>
				</tr>
				<%
					}
				%>		
				<tr>
						<td style = "padding-left:750px ;colspan="2" >Total Stored Qty(Kg):</td>
						<%
							float sumOT = 0;
					        for (int i = 0; i < ptList.size(); i++) {
								
					        	sumOT = sumOT +Float.parseFloat((ptList.get(i).getTea_Grades_Qty()));
							}
					        String Tot = String.valueOf(sumOT);
						%>
						<td style = padding-left:250px ; colspan="2"><%=Tot%></td>
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