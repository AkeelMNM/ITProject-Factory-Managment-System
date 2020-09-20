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
				  <li><a class="menu" href="Sales_Manager_View.jsp">Sales Management</a></li>
				  <li><a class="menu" href="Sales_Manager_Report.jsp">Report</a></li>
		</ul>

<div id="bodyDiv">
	
		<!-- Body Part -->
		
		<div class="ViewRepDiv">
			<form action="/action_page.php">
			<table class="BarTable">
				<tr>
					<td class="txtLabal">Month:</td>
					<td>
						<select name="month" class="Sele" required> 
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
					<td class="txtLabal">Date:</td>
					<td><input type="date" name="RepDate" class="Sele"></td>
				</tr>
			</table>
      			<input type="submit" id="view_btn" value="View" >
      			<input type="submit" id="Generate_btn" value="Generate" >
    		</form>
  		</div>
  		
  		<div class="table">
  		
	  		<h3 id="Report_H"> Factory Sales Report </h3>
  		
	  		<table id="ShowTable" >
				<tr class="viewTr">
			    	<th>Sales Type</th>
			    	<th>Date</th>
			    	<th>Tea Garde</th>
			    	<th>Selling Quantity</th>
				</tr>
			
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">150k</td>
				</tr>
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">150k</td>
				</tr>
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">150k</td>
				</tr>
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">150k</td>
				</tr>
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">850k</td>
				</tr>
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">150k</td>
				</tr>
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">150k</td>
				</tr>
				<tr class="viewTr">
						<td class ="TblData">Cash</td>
						<td class ="TblData" >2020/02/01</td>
						<td class ="TblData">Gold</td>
						<td class ="TblData">150k</td>
				</tr>
				
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