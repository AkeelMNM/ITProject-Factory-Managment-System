<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/0.4.2/sweet-alert.min.js"></script>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/0.4.2/sweet-alert.css">
</head>
<body>
<%
session.setMaxInactiveInterval(2);
%>

 <script type="text/javascript">
var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
 function alertName(){
// alert("Sucsess!!!!");
 //window.location.href = "production.jsp";
	 sweetAlert({
		    title: "Success!",
		    text: "Data Save to DB!",
		    type: "success"
		},

		function () {
		    window.location.href = 'production.jsp';
		});

 } 
 }
 </script> 
 <script type="text/javascript"> window.onload = alertName; </script>
</body>
</html>