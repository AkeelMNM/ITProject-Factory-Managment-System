<%@page import="java.sql.*"%>
<%@page import="com.fms.DBconnection.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Payroll/Admin_Styles.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Payroll/alertStyle.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Payroll/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="${pageContext.request.contextPath}/CSS & javaScript/Payroll/Admin_Manager_Script.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <title>Report</title>
    </head>
    <body  style="background-color:#222629">
        <!-- +++++++++++++++++++++++++++++++++ Header Part +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
             
   <%--   <%
    if((String)session.getAttribute("uid")==null)
    {
        response.sendRedirect("/FactoryMS/index.jsp");
    }

	%> --%>
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
        <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
        <ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Manager_Home.jsp">Home
                    <ul>
                        
	                </a></ul>
	    </li>
		</ul>
        <hr>

<div id="bodyDiv" style="min-height: 485px;">

    <!-- Body Part -->
	
	<table class = "gfg">
		<tr>
			<td>
				<div>
					<button type="button" onclick="" class="btn btn-primary" style="width:300px">Employee Salary Report</button>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>
					<button type="button" onclick="" class="btn btn-primary" style="width:300px">Employee Total Allowance Report</button>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>
				 	<button type="button" class="btn btn-primary" onclick="" style="width:300px">Employee Total Deduction Report</button>
				</div>
			</td>
		</tr>
	</table>
		<!-- <div class="container">
			<div class="row">
				<div class="col text-center">
               	 <button type="button" onclick="" class="btn btn-primary">Generate Report</button>
              	</div>
             </div>
                
            <div class="row">
            	<div class="col text-center">
               <th> <button type="button" onclick="" class="btn btn-primary">Generate Report</button></th>
               	</div>
              </div>
                
            <div class="row">
           	 <div class="col text-center">
              <th>  <button type="button" class="btn btn-primary" onclick="">Generate Report</button></th>
              	</div>
            </div>
          </div> -->
     
		
   

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

<!-- Footer Part -->
<hr>
<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>


</body>
</html>