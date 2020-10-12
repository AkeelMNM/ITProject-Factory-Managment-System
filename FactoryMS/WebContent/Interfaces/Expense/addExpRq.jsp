<%@page import="fms.Expense.service.Expe_DAO"%>
<%@page import="fms.Expense.*"%>  
<jsp:useBean id="u" class="fms.Expense.service.Expenses"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=Expe_DAO.save(u);  
if(i>0){  
session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
response.sendRedirect("prodAdd-success.jsp");  
}else{  
response.sendRedirect("");  
}  
%> 