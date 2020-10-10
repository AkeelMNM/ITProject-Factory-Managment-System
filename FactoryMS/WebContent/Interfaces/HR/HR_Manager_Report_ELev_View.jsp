<%@page import="com.fms.model.E_Leave"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="fms.HR.service.EmployeeServiceImpt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.HR.service.EmployeeService"%>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Manager_Report_View_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Admin&Manager_Script.js"></script>
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
			<form method="POST" action="${pageContext.request.contextPath}/LeaveDetailsReportGenerateServlet">
			<table class="repviewtable">
			<tr>

			<td class="reptoolbartxt">Select Job:</td><td>
			<select name="jobList"  class="reviewdr" required>
									<%String key =null;
									key = (String) request.getAttribute("jName");
									if(key !=null){ %>
											<option value="<%=key%>"><%=key%></option>
									<%}else{ %>
									<option> --Select Job Name-- </option>
									<%} %>
									<%
									JobService jobservice = new JobServiceImpt();
									ArrayList<String> jobList =jobservice.getJobName();
									
									for(String name : jobList)
									{
								%>
							
										<option value="<%=name%>">  <%=name%>  </option> 			
									
								<%
									}
								%>
		
					</select></td>			
					<td class="reptoolbartxt">Select Employee:</td><td><select name="nameList"  class="reviewdr" >
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
					<td class="reptoolbartxt">Month:</td><td><select name="month" class="reviewdr" required> 
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
				</tr>
				</table>
				<input type="hidden" value="key" name="key">
				<input type="submit" value="View" id="viewbutton" name="viewbutton" style="margin-left:10px;">
				<input type="submit" value="Generate" id="genbutton" name="genbutton">
			</form>
		</div>
		
		<div class ="table">

			<%
			String Ename =null;
			String SMonth = null;
			String SKey = null;
			String jName = null;
			
			ArrayList<E_Leave> ELeaveList = new ArrayList<E_Leave>();
			ELeaveList=(ArrayList<E_Leave>) request.getAttribute("ElList");
			
			Ename =(String) request.getAttribute("EmpName");
			SMonth =(String) request.getAttribute("EPMonth");
			SKey=(String) request.getAttribute("Key");
			jName=(String) request.getAttribute("job");
			
			if(Ename == ""){
				Ename = null;
			}
		%>
		<%if(Ename == null && SMonth == null){ %>
		<table style="height: 49%;" width="100%">
			<tbody>
			<tr>
			<td style="width: 12.5043%; text-align:center;">&nbsp;The Report Preview will be Displayed here</td>
			</tr>
			</tbody>
		</table>

		<%
		}
		if(Ename == null && SKey != null){ %>
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
			<h4 style="margin-top:20px;">EMPLOYEES LEAVE IN A JOB REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ELeaveList.get(0).getMonth()%></td>
			</tr>
			
	
			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">MONTH REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">
	
			<table border="1" cellspacing="0" style="margin-left:50px; width:88.5%;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td class ="tDataS" >Job Title</td>
				<td  class ="tDataS" colspan="2"><%=ELeaveList.get(0).getJobTitle() %></td>
			</tr>
			<tr>
				<td  class ="tDataS">Month</td>
				<td class ="tDataS" colspan="2" ><%=ELeaveList.get(0).getMonth() %></td>
			</tr>
			<tr>
				<td  class ="tData">Employee Name</td>
				<td class ="tData">Date</td>
				<td class ="tData">Status</td>
			</tr>
				<tr>
					<%
						for(E_Leave lev: ELeaveList ){
					%>
						<td class ="tData"><%=lev.getEmpName() %></td>
						<td class ="tData"><%=lev.getDate() %></td>
						<td class ="tData"><%=lev.getLeave_Status() %></td>
						
				</tr>
				<%} %>
				</table>
			<%
				}
		
		if(Ename != null){ %>
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
			<h4 style="margin-top:20px;">EMPLOYEE LEAVE REPORT</h4>
			</td>
			<td style="width: 80.8px;" rowspan="2">Month:<%=ELeaveList.get(0).getMonth()%></td>
			</tr>
			

			<tr>
			<td style="width: 400px;"><span style="text-decoration: underline;">MONTH REPROT</span></td>
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px; width:88.5%;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td  class ="tDataS">Employee Name</td>
				<td class ="tDataS" ><%=ELeaveList.get(0).getEmpName() %></td>
			</tr>
			<tr>
				<td class ="tDataS" >Job Title</td>
				<td  class ="tDataS"><%=ELeaveList.get(0).getJobTitle() %></td>
			</tr>
			<tr>
				<td class ="tData">Date</td>
				<td class ="tData">Status</td>
			</tr>
				<tr>
					<%
						for(E_Leave lev: ELeaveList ){
					%>
						<td class ="tData"><%=lev.getDate() %></td>
						<td class ="tData"><%=lev.getLeave_Status() %></td>
						
				</tr>
				</table>
				<%
						}
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