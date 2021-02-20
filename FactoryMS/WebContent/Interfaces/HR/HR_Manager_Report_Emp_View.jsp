<%@page import="fms.HR.service.JobServiceImpt"%>
<%@page import="fms.HR.service.JobService"%>
<%@page import="com.fms.model.Employee"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/index_maneger.html">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/InventManager.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Manager_View.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/reportUI.jsp">Exspense</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Payroll/ReportMain.jsp">Payroll</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_View.jsp">HR Management</a></li>
				  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/HR/HR_Manager_Report.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				<div class="vl"></div>
		<div class="viewlist">
			<form  method="POST" action="${pageContext.request.contextPath}/EmpDetailsReportGenerateServlet">
			<table style="width:80%;margin-left:12%;" class="repviewtable">
			<tr>
				<td class="reptoolbartxt">Select Job:</td><td>
				<select name="jobList" class="reviewdr" required>
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
					<td class="reptoolbartxt">Select Employee:</td>
					<td style="width:18%;"><select name="empName"  class="reviewdr" required>
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
									
					</select></td>
					<td><input type="submit" name="getjob" value="Get Employee Names" class="datagenbutton"></td>
					<td><input type="submit" value="View" id="viewbutton" name="viewbutton" style="margin-left:60px;">
					<input type="submit" value="Generate" id="genbutton" name="genbutton" onclick="return alert('Report Generated Successfully')"></td>
				</tr>
				</table>
				
			</form>
		</div>
		
		<%
			String Check =null;
			
			Employee emp=(Employee) request.getAttribute("employee");
			
			Check =(String) request.getAttribute("Key");

		%>
		
		<div class ="table">
		
		<%if(Check == null){ %>
		<table style="height: 49%;" width="100%">
			<tbody>
			<tr>
			<td style="width: 12.5043%; text-align:center;">&nbsp;The Employee Details Report Preview will be Displayed here</td>
			</tr>
			</tbody>
		</table>

		<%
		}
		 if(Check != null){ %>
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
			<h4 style="margin-top:20px;">EMPLOYEE DETAILS REPORT</h4>
			</td>
			
			</tr>
			</tbody>
		</table>
		<hr style="width:90%; float:left; margin-left:50px;">

			<table border="1" cellspacing="0" style="margin-left:50px; width:88.5%;">  <!-- class="view" =table, class="viewTr"= tr, class ="tData" =td -->
			
			<tr>
				<td  class ="tDataS">Employee Name</td>
				<td class ="tDataS" ><%=emp.getName()%></td>
			</tr>
			<tr>
				<td class ="tDataS" >Job Title</td>
				<td  class ="tDataS"><%=emp.getJobTitle()%></td>
			</tr>
				<tr>
						<td class ="tDataS">Joined Date</td>
						<td class ="tDataS"><%=emp.getJointDate() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Date of Birth</th>
						<td class ="tDataS"><%=emp.getDOB() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS" >NIC</td>
						<td class ="tDataS"><%=emp.getNIC() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Gender</td>
						<td class ="tDataS"><%=emp.getGender()%></td>
				
				</tr>
				<tr>
						<td class ="tDataS">Marital Status</td>
						<td class ="tDataS"><%=emp.getMaritalStatus()%></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Contact No</td>
						<td class ="tDataS"><%=emp.getContactNo()%></td>
				</tr>
				<tr>
						<td class ="tDataS">Email</td>
						<td class ="tDataS"><%=emp.getEmail()%></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Address</td>
						<td class ="tDataS"><%=emp.getAddress() %></td>
						
				</tr>
				<tr>
						<td class ="tDataS">Qualification</td>
						<td class ="tDataS"><%=emp.getQualification()%></td>
						
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