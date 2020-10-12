<%@page import="fms.Expense.service.Expe_DAO"%>
<jsp:useBean id="u" class="fms.Expense.service.Expenses"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
int i=Expe_DAO.updateExp(u);  
if(i>0){  
session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
response.sendRedirect("upSucsess_SupEx.jsp");  
}else{  
response.sendRedirect("Error");  
}  
%> 