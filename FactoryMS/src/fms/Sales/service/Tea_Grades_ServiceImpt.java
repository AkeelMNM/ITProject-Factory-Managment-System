package fms.Sales.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.SalesQueryUtil;
import com.fms.commonConstant.SalesCommonConstants;
import com.fms.model.Tea_Grades;

public class Tea_Grades_ServiceImpt implements Tea_Grades_Service {
	
	//Initialize logger//
	public static final Logger log = Logger.getLogger(Tea_Grades_ServiceImpt.class.getName());
	
	private static Connection connection;
	
	private PreparedStatement preparedStatement;
	
/**--------------------------   Get All Tea Grades in Tea_Greads table   -----------------------------------**/		
	@Override
	public ArrayList<Tea_Grades> getAllTeaGrades() 
	{
		ArrayList<Tea_Grades> TeaGradesList = new ArrayList<Tea_Grades>();
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			//Get All Tea_Grade Query will be Retrieve from SalesQuery.xml 
			preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_ALL_TEA_GRADES));
			
			ResultSet result = preparedStatement.executeQuery();
			
			while(result.next())
			{
				Tea_Grades TeaGrade = new Tea_Grades();
				
				TeaGrade.setTeaGrade_ID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
				TeaGrade.setTea_Grade_Name(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
				
				TeaGradesList.add(TeaGrade);
			}
		} catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException ex ) {
			
			log.log(Level.SEVERE,ex.getMessage());
		} finally {
			
			//Closing DB Connection and Prepared statement
			try {	
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}	
			}
			catch (SQLException ex) {
				log.log(Level.SEVERE,ex.getMessage());
			}
		}
		
		return TeaGradesList;
	}

	
/**--------------------------   Get All Tea Grades in Tea_Greads table   -----------------------------------**/		
	@Override
	public String getTeaGradeName(String TeaGradeID) 
	{
		String TeaGradeName = null ;
		
		if(TeaGradeID != null && !TeaGradeID.isEmpty())
		{
			try {		
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_TEA_GRADE_NAME));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, TeaGradeID);
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					TeaGradeName = result.getString(1);
				}
				
			} catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException ex ) {
				
				log.log(Level.SEVERE,ex.getMessage());
			} finally {
				
				//Closing DB Connection and Prepared statement
				try {	
					if(preparedStatement != null) {
						preparedStatement.close();
					}
					if(connection != null) {
						connection.close();
					}	
				}
				catch (SQLException ex) {
					log.log(Level.SEVERE,ex.getMessage());
				}
			}
		}
		return TeaGradeName;
	}
	
	
	
	

}
