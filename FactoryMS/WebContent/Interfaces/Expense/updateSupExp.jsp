<%@page import="fms.Expense.serviceANDservlet.ExSupplierDao"%>
<%@page import="fms.Expense.serviceANDservlet.ExSupplier"%>
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
ExSupplier ui=ExSupplierDao.getRecordById(Integer.parseInt(id));  
%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Dealer Details Updation Form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="history.back()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-sm">
<form action="updateSupExpReq.jsp" method="post" class="formAlign" style="padding-top: 05px;">
   <input type="hidden" class="form-control" name="id" required value="<%=ui.getId() %>"/>
  <div class="form-group row">
  <label for="dateSelect" class="col-md-2 col-form-label">Dealer Name</label>
    <div class="col-md-8">
    <input type="text" class="form-control" name="dealerName" required value="<%=ui.getDealerName() %>">
    </div>
  </div>
    <div class="form-group row">
  <label for="dateSelect" class="col-md-2 col-form-label">Contact no</label>
    <div class="col-md-8">
    <input type="number" class="form-control" name="tep" required value="<%=ui.getTep() %>">
    </div>
  </div>
    <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from dealingstatus");  
	        ResultSet rs=ps.executeQuery();  
%>
<div class="form-group row">
      <label for="inputState" class="col-sm-2 col-form-label">Dealing Status</label>
     <div class="col-md-8">
      <select name="status" class="form-control" required>
      <option selected><%=ui.getStatus() %></option>
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
<!-- remove duplicte -->
<script type="text/javascript">
var code = {};
$("select[name='status'] > option").each(function () {
    if(code[this.text]) {
        $(this).remove();
    } else {
        code[this.text] = this.value;
    }
});
</script>
      <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Address</label>
          <div class="col-md-8">
      <input type="text" class="form-control"name="address" required="required" value="<%=ui.getAddress() %>">
    </div>
  </div>
        <div class="form-group row">
      <label for="inputQuantity" class="col-sm-2 col-form-label">Remark</label>
          <div class="col-md-8">
      <input type="text" class="form-control" name="remark" required="required" value="<%=ui.getRemark() %>">
    </div>
  </div>
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
    
    function reply_click(element)
    {
//    document.getElementById('wt').value = "test";
    }    
    
</script>

</body>
</html>