<%@page import="fms.Expense.service.ExSupplierDao"%>
<%@page import="fms.Expense.*"%>  
<jsp:useBean id="u" class="fms.Expense.service.ExSupplier"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=ExSupplierDao.save(u);  
if(i>0){  
session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
response.sendRedirect("prodAdd-success.jsp");  
}else{  
response.sendRedirect("");  
}  
%> 