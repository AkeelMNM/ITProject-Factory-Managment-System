<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fms.model.PerformanceTracking"%>
<%@page import="fms.HR.service.PerformanceTrackingServiceImpt"%>
<%@page import="fms.HR.service.PerformanceTrackingService"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.HR.service.EmployeeService"%>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Manager_Report_View_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin&Manager_Script.js"></script>
</head>
<body>
<!-- Header Part -->
<%
    /*if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }*/

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
					  <li><a class="menu" href="#">Purchase</a></li>
					  <li><a class="menu" href="#">Production</a></li>
					  <li><a class="menu" href="#">Inventory</a></li>
					  <li><a class="menu" href="#">Sales</a></li>
					  <li><a class="menu" href="#">Exspesne</a></li>
					  <li><a class="menu" href="#">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR Management</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_Report.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				<div class="vl"></div>
		<div class="viewlist">
			<form method="POST" action="${pageContext.request.contextPath}/EPTReportGenerateServlet">
			<table class="repviewtable">
			<tr>
			<td class="reptoolbartxt">Select Job:</td><td><select name="emp_job" tabindex="10" class="reviewdr" required>
									<%String key =null;
									key = (String) request.getAttribute("jName");
									if(key !=null){ %>
											<option value="<%=key%>"><%=key%></option>
									<%}else{ %>
									<option> --Select Job Name-- </option>
									<%} %>
									<%
									JobService jobservice= new JobServiceImpt();
									ArrayList<String> jobList =jobservice.getJobName();
									
									for(String name : jobList)
									{
								%>
							
										<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>  
									
					</select></td>
					<td class="reptoolbartxt">Select Employee:</td><td><select name="emp_name" tabindex="10" class="reviewdr" required>
									<%if((String) request.getAttribute("name") != null){ %>
											<option value="<%=(String) request.getAttribute("name")%>"><%=(String) request.getAttribute("name")%></option>
									<%}else{ %>
										<option> --Select Name-- </option>
									<%} %>
									<%
									EmployeeService empservice= new EmployeeServiceImpt();
									ArrayList<String> nameList =empservice.getAllEmployeeNameByJobTitle(key);
									
									for(String name : nameList)
									{
								%>
							
										<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>  
									
					</select></td><td><input type="submit" name="getjob" value="Get Employee Names" class="datagenbutton"></td>
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
			
			ArrayList<PerformanceTracking> ptList = new ArrayList<PerformanceTracking>();
			ptList=(ArrayList<PerformanceTracking>) request.getAttribute("PerTList");
			
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
			<h4 style="margin-top:20px;">EMPLOYEE PERFORMANCE TRACKING &amp; TIME CARD REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ptList.get(0).getMonth()%></td>
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
				<td colspan="7" class ="tDataS" ><%=ptList.get(0).getEmpName() %></td>
			</tr>
			<tr>
				<td colspan="2" class ="tDataS" >Job Title</td>
				<td colspan="7" class ="tDataS"><%=ptList.get(0).getJobTitle() %></td>
			</tr>
			<tr>
				<td colspan="2" class ="tDataS">Overall Performance</td>
				<%
					int ovP = 0; 
					for(int i=0;i<ptList.size();i++){
						
						ovP = ovP +Integer. parseInt(ptList.get(i).getPerformace());
					}
					int ovPSum = ovP/ptList.size();
				%>
				<td colspan="7" class ="tDataS">
				<%
							int staremptyOP = 5 - ovPSum;
							
							for(int i = 0;i < ovPSum;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/FullStar.png" alt="FullStar" class="FullStar">
						<%
							}
							for(int i = 0;i < staremptyOP;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/EmptyStar.png" alt="EmptyStar" class="EmptyStar">
						<%
							}
						%>
				</td>
			</tr>
				<tr>
						<th colspan="2" >Date</th>
						<th >Time In</th>
						<th >Lunch In</th>
						<th >Lunch Out</th>
						<th >Time Out</th>
						<th >Over Time</th>
						<th >Performance</th>
						<th >Description</th>
						
				</tr>
				<%
					for(PerformanceTracking pt : ptList){
				%>
				<tr >
						
						<td colspan="2" class ="tData"><%=pt.getDate() %></td>
						<td class ="tData"><%=pt.getTimeIn() %></td>
						<td class ="tData"><%=pt.getLunchIn() %></td>
						<td class ="tData"><%=pt.getLunchOut() %></td>
						<td class ="tData"><%=pt.getTimeOut()%></td>
						<td class ="tData"><%=pt.getOvetTime() %></td>
						<td class ="tData">
						<%int starfull =Integer. parseInt(pt.getPerformace());
							int starempty = 5 - starfull;
							
							for(int i = 0;i < starfull;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/FullStar.png" alt="FullStar" class="FullStar">
						<%
							}
							for(int i = 0;i < starempty;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/EmptyStar.png" alt="EmptyStar" class="EmptyStar">
						<%
							}
						%>
						</td>
						<td class ="tData"><%=pt.getDescription() %></td>
						
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
				<td  class ="tDataS">Employee Name</td>
				<td class ="tDataS" ><%=ptList.get(0).getEmpName() %></td>
			</tr>
			<tr>
				<td class ="tDataS" >Job Title</td>
				<td  class ="tDataS"><%=ptList.get(0).getJobTitle() %></td>
			</tr>
				<tr>
						<td class ="tDataS">Date</td>
						<td class ="tDataS"><%=ptList.get(0).getDate() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Time In</td>
						<td class ="tDataS"><%=ptList.get(0).getTimeIn() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS" >Lunch In</td>
						<td class ="tDataS"><%=ptList.get(0).getLunchIn() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Lunch Out</td>
						<td class ="tDataS"><%=ptList.get(0).getLunchOut() %></td>
				
				</tr>
				<tr>
						<td class ="tDataS">Time Out</td>
						<td class ="tDataS"><%=ptList.get(0).getTimeOut()%></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Over Time</td>
						<td class ="tDataS"><%=ptList.get(0).getOvetTime() %></td>
				</tr>
				<tr>
						<td class ="tDataS" >Performance</td>
						<td class ="tDataS" >
						<%int starfull =Integer. parseInt(ptList.get(0).getPerformace());
							int starempty = 5 - starfull;
							
							for(int i = 0;i < starfull;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/FullStar.png" alt="FullStar" class="FullStar">
						<%
							}
							for(int i = 0;i < starempty;i++){
						%>
							<img src="${pageContext.request.contextPath}/Images/EmptyStar.png" alt="EmptyStar" class="EmptyStar">
						<%
							}
						%>
						</td>
				</tr>
				<tr>
						<td class ="tDataS">Description</td>
						<td class ="tDataS"><%=ptList.get(0).getDescription() %></td>
						
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