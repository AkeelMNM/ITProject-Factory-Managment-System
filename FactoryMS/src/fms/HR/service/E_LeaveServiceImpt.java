package fms.HR.service;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */

import java.io.IOException;
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
import com.fms.commonConstant.HRCommonConstants;
import com.fms.commonUtil.HRCommonUtil;
import com.fms.model.E_Leave;
import com.fms.model.Employee;

public class E_LeaveServiceImpt implements E_LeaveService{

	//Initialize logger//
	public static final Logger log = Logger.getLogger(E_LeaveServiceImpt.class.getName());
				
	private static Connection connection;
			
	private static Statement statement;
				
	private PreparedStatement preparedStatement;
	
	/** -------------    Add Leave to E_Leave table        ------------------------**/
	
	@Override
	public void addLeave(E_Leave Leave) {

		String LeaveID=HRCommonUtil.generateEIDs(getLeaveIDs());
		
		try
		{
				connection = DBConnection.getDBConnection();
				
				//Insert Leave Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_INSERT_LEAVE));
				connection.setAutoCommit(false);
				
				//Generate Leave IDs
				Leave.setLeaveID(LeaveID);
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Leave.getLeaveID());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Leave.getEmpID());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,Leave.getEmpName());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Leave.getDate());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE, Leave.getMonth());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Leave.getLeave_Status());
				
				//Add Leave
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

	/** -------------    Get Leave id from E_leave table        ------------------------**/
	

	@Override
	public String getLeaveID(String EmployeeID) {
	
		String LeaveID = null;
		//Checking the Employee id is available
	
		if(EmployeeID != null && !EmployeeID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Account ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_LEAVE_ID));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, EmployeeID);
				
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					LeaveID = result.getString(1); 
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
		return LeaveID;
	}

	/** -------------    Get Leave by id from E_leave table        ------------------------**/
	
	@Override
	public ArrayList<E_Leave> getLeaveByID(String LeaveID) {

		ArrayList<E_Leave> leaveList = new ArrayList<E_Leave>();
		
		if(LeaveID != null && !LeaveID.isEmpty())
		{
			
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get Leave by ID Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_LEAVE));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, LeaveID);
					
					ResultSet result = preparedStatement.executeQuery();
					
						while(result.next())
						{
								E_Leave leave = new E_Leave();
								
								leave.setLeaveID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
								leave.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
								leave.setEmpName( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
								leave.setDate(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
								leave.setMonth(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
								leave.setLeave_Status(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
								leaveList.add(leave);
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
		return leaveList;
	}

	/** -------------    Get All Leave from E_leave table        ------------------------**/
	
	@Override
	public ArrayList<E_Leave> getLeave() {

		ArrayList<E_Leave> leaveList = new ArrayList<E_Leave>();
		
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get Leave by ID Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_ALL_LEAVE));
					
					
					ResultSet result = preparedStatement.executeQuery();
					
						while(result.next())
						{
								E_Leave leave = new E_Leave();
								
								leave.setLeaveID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
								leave.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
								leave.setEmpName( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
								leave.setDate(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
								leave.setMonth(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
								leave.setLeave_Status(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
								leaveList.add(leave);
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
		
		return leaveList;
	}

	/** -------------    Update Leave in E_leave table        ------------------------**/
	
	@Override
	public void updateLeave(String LeaveID, E_Leave Leave) {

		//Checking the Leave ID is available
		
		if(LeaveID != null && !LeaveID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Update Leave Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_UPDATE_EMPLOYEE));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Leave.getLeaveID());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Leave.getEmpID());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,Leave.getEmpName());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Leave.getDate());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE, Leave.getMonth());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Leave.getLeave_Status());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN, LeaveID);
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

	/** -------------    Remove Employee from E_leave table        ------------------------**/
	
	@Override
	public void removeLeave(String LeaveID) {

		//Checking the Leave id is available
		
		if(LeaveID != null && !LeaveID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Delete An Leave Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_REMOVE_LEAVE));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, LeaveID);
					
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

	/** -------------    Get Employee id from E_leave table        ------------------------**/
	
	@Override
	public String getEmployeeID(String LeaveID) {

		String EmpID = null;
		//Checking the Employee ID is available
			
		if(LeaveID != null && !LeaveID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_ID_IN_LEV));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, LeaveID);
				
				
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

	/** -------------    Get Employee Name from E_leave table        ------------------------**/
	
	@Override
	public String getEmpoyeeName(String LeaveID) {
		
		String EmpName = null;
		//Checking the Employee Name is available
	
		if(LeaveID != null && !LeaveID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee Name Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_NAME_IN_LEV));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, LeaveID);
				
				
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
	
	private ArrayList<String> getLeaveIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
				
			try {
					
					connection = DBConnection.getDBConnection();
					
					//Get All Leave ID will be Retrieve from HRQuery.xml
					preparedStatement = connection.prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_ALL_LEAVE_IDS));
					
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