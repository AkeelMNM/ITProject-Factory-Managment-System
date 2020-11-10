<%@page import="java.sql.ResultSet"%>
<%@page import="com.fms.DBconnection.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Payroll/Admin_Styles.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="${pageContext.request.contextPath}/CSS & javaScript/Payroll/Admin_Manager_Script.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <script>
            var specialKeys = new Array();
            specialKeys.push(8);
            function IsNumeric(e)
            {
                var keyCode = e.which ? e.which : e.keyCode
                var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
                //document.getElementById("error").style.display = ret ? "none" : "inline";  
                return ret;
            }

            function calculateTotal2() {
                var medical = document.getElementById('monthlyMedical').value;
                var bonus = document.getElementById('monthlyBonus').value;
                var hours = document.getElementById('monthlyHours').value;
                var rates = document.getElementById('monthlyRate').textContent;
                var absent = document.getElementById('monthlyAbsent').value;
                var tax = document.getElementById('monthlyTax').value;
                var epf = document.getElementById('monthlyEpf').textContent;
                var basic = document.getElementById('basic').textContent;
                var net = document.getElementById('monthlyTotal').textContent;

                var medicalInt = 0;
                var bonusInt = 0;
                var hoursInt = 0;
                var ratesInt = 0;
                var absentInt = 0;
                var taxInt = 0;
                var epfInt = 0;
                var basicInt = 0;
                var netInt = 0;

                if (medical != "") {
                    medicalInt = parseInt(medical);
                }
                if (bonus != "") {
                    bonusInt = parseInt(bonus);
                }
                if (hours != "") {
                    hoursInt = parseInt(hours);
                }

                if (rates != "") {
                    ratesInt = parseInt(rates);
                }
                if (absent != "") {
                    absentInt = parseInt(absent);
                }
                if (tax != "") {
                    taxInt = parseInt(tax);
                }
                if (epf != "") {
                    epfInt = parseInt(epf);
                }
                if (basic != "") {
                    basicInt = parseInt(basic);
                }

                if (net != "") {
                    netInt = parseInt(net);
                }

                document.getElementById("monthlyTotal").textContent = (medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt));
                document.getElementById("monthlyNet").textContent = basicInt + ((medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt)));
                document.getElementById("monthlyTotal2").value = (medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt));
                document.getElementById("totalAllowance").value = basicInt + medicalInt + bonusInt + (ratesInt * hoursInt);
                document.getElementById("totalDeductions").value = absentInt + taxInt + ((basicInt / 100) * epfInt);
                document.getElementById("netSal").value = basicInt + ((medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt)));

            }

            function calculateTotal3() {
                var medical = document.getElementById('updateMonthlyMedical').value;
                var bonus = document.getElementById('updateMonthlyBonus').value;
                var hours = document.getElementById('updateMonthlyHours').value;
                var rates = document.getElementById('updateMonthlyRate').textContent;
                var absent = document.getElementById('updateMonthlyAbsent').value;
                var tax = document.getElementById('updateMonthlyTax').value;
                var epf = document.getElementById('updateMonthlyEpf').textContent;
                var basic = document.getElementById('updateBasicSalary').textContent;
                var net = document.getElementById('updateMonthlyTotal').textContent;

                var medicalInt = 0;
                var bonusInt = 0;
                var hoursInt = 0;
                var ratesInt = 0;
                var absentInt = 0;
                var taxInt = 0;
                var epfInt = 0;
                var basicInt = 0;
                var netInt = 0;

                if (medical != "") {
                    medicalInt = parseInt(medical);
                }
                if (bonus != "") {
                    bonusInt = parseInt(bonus);
                }
                if (hours != "") {
                    hoursInt = parseInt(hours);
                }

                if (rates != "") {
                    ratesInt = parseInt(rates);
                }
                if (absent != "") {
                    absentInt = parseInt(absent);
                }
                if (tax != "") {
                    taxInt = parseInt(tax);
                }
                if (epf != "") {
                    epfInt = parseInt(epf);
                }
                if (basic != "") {
                    basicInt = parseInt(basic);
                }

                if (net != "") {
                    netInt = parseInt(net);
                }

                document.getElementById("updateMonthlyTotal").textContent = (medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt));
                document.getElementById("updateMonthlyNet").textContent = basicInt + ((medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt)));
                document.getElementById("updateMonthlyTotal2").value = (medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt));
                document.getElementById("updateTotalAllowance").value = basicInt + medicalInt + bonusInt + (ratesInt * hoursInt);
                document.getElementById("updateTotalDeductions").value = absentInt + taxInt + ((basicInt / 100) * epfInt);
                document.getElementById("updateNetSal").value = basicInt + ((medicalInt + bonusInt + (ratesInt * hoursInt)) - (absentInt + taxInt + ((basicInt / 100) * epfInt)));

            }

            function saveSalary() {
                $.post("${pageContext.request.contextPath}/AddSalary",
                        $('#SalaryForm').serialize(),
                        function (data, status) {
                            openModal(data);
                        });

            }

            function openModal(message) {

                var text = document.getElementById("messageModalText");

                if (message == '') {
                    return;
                }

                if (message.includes('Fail')) {
                    $("#messageModalSuccess").hide();
                    $("#messageModalFail").show();
                    $("#messageModalSuccessText").hide();
                    $("#messageModalFailText").show();
                    text.textContent = message;
                    $('#messageModal').modal();

                } else {

                    $("#messageModalSuccess").show();
                    $("#messageModalFail").hide();
                    $("#messageModalSuccessText").show();
                    $("#messageModalFailText").hide();
                    $("#messageModalSuccessDeleteText").hide();
                    $("#messageModalSuccessUpdateText").hide();
                    //text.textContent = message;
                    $('#messageModal').modal();
                }
            }
            
            function openDeleteModal(message) {

                var text = document.getElementById("messageModalText");

                if (message == '') {
                    return;
                }

                if (message.includes('Fail')) {
                    $("#messageModalSuccess").hide();
                    $("#messageModalFail").show();
                    $("#messageModalSuccessText").hide();
                    $("#messageModalFailText").show();
                    text.textContent = message;
                    $('#messageModal').modal();

                } else {
                	

                    $("#messageModalSuccess").show();
                    $("#messageModalFail").hide();
                    $("#messageModalSuccessText").hide()
                    $("#messageModalSuccessUpdateText").hide();
                    $("#messageModalFailText").hide();
                    $("#messageModalSuccessDeleteText").show();
                    /* text.textContent = message; */
                    $('#messageModal').modal();
                }
             
            }
            
            function openUpdateMsgModal(message) {

                var text = document.getElementById("messageModalText");

                if (message == '') {
                    return;
                }

                if (message.includes('Fail')) {
                    $("#messageModalSuccess").hide();
                    $("#messageModalFail").show();
                    $("#messageModalSuccessText").hide();
                    $("#messageModalFailText").show();
                    text.textContent = message;
                    $('#messageModal').modal();

                } else {
                	
                    $("#messageModalSuccess").show();
                    $("#messageModalFail").hide();
                    $("#messageModalSuccessText").hide();
                    $("#messageModalFailText").hide();
                    $("#messageModalSuccessDeleteText").hide();
                    $("#messageModalSuccessUpdateText").show();
                    /* text.textContent = message; */
                    $('#messageModal').modal();
                }
             
            }

            function openUpdateModal(id) {

                $.getJSON("${pageContext.request.contextPath}/getSalary?salId=" + id, function (data) {
                    $(function () {
                        $("#salID").val(data.salId);
                        $("#updateEmployeeName").html(data.employee_name);
                        $("#updateDob").html(data.dob);
                        $("#updateJobTitle").html(data.job_title);
                        $("#updateBasicSalary").html(data.basic_salary);
                        
                        $("#updateMonthlyDate").val(data.date);
                        $("#updateMonthlyMedical").val(data.Medical);
                        $("#updateMonthlyBonus").val(data.Bonus);
                        $("#updateMonthlyHours").val(data.over_time_hours);
                        $("#updateMonthlyRate").html(data.over_time_rate);

                        $("#updateMonthlyEpf").html(data.etf_rate);
                        $("#updateMonthlyAbsent").val(data.absent);
                        $("#updateMonthlyTax").val(data.tax);

                        $("#updateMonthlyTotal").html(data.total_allowance);
                        $("#updateMonthlyNet").html(data.net_salary);

                        $("#updateNetSal").val(data.net_salary);
                        $("#updateTotalDeductions").val(data.total_deduction);
                        $("#updateTotalAllowance").val(data.gross_salary);
                        $("#updateMonthlyTotal2").val(data.total_allowance);

                    });
                });
                $('#updateModal').modal();
            }

            function updateSalary() {
                $('#updateModal').modal('hide');
                $.post("${pageContext.request.contextPath}/updateSalary",
                        $('#SalaryUpdateForm').serialize(),
                        function (data, status) {
                			openUpdateMsgModal(data);
                        });

            }
            
            function deleteSalary() {
                $('#updateModal').modal('hide');
                $.post("${pageContext.request.contextPath}/deleteSalary",
                        $('#SalaryUpdateForm').serialize(),
                        function (data, status) {
                			openDeleteModal(data);
                        });

            }
        </script>

        <style>

            /*Actual Style*/

            /*=======================
                   C-Container
            =========================*/
            .c-container {
                max-width: 27rem;
                margin: 1rem auto 0;
                padding: 1rem;
            }

            /*=======================
                   O-Circle
            =========================*/

            .o-circle {
                display: flex;
                width: 10.555rem; height: 10.555rem;
                justify-content: center;
                align-items: flex-start;
                border-radius: 50%; 
                animation: circle-appearance .8s ease-in-out 1 forwards, set-overflow .1s 1.1s forwards;
            }

            .c-container__circle {
                margin: 0 auto 0;
            }

            /*=======================
                C-Circle Sign
            =========================*/

            .o-circle__sign {
                position: relative;
                opacity: 0;
                background: #fff;
                animation-duration: .8s;
                animation-delay: .2s;
                animation-timing-function: ease-in-out;
                animation-iteration-count: 1;
                animation-fill-mode: forwards;
            }

            .o-circle__sign::before, 
            .o-circle__sign::after {
                content: "";
                position: absolute;
                background: inherit;
            }

            .o-circle__sign::after {
                left: 100%; top: 0%;
                width: 500%; height: 95%; 
                transform: translateY(4%) rotate(0deg);
                border-radius: 0;
                opacity: 0;
                animation: set-shaddow 0s 1.13s ease-in-out forwards;
                z-index: -1;
            }


            /*=======================
                  Sign Success
            =========================*/

            .o-circle__sign--success { 
                background: rgb(56, 176, 131);
            }

            .o-circle__sign--success .o-circle__sign {
                width: 1rem; height: 6rem;
                border-radius: 50% 50% 50% 0% / 10%;
                transform: translateX(150%) translateY(35%) rotate(45deg) scale(.11);  
                animation-name: success-sign-appearance;
            }

            .o-circle__sign--success .o-circle__sign::before {
                bottom: -17%;
                width: 100%; height: 50%; 
                transform: translateX(-150%) rotate(90deg);
                border-radius: 50% 50% 50% 50% / 20%;

            }

            /*--shadow--*/
            .o-circle__sign--success .o-circle__sign::after {
                background: rgb(40, 128, 96);
            }


            /*=======================
                  Sign Failure
            =========================*/

            .o-circle__sign--failure {
                background: rgb(236, 78, 75);
            }

            .o-circle__sign--failure .o-circle__sign {
                width: 1rem; height: 7rem;
                transform: translateY(25%) rotate(45deg) scale(.1);
                border-radius: 50% 50% 50% 50% / 10%;
                animation-name: failure-sign-appearance;
            }

            .o-circle__sign--failure .o-circle__sign::before {
                top: 50%;
                left: 5%;
                width: 100%; height: 100%; 
                transform: translateY(-50%) rotate(90deg);
                border-radius: inherit;
            } 

            /*--shadow--*/
            .o-circle__sign--failure .o-circle__sign::after {
                background: rgba(175, 57, 55, .8);
            }


            /*-----------------------
                  @Keyframes
            --------------------------*/

            /*CIRCLE*/
            @keyframes circle-appearance {
                0% { transform: scale(0); }

                50% { transform: scale(1.5); }

                60% { transform: scale(1); }

                100% { transform: scale(1); }
            }

            /*SIGN*/
            @keyframes failure-sign-appearance {         
                50% { opacity: 1;  transform: translateY(25%) rotate(45deg) scale(1.7); }

                100% { opacity: 1; transform: translateY(25%) rotate(45deg) scale(1); }
            }

            @keyframes success-sign-appearance {      
                50% { opacity: 1;  transform: translateX(130%) translateY(35%) rotate(45deg) scale(1.7); }

                100% { opacity: 1; transform: translateX(130%) translateY(35%) rotate(45deg) scale(1); }
            }


            @keyframes set-shaddow {
                to { opacity: 1; }
            }

            @keyframes set-overflow {
                to { overflow: hidden; }
            }



            /*+++++++++++++++++++s
                @Media Queries
            +++++++++++++++++++++*/

            @media screen and (min-width: 1300px) {

                HTML { font-size: 1.5625em; } /* 25 / 16 = 1.5625 */

            }

            td{
                text-align: left;
            }

        </style>

        <title>Monthly Salary</title>
    </head>
    <body  style="background-color: #222629">
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
        <ul><li><a class="menu" href="${pageContext.request.contextPath}/Interfaces/Home/Accountant_Home.jsp">Home
                    <ul>
                        <li><a class="menu" href="#">Add Payroll</a></li>
                        <li><a class="menu" href="#">Update </a></li>
                </a></ul>
    </li>
<li><a class="menu" href="Payroll.jsp">Add Daily salary</a></li>
<li><a class="menu" href="MonthlyPayroll.jsp">Add Monthly Salary</a></li>
</ul>

<div id="bodyDiv" style="min-height: 485px;">

    <!-- Body Part -->

    <%
        String empName = "----";
        String dob = "----";
        String jobTitle = "----";
        String rate = "----";
        String type = "----";
        String epfRate = "----";
        String basic = "";
        try {
            ResultSet rs = DBConnection.getDBConnection().createStatement().executeQuery("SELECT * FROM employee "
                    + "INNER JOIN jobs ON jobs.jobsid=employee.jobsid WHERE empId='" + request.getParameter("empId") + "'");

            if (rs.next()) {
                empName = rs.getString("employee_name");
                dob = rs.getString("dob");
                jobTitle = rs.getString("jobs.job_title");
                basic = rs.getString("Basic_Salary");
                rate = rs.getString("over_time_rate");
                type = rs.getString("salary_payment_methoed");
                epfRate = rs.getString("etf_rate");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <div class ="row" >
        <div class="col-sm shadow-sm p-3 mb-5 bg-white rounded" style="margin-top: 50px;margin-left: 40px" >
            <div class="formAlign"style="padding-left: 20px">
                <table id="fullForm" class="form">
                    <form method="GET" action="">

                        <tr>
                        <div class="form-inline">
                            <div class="form-group mb-2">
                                <label for="inputPassword" >Employee ID</label>
                            </div>

                            <div class="form-group mx-sm-3 mb-2">
                                <input type="text" class="form-control" name="empId" size="20" placeholder = "Search Employee..." required value="<%=request.getParameter("empId") == null ? "" : request.getParameter("empId")%>">
                            </div>
                            <input type="Submit"  class="btn btn-primary mb-2" value="Search">

                        </div>
                        </tr>
                    </form>
                    <hr>
                    <%-- <tr>
                        <td></td>
                        <td><input type="radio" name="gender" value="Daily" <%if (type.equalsIgnoreCase("Daily")) {
                                out.print("checked='checked'");
                            }%>> Daily
                            <input type="radio" name="gender" value="Monthly" <%if (type.equalsIgnoreCase("Monthly")) {
                                    out.print("checked='checked'");
                                }%> > Monthly</td>

                </tr> --%>
                    <form id="SalaryForm">
                        <tr>
                            <td> <label class="col-form-label">Employee Name</label></td>
                            <td>&nbsp;&nbsp;</td>
                            <td><label class="col-form-label"><%=empName%></label></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">Date of Birth</label> </td>
                            <td></td>
                            <td><label class="col-form-label" ><%=dob%></label></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">Job Title</label></td>
                            <td></td>
                            <td><label class="col-form-label"><%=jobTitle%></label></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">Basic Salary</label></td>
                            <td></td>
                            <td><label class="col-form-label" id="basic"><%=basic%></label></td>
                        </tr>

                        <input  id="paymentType" name="paymentType" type="hidden" value="<%=type%>">
                        <input  id="empId2" name="empId2" type="hidden" value="<%=request.getParameter("empId")%>">



                        <div id="monthly">
                            <tr><td><br></td></tr>
                            
                            <tr>
	                            <td><label class="col-form-label">Date</label></td>
	                            <td></td>
	                            <td><input class="form-control" type="date" name="monthlyDate"  id="monthlyDate" size="55"  onkeyup="calculateTotal1()" onkeypress="return IsNumeric(event);"></td>
	                        </tr>

                            <tr>
                                <td><h4>ALLOWANCE</h4></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td><label class="col-form-label">Medical</label></td>
                                <td></td>
                                <td><input class="form-control" type="number" name="monthlyMedical"  id="monthlyMedical" size="55"  onkeyup="calculateTotal2()" onkeypress="return IsNumeric(event);"></td>
                            </tr>
                            <tr>
                                <td> <label class="col-form-label">Bonus</label> </td>
                                <td></td>
                                <td><input class="form-control" type="number" name="monthlyBonus"  id="monthlyBonus"  size="55" onkeyup="calculateTotal2()"  onkeypress="return IsNumeric(event);" ></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Overtime</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Hours</label></td>
                                <td></td>
                                <td><input class="form-control" type="number" name="monthlyHours"  id="monthlyHours" required  onkeyup="calculateTotal2()"  onkeypress="return IsNumeric(event);" size="55" ></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Rate/h</label></td>
                                <td></td>
                                <td><label class="form-control" id="monthlyRate"><%=rate%></label></td>
                            </tr>
                            <tr><td><br></td></tr>
                            <tr>
                            <tr><td><h4>Deduction</h4></td></tr>
                            <tr>
                                <td><label class="col-form-label">EPF</label></td>
                                <td></td>
                                <td><label class="form-control" id="monthlyEpf"><%=epfRate%></label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Other</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Absent</label></td>
                                <td></td>
                                <td><input class="form-control" type="number"  id="monthlyAbsent" name="monthlyAbsent"  onkeyup="calculateTotal2()" onkeypress="return IsNumeric(event);" size="55" ></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Tax </label></td>
                                <td></td>
                                <td><input class="form-control" type="number"  id="monthlyTax"  name="monthlyTax"  required onkeyup="calculateTotal2()"  onkeypress="return IsNumeric(event);" size="55" ></td>
                            </tr>
                            <tr><td><br></td></tr>
                            <tr>
                                <td><h4 >Total Amount</h4></td>
                            <input  id="monthlyTotal2" name="monthlyTotal2" type="hidden" value="0">
                            <input  id="totalAllowance" name="totalAllowance" type="hidden" value="0">
                            <input  id="totalDeductions" name="totalDeductions" type="hidden" value="0">
                            <td></td>
                            <td><h4 style="text-align: right" id="monthlyTotal">------</h4></td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td><h4>Net salary</h4></td>
                                <td></td>
                            <input id="netSal" name="netSal" type="hidden" value="0">
                            <td><h4 style="text-align: right" id="monthlyNet">------</h4></td>
                            </tr>
                            <tr><td><br></td></tr>
                        </div>


                        <tr>
                            <td></td>
                            <td ></td> <td >
                            <button class="btn btn-success" type="button" onclick="saveSalary()" >Add</button> &nbsp;
                                <button class="btn btn-primary" type="button" onclick="#" >Reset</button></td>

                        </tr>

                    </form>
                </table>

            </div>
        </div>


        <div class="col-sm" style="padding-top: 42px;padding-right: 30px;">
            <nav class="navbar">

                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr class="viewTr" id ="myHeader">
                            <th  scope="col">SalID</th>
                            <th  scope="col">Date</th>
                            <th scope="col" >Employee Name</th>
                            <th  scope="col" >Total Allowance</th>
                            <th  scope="col" >Total deduction</th>
                            <th  scope="col">Net salary</th>
                            <th scope="col">Action1</th> 
                            <!-- <th scope="col">Action2<th> --> 
                        </tr>
                    </thead>


                    <%
                        try {
                            ResultSet rs = DBConnection.getDBConnection().createStatement().executeQuery("SELECT * FROM employee "
                                    + "INNER JOIN salary ON salary.empId=employee.empId INNER JOIN jobs ON jobs.jobsid=employee.jobsid WHERE "
                                    + "jobs.Salary_Payment_Methoed = 'Monthly'");
                            while (rs.next()) {

                    %>

                    <tr class="viewTr">
                        <td class ="tData"><%=rs.getString("sal_id")%></td>
                         <td class ="tData"><%=rs.getDate("date").toString()%></td>
                        <td class ="tData" ><%=rs.getString("employee_name")%></td>
                        <td class ="tData"><%=rs.getString("total_allowance")%></td>
                        <td class ="tData"><%=rs.getString("total_deduction")%></td>
                        <td class ="tData"><%=rs.getDouble("total_allowance")-rs.getDouble("total_deduction")%></td>
                        <td class ="tData"> <button onclick="openUpdateModal('<%=rs.getString("sal_id")%>')" class="btn btn-primary">Update</button></td>

                    </tr>
                    <%    }

                        } catch (Exception e) {
                            e.printStackTrace();
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
    </div>

</div>				
<!---------------- Modals ------------->
<div id="messageModal" class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">


                <section class="c-container">

                    <div  id="messageModalSuccess"  class="o-circle c-container__circle o-circle__sign--success">
                        <div class="o-circle__sign"></div> 

                    </div>


                    <div  id="messageModalFail"  class="o-circle c-container__circle o-circle__sign--failure">
                        <div class="o-circle__sign"></div>  
                    </div>

                </section>

                <h2 id="messageModalSuccessText">Saved Successfully!</h2>
                <h2 id="messageModalSuccessDeleteText">Deleted Successfully!</h2>
                <h2 id="messageModalSuccessUpdateText">Updated Successfully!</h2>
                <h2 id="messageModalFailText">Failed to Save!</h2>
                <h5 id="messageModalText"></h5>


            </div>
        </div>
    </div>
</div>

<!-----------------  Modal for get alert --------------- -->
<!-- <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> -->

<!--------------------- modal 2 -------------->

<div id="updateModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="formAlign" style="padding-left: 20px">
                    <div id="monthly">
                    </div><table class="form">
                        <tbody><tr>

                            </tr>
                        <form id="SalaryUpdateForm">
                            <input id="salID" name="salID" type="hidden" value="">
                            <tr>
                                <td> <label class="col-form-label">Employee Name</label></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><label id="updateEmployeeName" class="col-form-label">----</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Date of Birth</label> </td>
                                <td></td>
                                <td><label id="updateDob" class="col-form-label">----</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Job Title</label></td>
                                <td></td>
                                <td><label id="updateJobTitle" class="col-form-label">----</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Basic Salary</label></td>
                                <td></td>
                                <td><label id="updateBasicSalary" class="col-form-label" ></label></td>
                            </tr>

                            <input id="paymentType" name="paymentType" type="hidden" id="updatePaymentType" value="----">




                            <tr><td><br></td></tr>
                            <tr>
	                            <td><label class="col-form-label">Date</label></td>
	                            <td></td>
	                            <td><input class="form-control" type="date" name="updateMonthlyDate"  id="updateMonthlyDate" size="55"  onkeyup="calculateTotal1()" onkeypress="return IsNumeric(event);"></td>
	                        </tr>
                           
                            <tr>
                                <td><h4>ALLOWANCE</h4></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <!--                        <tr>
                                                        <td><label class="col-form-label">Medical</label></td>
                                                        <td></td>
                                                        <td><input class="form-control" type="number" name="monthlyMedical" id="monthlyMedical" size="55" onkeyup="calculateTotal2()" onkeypress="return IsNumeric(event);"></td>
                                                    </tr>
                            -->                      
                              <tr>
                                <td> <label class="col-form-label">Medical</label> </td>
                                <td></td>
                                <td><input class="form-control" type="number" name="updateMonthlyMedical" id="updateMonthlyMedical" size="55" onkeyup="calculateTotal3()" onkeypress="return IsNumeric(event);"></td>
                            </tr>
                            
                              <tr>
                                <td> <label class="col-form-label">Bonus</label> </td>
                                <td></td>
                                <td><input class="form-control" type="number" name="updateMonthlyBonus" id="updateMonthlyBonus" size="55" onkeyup="calculateTotal3()" onkeypress="return IsNumeric(event);"></td>
                            </tr>
                            
                            <tr>
                                <td><label class="col-form-label">Overtime</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Hours</label></td>
                                <td></td>
                                <td><input class="form-control" type="number" name="updateMonthlyHours" id="updateMonthlyHours" required="" onkeyup="calculateTotal3()" onkeypress="return IsNumeric(event);" size="55"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Rate/h</label></td>
                                <td></td>
                                <td><label class="form-control" id="updateMonthlyRate">----</label></td>
                            </tr>
                            <tr><td><br></td></tr>
                            <tr>
                            </tr><tr><td><h4>Deduction</h4></td></tr>
                            <tr>
                                <td><label class="col-form-label">EPF</label></td>
                                <td></td>
                                <td><label class="form-control" id="updateMonthlyEpf">----</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Other</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Absent</label></td>
                                <td></td>
                                <td><input class="form-control" type="number" id="updateMonthlyAbsent" name="updateMonthlyAbsent" onkeyup="calculateTotal3()" onkeypress="return IsNumeric(event);" size="55"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Tax </label></td>
                                <td></td>
                                <td><input class="form-control" type="number" id="updateMonthlyTax" name="updateMonthlyTax" required="" onkeyup="calculateTotal3()" onkeypress="return IsNumeric(event);" size="55"></td>
                            </tr>
                            <tr><td><br></td></tr>
                            <tr>
                                <td><h4>Total Amount</h4></td>
                            <input id="updateMonthlyTotal2" name="updateMonthlyTotal2" type="hidden" value="0">

                            <input id="updateTotalAllowance" name="updateTotalAllowance" type="hidden" value="0">
                            <input id="updateTotalDeductions" name="updateTotalDeductions" type="hidden" value="0">
                            <td></td>
                            <td><h4 style="text-align: right" id="updateMonthlyTotal">------</h4></td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td><h4>Net salary</h4></td>
                                <td></td>
                            <input id="updateNetSal" name="updateNetSal" type="hidden" value="0">
                            <td><h4 style="text-align: right" id="updateMonthlyNet">------</h4></td>
                            </tr>
                        </form>
                        </tbody></table>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="updateSalary()" class="btn btn-primary">Update Changes</button>
                <button type="button" onclick="deleteSalary()" class="btn btn-danger">Delete</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</div>

<!-- Footer Part -->
<hr>
<label id="copyright">Copyright &copy; 2020 Dehiwatta Tea Factory. All Rights Reserved</label>


</body>
</html>