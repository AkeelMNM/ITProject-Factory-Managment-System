<%@page import="fms.Production.service.ProductionDao"%>  
<jsp:useBean id="u" class="fms.Production.service.Production"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
    <%  
    int i=ProductionDao.update(u);  
    if(i>0){  
    	session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
    	response.sendRedirect("prodAdd-success.jsp");  
    	}else{  
    	response.sendRedirect("");  
    	}  
    %>  