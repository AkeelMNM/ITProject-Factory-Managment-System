package fms.Login.ServiceANDServlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.HRQueryUtil;
import com.fms.commonConstant.Common;
import com.fms.model.Account;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */


public class LoginServiceImpt {
	
	
		//Initialize logger//
		public static final Logger log = Logger.getLogger(LoginServiceImpt.class.getName());
		
		private static Connection connection;
		
		private static Statement statement;
		
		private PreparedStatement preparedStatement;
		

		    
public boolean checkUser(String Username,String Password) 
		    {
		        boolean st = false;
		        try {
		        	
		        	connection = DBConnection.getDBConnection();
		        	
		        	preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(Common.Query_ID_GET_LOGIN));
					
					preparedStatement.setString(Common.COLUMN_INDEX_ONE, Username);
					preparedStatement.setString(Common.COLUMN_INDEX_TWO, Password);
					
		            ResultSet rs =preparedStatement.executeQuery();
		            st = rs.next();

		        }
		        catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e) {
					
					log.log(Level.SEVERE,e.getMessage());
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
							log.log(Level.SEVERE,e.getMessage());
						}
						
				}
		        return st;                 
}   


	
public ArrayList<String> checkLogin(String Username,String Password)
{
			ArrayList<String> loginList = new ArrayList<String>();
			
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Login Query will be Retrieve from HRDBQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(Common.Query_ID_GET_LOGIN));
					
					preparedStatement.setString(Common.COLUMN_INDEX_ONE, Username);
					preparedStatement.setString(Common.COLUMN_INDEX_TWO, Password);
					
					ResultSet result = preparedStatement.executeQuery();
					
						while(result.next())
						{
								
								loginList.add(result.getString(Common.COLUMN_INDEX_ONE));
								loginList.add(result.getString(Common.COLUMN_INDEX_TWO));
								loginList.add(result.getString(Common.COLUMN_INDEX_THREE));
								loginList.add(result.getString(Common.COLUMN_INDEX_FOUR));
								loginList.add(result.getString(Common.COLUMN_INDEX_FIVE));
						}
					
			} 
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e) {
					
					log.log(Level.SEVERE,e.getMessage());
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
						log.log(Level.SEVERE,e.getMessage());
					}
					
			}
			return loginList;
}

public void uploadImage(InputStream file,String AccID) {
	
	try
	{
			connection = DBConnection.getDBConnection();
			
			//Image Saving  Query will be Retrieve from HRDBQuery.xml
			preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(Common.Query_ID_GET_PROFILE_IMAGE_SAVE));
			
			preparedStatement.setBlob(Common.COLUMN_INDEX_ONE, file);
			preparedStatement.setString(Common.COLUMN_INDEX_TWO, AccID);
			
			preparedStatement.executeUpdate();
	}
	catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e) {
			
			log.log(Level.SEVERE,e.getMessage());
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
				log.log(Level.SEVERE,e.getMessage());
			}
			
	}
}

public void changePassword(String pass,String AccID) {
	
	try
	{
			connection = DBConnection.getDBConnection();
			
			//Image Saving  Query will be Retrieve from HRDBQuery.xml
			preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(Common.Query_ID_GET_PASSWORD_CHANGE));
			
			preparedStatement.setString(Common.COLUMN_INDEX_ONE, pass);
			preparedStatement.setString(Common.COLUMN_INDEX_TWO, AccID);
			
			preparedStatement.executeUpdate();
	}
	catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e) {
			
			log.log(Level.SEVERE,e.getMessage());
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
				log.log(Level.SEVERE,e.getMessage());
			}
			
	}
}

public void changeEmail(String email,String AccID) {
	
	try
	{
			connection = DBConnection.getDBConnection();
			
			//Image Saving  Query will be Retrieve from HRDBQuery.xml
			preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(Common.Query_ID_GET_EMIAL_CHANGE));
			
			preparedStatement.setString(Common.COLUMN_INDEX_ONE, email);
			preparedStatement.setString(Common.COLUMN_INDEX_TWO, AccID);
			
			preparedStatement.executeUpdate();
	}
	catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e) {
			
			log.log(Level.SEVERE,e.getMessage());
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
				log.log(Level.SEVERE,e.getMessage());
			}
			
	}
}

}
