<%@page import="fms.Expense.service.ExSupplierDao"%>
<jsp:useBean id="u" class="fms.Expense.service.ExSupplier"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  

<%  
int i=ExSupplierDao.delete(u);  
if(i>0){  
session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
response.sendRedirect("deleteConfirm.jsp");  
}else{  
response.sendRedirect("");  
}  
%> 