
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="fms.Production.service.ProductionDao"%>
<%@page import="fms.Production.service.Production"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.fms.DBconnection.*"%>
<%@ page import="java.sql.*" %>
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
        $("#exampleModal").modal('show');
    });
</script>
</head>
<body>
<%
String id=request.getParameter("id"); 
Production ui=ProductionDao.getRecordById(Integer.parseInt(id));  
%>
<!-- Update form -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
    <div class="col-sm">

<form action="updateProducts.jsp" method="post" class="formAlign" style="padding-top: 20px;">
  <div class="form-row">
   <input type="hidden" class="form-control" name="id" required value="<%=ui.getId() %>"/>
  <div class="form-group col-md-4">
  <label for="dateSelect">Select Date</label>
  </div>
  <div class="form-group col-md-6">
  <input type="date" class="form-control" name="date" required value="<%=ui.getDate() %>">
  </div>
  <% 
      try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
	    	Connection con=DBConnection.getDBConnection(); 
	        PreparedStatement ps=con.prepareStatement("select * from qulity");  
	        ResultSet rs=ps.executeQuery();  
%>
    <div class="form-group col-md-4">
      <label for="inputState">Tea Quality</label>
      <select name="teaGrade" class="form-control">
            <option selected><%=ui.getTeaGrade() %></option>
		<%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
      </select>
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
$("select[name='teaGrade'] > option").each(function () {
    if(code[this.text]) {
        $(this).remove();
    } else {
        code[this.text] = this.value;
    }
});
</script>
    <div class="form-group col-md-6">
      <label for="inputQuantity">Quantity</label>
      <input type="text" class="form-control" name="quntity" placeholder="Quantiy" required="required" value="<%=ui.getQuntity() %>">
    </div>
  </div>
   <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="history.back()">Back</button>
         <button type="submit" class="btn btn-primary" >Update</button>
</form>
    </div>
    </div>
      </div>
    </div>
  </div>
</div>	
</body>
</html>