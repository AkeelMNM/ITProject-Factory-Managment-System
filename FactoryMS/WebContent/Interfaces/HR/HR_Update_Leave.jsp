<%@page import="com.fms.model.E_Leave"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.HR.service.E_LeaveServiceImpt"%>
<%@page import="fms.HR.service.E_LeaveService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin_Update_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Admin&Manager_Script.js"></script>
</head>
<body>
<!-- +++++++++++++++++++++++++++++++++ Header Part +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
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
		<ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Admin_Home.jsp">Home
				<ul>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Purchase/Add_TeaLeaf_Suppliers.jsp">Purchase</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Production/production.jsp">Production</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Inventory/Add_Stock.jsp">Inventory</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Sales/Sales_Add_Factory_Sales.jsp">Sales</a></li>
					  <li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Expense/addExp.jsp">Exspesne</a></li>
				</a></ul>
				</li>
				  <li><a class="menu" href="#">Manage Employee</a></li>
				  <li><a class="menu" href="#">Manage Jobs</a></li>
				  <li><a class="menu" href="#">Employee Performance Tracking</a></li>
				  <li><a class="menu" href="#">Manage Account</a></li>
				  <li><a class="menu" href="#">Manage Employee Leaves</a></li>
		</ul>

<div id="bodyDiv">
		
		<!-- Body Part -->

		<%	
					String date = null;
					String month = null;
					String JTitle = null;
					String empJob = null;
					
					if(request.getParameter("Date") != null){
						
						empJob=request.getParameter("empJ");
						date = request.getParameter("Date");
						month = request.getParameter("umonth");
					}
					
					if((String)request.getAttribute("ldate") != null){
						
						date = (String)request.getAttribute("ldate");
						month = (String)request.getAttribute("rmonth");
						
					}
					
					E_LeaveService leaveservice = new E_LeaveServiceImpt();
					ArrayList<E_Leave> leavelist = leaveservice.getLeaveByDate(date,empJob);
					
					if(request.getParameter("Date") != null){
						JTitle = leavelist.get(0).getJobTitle();
					}
					if((String)request.getAttribute("ldate") != null){
						JTitle = (String)request.getAttribute("jT");
					}
		%>
		<div class ="left">
		<br>
		<label id="insertTit" style="margin-right:80%;">Job Details Update Form</label>
		
		<form method="POST" action="${pageContext.request.contextPath}/UpdateLeaveServlet">
		<table class="form" style="margin-top:2%;">
				<tr>
					<td style="text-align: center;">Date:</td>
					<td><input type="date" name="date" value="<%=date%>" required></td>
				</tr>
				<tr>
					<td style="text-align: center;">Month : </td>
					<td class="select">
						<select  name="month" style="width: 200px;" required> 
								<option value="<%=month%>"><%=month%></option>
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
				</tr>
				<tr>
					<td style="text-align: center;">Job Name : </td>
					<td class="select">
						<select   style="width: 200px;" Disabled> 
								<option value="<%=JTitle%>"><%=JTitle%></option>				
						</select>
						<input type="hidden" name="jName" value="<%=JTitle%>">
					</td>
				</tr>
					<tr><td style="text-align: center; text-decoration: underline;">Employee Name</td>
					<td  style="text-align: center; text-decoration: underline;">Absent</td></tr>
				<%
						for (int i=0; i<leavelist.size(); i++){
					        
				%>
				<tr>
					<td style="text-align: center">
						<select id="rest"  name="name[]" style="width: 150px;" > 
								<option value="<%=leavelist.get(i).getEmpName()%>">  <%=leavelist.get(i).getEmpName()%>  </option> 			
						</select>
					</td>
					<td style="text-align: center"><input type="checkbox" id="restch"  name="absent[]" value="Absent" checked></td>
					<td>
					<input type="hidden" name="did" value="<%=leavelist.get(i).getLeaveID()%>">
					<input type="submit" class="removebutton" value="Remove" name="rb">
					</td>
				</tr>
				<%
						}
				%>
			</table>
				<hr id="hrid" style="margin-top:7px;">
				<input type="submit" value="Update Leave Details" name="sb" class="submitbutton">
			</form>
				<a href="${pageContext.request.contextPath}/Interfaces/HR/HR_Add_Leave.jsp"><button class="deletebutton" style="margin-left:76.6%;" >Cancel</button></a>
		</div>

		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</div>
<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


</body>
</html>