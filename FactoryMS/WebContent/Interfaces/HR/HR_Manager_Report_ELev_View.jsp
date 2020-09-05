<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/HR/HR_Manager_Report_View_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/CSS & javaScript/Admin&Manager_Script.js"></script>
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
				  <li><a class="menu" href="#">HR Management</a></li>
				  <li><a class="menu" href="#">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
				
				<div class="vl"></div>
		<div class="viewlist">
			<form>
			<table class="repviewtable">
			<tr>
					<td class="reptoolbartxt">Select Employee:</td><td><select name="db_tables"  class="reviewdr" required>
									<option> --Select Name-- </option> 
									<option value="Employee"> Employee </option>
									<option value="Perfomance_Tracking"> Performance Tracking </option>
									<option value="Account"> Accounts </option>
									<option value="Jobs"> Jobs </option>
									<option value="E_Leave"> Employee Leave </option>  
									
					</select></td>
					<td class="reptoolbartxt">Month:</td><td><select name="month" class="reviewdr" required> 
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
				</tr>
				</table>
				<input type="submit" value="View" id="viewbutton">
				<input type="submit" value="Generate" id="genbutton">
			</form>
		</div>
		
		<div class ="table">

			<table class="view">
				<tr class="viewTr">
						<th >Employee Name</th>
						<th >Date</th>
						<th >Month</th>
						<th >Status</th>
						
				</tr>
				<%
					for(int i= 0 ; i<10;i++){
				%>
				<tr class="viewTr">
						<td class ="tData" >Mohamed Akeel</td>
						<td class ="tData">2020/02/01</td>
						<td class ="tData">199842626411</td>
						<td class ="tData">Male</td>

						
				</tr>
				<%
					}
				%>

					<!--  <tr>
						<td><%//=attendance.getEmployee()%></td>
						<td><%//=attendance.getDepartment()%></td>
						<td><%//=attendance.getToday_Date()%></td>
						<td><%//=attendance.getStart_Time()%></td>
						<td><%//=attendance.getEnd_Time()%></td>
						<td></td>
						<td><form method="POST" action="${pageContext.request.contextPath}/DeleteAttendanceServlet">
								<input type="hidden" name ="AttID" value="<%//=attendance.getAttendanceID()%>">
								<input type="hidden" name ="EID" value="<%//=EmployeeID%>">
								<input type="submit" value="Remove Attendance" class="editbutton">
						</form></td>
					</tr>-->
						
				</table>
		</div>
				
				
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

	<!-- Footer Part -->
	<div style="float:left; width:100%; margin-top:-4px;"><hr></div>
	<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>

	<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</body>


</html>