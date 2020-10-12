<%@page import="fms.Expense.service.Expe_DAO"%>
<%@page import="fms.Expense.service.Expenses"%>
<%@page import="fms.Expense.service.ExSupplierDao"%>
<%@page import="fms.Expense.service.ExSupplier"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" %>
<%@page import="com.fms.DBconnection.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="../../CSS & javaScript/Production/Admin_Styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="../../CSS & javaScript/Production/Admin&Manager_Script.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $("#exampleModalCenter").modal('show');
    });
</script>
<meta charset="ISO-8859-1">
<title>Details Updation Form</title>
</head>
<body>
<%
String id=request.getParameter("id"); 
Expenses ui=Expe_DAO.getRecordById(Integer.parseInt(id));  
%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Expenses Update Form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="history.back()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-sm">
<form action="updateExpReq.jsp" method="post" class="formAlign" style="padding-top: 05px;">
   <input type="hidden" class="form-control" name="id" required value="<%=ui.getId() %>"/>
  <div class="form-group row">
  <label for="dateSelect" class="col-md-2 col-form-label">Date</label>
    <div class="col-md-8">
    <input type="text" class="form-control" name="date" required value="<%=ui.getDate() %>">
    </div>
  </div>
    <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from ex_type");  
	        ResultSet rs=ps.executeQuery();  
%>
<div class="form-group row">
      <label for="inputState" class="col-sm-2 col-form-label">Expen Type</label>
     <div class="col-md-8" style="padding-top: 12px;">
      <select name="exp_type" class="form-control" required>
       <option selected><%=ui.getExp_type() %></option>
		<%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
      </select>
      </div>
    </div>
    <%
        }
        catch(Exception e)
        {
             out.println("Error"+e);
        }
%>
    <div class="form-group row">
  <label for="dateSelect" class="col-md-2 col-form-label">Description</label>
    <div class="col-md-8">
    <input type="text" class="form-control" name="descrp" required value="<%=ui.getDescrp() %>" >
    </div>
  </div>
          <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Amount</label>
          <div class="col-md-8">
      <input type="number" class="form-control"name="ammount" id="amm" required value="<%=ui.getAmmount() %>" >
    </div>
  </div>
        <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Expen Supplier<br>Name</label>
          <div class="col-md-8">
      <input type="text" name="ex_supp"  class="form-control" id="sup" required value="<%=ui.getEx_supp() %>" >
    </div>
  </div>
  <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from payment_mothod");  
	        ResultSet rs=ps.executeQuery();  
%>
<div class="form-group row">
      <label for="inputState" class="col-sm-2 col-form-label">Dealing Status</label>
     <div class="col-md-8" style="padding-top: 12px;">
      <select name="pay_method" class="form-control" required onchange="showDiv('chq', this)">
      <option selected><%=ui.getPay_method() %></option>
		<%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
      </select>
      </div>
    </div>
    <%
        }
        catch(Exception e)
        {
             out.println("Error"+e);
        }
%>
        <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Cheque no</label>
          <div class="col-md-8">
      <input type="text" class="form-control"name="chek_no" id="chq" value="<%=ui.getChek_no() %>" >
    </div>

<!-- remove duplicte -->
<script>
var code = {};
$("select[name='exp_type'] > option").each(function () {
    if(code[this.text]) {
        $(this).remove();
    } else {
        code[this.text] = this.value;
    }
});

var code1 = {};
$("select[name='pay_method'] > option").each(function () {
    if(code1[this.text]) {
        $(this).remove();
    } else {
        code1[this.text] = this.value;
    }
});
function showDiv(divId, element)
{
    document.getElementById(divId).style.display = element.value == "Cheque" ? 'block' : 'none';
    document.getElementById("chq").value = "";
}

</script>
     <div class="position-absolute bottom2-left" style="bottom: -72px;"> 
  <button type="submit" class="btn btn-primary" >Submit</button>
    <!-- <button type="button" onclick="reply_click(this)"class="btn btn-primary">Demo</button><br> --> 
    </div>
</form>
    </div>
      </div>
      <div class="modal-footer" style="padding-bottom: 50px;">
       
      </div>
    </div>
  </div>
</div>
<script>

    //doubt
    function reply_click(element)
    {
//    document.getElementById('wt').value = "test";
    }    
    
</script>

</body>
</html>