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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS & javaScript/Payroll/alertStyle.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="${pageContext.request.contextPath}/CSS & javaScript/Payroll/Admin&Manager_Script.js"></script>
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

            function calculateTotal1() {
                var insurance = document.getElementById('DailyInsurance').value;
                var hours = document.getElementById('DailyHours').value;
                var rates = document.getElementById('DailyRate').textContent;
                var basic = document.getElementById('basic').textContent ;

                var ins = 0;
                var hour = 0;
                var rate = 0;
                var basicInt = 0 ;

                if (insurance != "") {
                    ins = parseInt(insurance);
                }
                if (hours != "") {
                    hour = parseInt(hours);
                }

                if (rates != "") {
                    rate = parseInt(rates);
                }
                
                if( basic != "") {
               	 basicInt = parseInt(basic);
                }

                document.getElementById("dailyTotal").textContent =  ins + (rate * hour);
                document.getElementById("DailyNet").textContent = basicInt + (ins + (rate * hour));
                document.getElementById("dailyTotal2").value = ins + (rate * hour) ;
                document.getElementById("netSalDay").value = basicInt + (ins + (rate * hour));
             

            }
            function calculateTotal3() {
               
                var insurance = document.getElementById('updateDailyInsurance').value ;
                var hours = document.getElementById('updateDailyHours').value;
                var rates = document.getElementById('updateDailyRate').textContent;
                var basic = document.getElementById('updateBasicSalary').textContent;
                var net = document.getElementById('updatedailyTotal').textContent;
                
                var insInt = 0;
                var hoursInt = 0;
                var ratesInt = 0;
                var basicInt = 0;
                var netInt = 0;

                if (insurance != "") {
                	insInt = parseInt(insurance);
                }
       
                if (hours != "") {
                    hoursInt = parseInt(hours);
                }

                if (rates != "") {
                    ratesInt = parseInt(rates);
                }
              
                if (basic != "") {
                    basicInt = parseInt(basic);
                }

                if (net != "") {
                    netInt = parseInt(net);
                }

                document.getElementById("updatedailyTotal").textContent = (insInt +  (ratesInt * hoursInt));
                document.getElementById("updateDailyNet").textContent = basicInt + (insInt +  (ratesInt * hoursInt));
                document.getElementById("updatedailyTotal2").value = (insInt +  (ratesInt * hoursInt));
                document.getElementById("updateNetSalDay").value = basicInt +  (insInt +  (ratesInt * hoursInt));
            }

            function saveSalary() {
                $.post("${pageContext.request.contextPath}/AddDailySal",
                        $('#SalaryFormDaily').serialize(),
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
                    text.textContent = message;
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
                    $("#messageModalSuccessUpdateText").hide();
                    $("#messageModalFailText").show();
                    text.textContent = message;
                    $('#messageModal').modal();

                } else {
                	

                    $("#messageModalSuccess").show();
                    $("#messageModalFail").hide();
                    $("#messageModalSuccessText").hide();
                    $("#messageModalFailText").hide();
                    $("#messageModalSuccessDeleteText").show();
                    $("#messageModalSuccessUpdateText").hide();
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

                        $("#updateDailyInsurance").val(data.insurance);
                        $("#updateDailyHours").val(data.over_time_hours);
                        $("#updateDailyRate").html(data.over_time_rate);

                        $("#updatedailyTotal").html(data.gross_salary);
                        $("#updateDailyNet").html(data.net_salary);

                        $("#updateNetSalDay").val(data.net_salary);
                        $("#updatedailyTotal2").val(data.total_allowance);

                    });
                });
                $('#updateModal').modal();
            }

            function updateSalary(id) {
                $('#updateModal').modal('hide');
                $.post("${pageContext.request.contextPath}/updateSalaryDaily" ,
                        $('#SalaryUpdateForm').serialize(),
                        function (data, status) {
                			openUpdateMsgModal(data);
                        });

            }
            
            function deleteSalary(id) {
            	$('#updateModal').modal('hide');
                $.post("${pageContext.request.contextPath}/deleteSalary",
                        $('#SalaryUpdateForm').serialize(),
                        function (data, status) {
                			openDeleteModal(data);
                        });

            }

        </script>

       

        <title>Daily Salary</title>
    </head>
    <body  style="background-color: black">
        <!-- +++++++++++++++++++++++++++++++++ Header Part +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
             
    <%--  <%
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
        <hr>
        <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
        <ul><li><a class="menu" href="#">Home
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
                    + "INNER JOIN jobs ON jobs.jobsid=employee.jobsid WHERE jobs.salary_payment_methoed = 'Daily' and empId='" + request.getParameter("empId") + "'");

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
    <div class ="row">
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
                             <input  id="paymentType" name="paymentType" type="hidden" value="<%=type%>">
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
                    <form id="SalaryFormDaily">
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



					 <%if (type.equalsIgnoreCase("Daily")) {%>
                        <div id="monthly">
                            <tr><td><br></td></tr>

                            <tr>
                                <td><h4>ALLOWANCE</h4></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td><label class="col-form-label">Insurance</label></td>
                                <td></td>
                                <td><input class="form-control" type="number" name="DailyInsurance"  id="DailyInsurance" size="55"  onkeyup="calculateTotal1()" onkeypress="return IsNumeric(event);"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Overtime</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Hours</label></td>
                                <td></td>
                                <td><input class="form-control" type="number" name="DailyHours"  id="DailyHours" required  onkeyup="calculateTotal1()"  onkeypress="return IsNumeric(event);" size="55" ></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Rate/h</label></td>
                                <td></td>
                                <td><label class="form-control" id="DailyRate"><%=rate%></label></td>
                            </tr>
                            
                             <tr><td><br></td></tr>
                            <tr>
                                <td><h4 >Total Amount</h4></td>
                            <input  id="dailyTotal2" name="dailyTotal2" type="hidden" value="0">
                            <td></td>
                            <td><h4 style="text-align: right" id="dailyTotal">------</h4></td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td><h4>Net salary</h4></td>
                                <td></td>
                              <input id="netSalDay" name="netSalDay" type="hidden" value="0">
                            <td><h4 style="text-align: right" id="DailyNet">------</h4></td>
                            </tr>
                            <tr><td><br></td></tr>
                        </div>
                        
                             <%}%>

                        <tr>
                            <td></td>
                            <td ></td> <td ><button class="btn btn-success" type="button" onclick="saveSalary()" >Add</button> &nbsp;
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
                            <th scope="col" >Employee Name</th>
                            <th  scope="col" >Total Allowance</th>
                            <th  scope="col">Net salary</th>
                            <th scope="col">Action1</th> 
                           <!--  <th scope="col">Action2<th>  -->
                        </tr>
                    </thead>


                    <%
                        try {
                            ResultSet rs = DBConnection.getDBConnection().createStatement().executeQuery("SELECT * FROM employee "
                                    + "INNER JOIN salary ON salary.empId=employee.empId");
                            while (rs.next()) {

                    %>

                    <tr class="viewTr">
                        <td class ="tData"><%=rs.getString("sal_id")%></td>
                        <td class ="tData" ><%=rs.getString("employee_name")%></td>
                        <td class ="tData"><%=rs.getString("total_allowance")%></td>
                        <td class ="tData"><%=rs.getDouble("net_salary")%></td>
                        <td class ="tData"> <button onclick="openUpdateModal('<%=rs.getString("sal_id")%>')" class="btn btn-primary">Update</button></td>
                       <%--  <td class ="tData"> <button class="btn btn-danger" onclick="openUpdateModal('<%=rs.getString("sal_id")%>')">Delete</button></td> --%>

                    </tr>
                    <%    }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>


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
                    <div id="daily">
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
                                <td><label class="col-form-label">Day Salary</label></td>
                                <td></td>
                                <td><label id="updateBasicSalary" class="col-form-label" ></label></td>
                            </tr>

                            <input id="paymentType" name="paymentType" type="hidden" id="updatePaymentType" value="----">




                            <tr><td><br></td></tr>

                            <tr>
                                <td><h4>ALLOWANCE</h4></td>
                                <td></td>
                                <td></td>
                            </tr>            
                              <tr>
                                <td> <label class="col-form-label">Insurance</label> </td>
                                <td></td>
                                <td><input class="form-control" type="number" name="updateDailyInsurance" id="updateDailyInsurance" size="55" onkeyup="calculateTotal3()" onkeypress="return IsNumeric(event);"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Overtime</label></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Hours</label></td>
                                <td></td>
                                <td><input class="form-control" type="number" name="updateDailyHours" id="updateDailyHours" required="" onkeyup="calculateTotal3()" onkeypress="return IsNumeric(event);" size="55"></td>
                            </tr>
                            <tr>
                                <td><label class="col-form-label">Rate/h</label></td>
                                <td></td>
                                <td><label class="form-control" id="updateDailyRate">----</label></td>
                            </tr>
                        
                            <tr><td><br></td></tr>
                            <tr>
                                <td><h4>Total Amount</h4></td>
                            <input id="updatedailyTotal2" name="updatedailyTotal2" type="hidden" value="0">
                            <td></td>
                            <td><h4 style="text-align: right" id="updatedailyTotal">------</h4></td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td><h4>Net salary</h4></td>
                                <td></td>
                            <input id="updateNetSalDay" name="updateNetSalDay" type="hidden" value="0">
                            <td><h4 style="text-align: right" id="updateDailyNet">------</h4></td>
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