<%@page import="org.xml.sax.SAXException"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="com.fms.commonConstant.Common"%>
<%@page import="com.fms.QueryUtil.HRQueryUtil"%>
<%@page import="com.fms.DBconnection.DBConnection"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet rs = null;
	OutputStream oImage;
	
	String id = request.getParameter("id");
	try
	{
			connection = DBConnection.getDBConnection();
			
			//Image Saving  Query will be Retrieve from HRDBQuery.xml
			preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(Common.Query_ID_GET_IMAGE));
			
			preparedStatement.setString(Common.COLUMN_INDEX_ONE, id);
			
			rs =preparedStatement.executeQuery();
			
			if(rs.next()) {
		        byte barray[] = rs.getBytes(1);
		        response.setContentType("image/jpg");
		        oImage=response.getOutputStream();
		        oImage.write(barray);
		        oImage.flush();
		        oImage.close();
		    }
			
			
	}
	catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e) {
			
		e.getStackTrace();
	}
	finally
	{
			//Closing DB Connection and Prepared statement
			try 
			{	
				if(preparedStatement != null)
				{
					preparedStatement.close();
				}
				if(connection != null)
				{
					connection.close();
				}
				
			}
			catch (SQLException e)
			{
				e.getStackTrace();
			}
			
	}

%>

</body>
</html>