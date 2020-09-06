package fms.HR.service;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.HRQueryUtil;
import com.fms.commonConstant.HRCommonConstants;
import com.fms.commonUtil.HRCommonUtil;
import com.fms.model.Employee;
import com.fms.model.PerformanceTracking;

public class PerformanceTrackingServiceImpt implements PerformanceTrackingService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(PerformanceTrackingServiceImpt.class.getName());
				
	private static Connection connection;
			
	private static Statement statement;
				
	private PreparedStatement preparedStatement;
	
	
	/** -------------    Add Performance Tracking to Performance Tracking table        ------------------------**/
	
	@Override
	public void addPerformanceTracking(PerformanceTracking performanceTracking) {
		
		String PerfromanceTrackingID=HRCommonUtil.generatePTIDs(getPerformanceTrackingIDs());
		
		try
		{
				connection = DBConnection.getDBConnection();
				
				//Insert Performance Tracking Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_INSERT_PERFROMANCE_TRACKING));
				connection.setAutoCommit(false);
				
				//Generate Performance Tracking IDs
				performanceTracking.setEPTID(PerfromanceTrackingID);;
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,performanceTracking.getEPTID());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,performanceTracking.getEmpID());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,performanceTracking.getJobTitle());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,performanceTracking.getEmpName());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE,performanceTracking.getTimeIn());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,performanceTracking.getLunchIn());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,performanceTracking.getLunchOut());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_EIGHT,performanceTracking.getTimeOut());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_NINE,performanceTracking.getOvetTime());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TEN,performanceTracking.getPerformace());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ELEVEN,performanceTracking.getDescription());

				
				//Add Performance Tracking
				preparedStatement.execute();
				connection.commit();
				
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

	/** -------------    Get Performance Tracking id from Performance Tracking table        ------------------------**/
	
	@Override
	public String getPerformacneTrackingID(String EmployeeID) {

		String EPTID = null;
		//Checking the Employee id is available
	
		if(EmployeeID != null && !EmployeeID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Account ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_PERFROMANCE_TRACKING_ID));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, EmployeeID);
				
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					EPTID = result.getString(1); 
				}
			}
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e)
			{
				
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
		return EPTID;
	}

	/** -------------    Get Performance Tracking by id from Performance Tracking table        ------------------------**/
	
	@Override
	public ArrayList<PerformanceTracking> getPerformacneTrackingByID(String performanceTrackingID) {
		
		ArrayList<PerformanceTracking> PerformanceTrackingList = new ArrayList<PerformanceTracking>();
		
		if(performanceTrackingID != null && !performanceTrackingID.isEmpty())
		{
			
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get PerformanceTracking by ID Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_PERFROMANCE_TRACKING));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, performanceTrackingID);
					
					ResultSet result = preparedStatement.executeQuery();
					
						while(result.next())
						{
								PerformanceTracking performanceTracking = new PerformanceTracking();
								
								performanceTracking.setEPTID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
								performanceTracking.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
								performanceTracking.setJobTitle( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
								performanceTracking.setEmpName(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
								performanceTracking.setTimeIn(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
								performanceTracking.setLunchIn(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
								performanceTracking.setLunchOut(result.getString(HRCommonConstants.COLUMN_INDEX_SEVEN));
								performanceTracking.setTimeOut(result.getString(HRCommonConstants.COLUMN_INDEX_EIGHT));
								performanceTracking.setOvetTime(result.getString(HRCommonConstants.COLUMN_INDEX_NINE));
								performanceTracking.setPerformace(result.getString(HRCommonConstants.COLUMN_INDEX_TEN));
								performanceTracking.setDescription(result.getString(HRCommonConstants.COLUMN_INDEX_ELEVEN));
								
								PerformanceTrackingList.add(performanceTracking);
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
		}
		return PerformanceTrackingList;
	}
	
	/** -------------    Get All Performance Tracking from Performance Tracking table        ------------------------**/

	@Override
	public ArrayList<PerformanceTracking> getPerformacneTracking() {

		ArrayList<PerformanceTracking> PerformanceTrackingList = new ArrayList<PerformanceTracking>();

			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get All PerformanceTracking Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_ALL_PERFROMANCE_TRACKING));
				
					
					ResultSet result = preparedStatement.executeQuery();
					
						while(result.next())
						{
								PerformanceTracking performanceTracking = new PerformanceTracking();
								
								performanceTracking.setEPTID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
								performanceTracking.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
								performanceTracking.setJobTitle( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
								performanceTracking.setEmpName(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
								performanceTracking.setTimeIn(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
								performanceTracking.setLunchIn(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
								performanceTracking.setLunchOut(result.getString(HRCommonConstants.COLUMN_INDEX_SEVEN));
								performanceTracking.setTimeOut(result.getString(HRCommonConstants.COLUMN_INDEX_EIGHT));
								performanceTracking.setOvetTime(result.getString(HRCommonConstants.COLUMN_INDEX_NINE));
								performanceTracking.setPerformace(result.getString(HRCommonConstants.COLUMN_INDEX_TEN));
								performanceTracking.setDescription(result.getString(HRCommonConstants.COLUMN_INDEX_ELEVEN));
								
								PerformanceTrackingList.add(performanceTracking);
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
		
		return PerformanceTrackingList;
	}

	/** -------------    Update Performance Tracking by id from Performance Tracking table        ------------------------**/
	@Override
	public void updatePerformanceTracking(String performanceTrackingID, PerformanceTracking performanceTracking) {

		//Checking the performanceTracking ID is available
		
		if(performanceTrackingID != null && !performanceTrackingID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Update Performance Tracking Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_UPDATE_PERFROMANCE_TRACKING));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,performanceTracking.getEPTID());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,performanceTracking.getEmpID());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,performanceTracking.getJobTitle());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,performanceTracking.getEmpName());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE,performanceTracking.getTimeIn());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,performanceTracking.getLunchIn());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,performanceTracking.getLunchOut());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_EIGHT,performanceTracking.getTimeOut());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_NINE,performanceTracking.getOvetTime());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TEN,performanceTracking.getPerformace());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ELEVEN,performanceTracking.getDescription());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWELVE,performanceTrackingID);
					preparedStatement.executeUpdate();
			}
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e)
			{
					
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

	/** -------------    Remove Performance Tracking by id from Performance Tracking table        ------------------------**/
	
	@Override
	public void removePerformacneTracking(String performanceTrackingID) {
		
		//Checking the performanceTracking id is available
		
		if(performanceTrackingID != null && !performanceTrackingID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Delete An performance Tracking Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_REMOVE_PERFROMANCE_TRACKING));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, performanceTrackingID);
					
					preparedStatement.executeUpdate();
			}
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e)
			{
					
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

	/** -------------    Get Employee Name by id from Performance Tracking table        ------------------------**/
	@Override
	public String getEmpoyeeName(String performanceTrackingID) {
		
		String EmpName = null;
		//Checking the performanceTrackingID is available
			
		if(performanceTrackingID != null && !performanceTrackingID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee Name Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_NAME_IN_PT));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, performanceTrackingID);
				
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					EmpName = result.getString(1); 
				}
			}
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e)
			{
				
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
		return EmpName;
	}


	/** -------------    Get Employee ID by id from Performance Tracking table        ------------------------**/
	@Override
	public String getEmployeeID(String performanceTrackingID) {

		String EmpID = null;
		//Checking the performanceTrackingID is available
			
		if(performanceTrackingID != null && !performanceTrackingID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_ID_IN_PT));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, performanceTrackingID);
				
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					EmpID = result.getString(1); 
				}
			}
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e)
			{
				
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
		return EmpID;
	}

	/**---------------------------                 Array of Performance Tracking id list will be return            ---------------------------**/
	
	private ArrayList<String> getPerformanceTrackingIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
				
			try {
					
					connection = DBConnection.getDBConnection();
					
					//Get All Employee ID will be Retrieve from HRQuery.xml
					preparedStatement = connection.prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_ALL_PERFROMANCE_TRACKING_IDS));
					
					ResultSet result = preparedStatement.executeQuery();
					while(result.next())
					{
						arraylist.add(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
					}	
			} 
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e)
			{	
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
				return arraylist;
	}


	
}
