package fms.HR.service;

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
import com.fms.model.Employee;

public class EmployeeServiceImpt implements EmployeeService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(EmployeeServiceImpt.class.getName());
			
	private static Connection connection;
		
	private static Statement statement;
			
	private PreparedStatement preparedStatement;
	
	
	/** -------------    Add Employee for Employee table        ------------------------**/
	
	@Override
	public void addEmployee(Employee Employee) {
				
		String EmployeeID=HRCommonUtil.generateEIDs(getEmployeeIDs());
				
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Insert Employee Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_INSERT_EMPLOYEE));
					connection.setAutoCommit(false);
					
					//Generate Employee IDs
					Employee.setEmpID(EmployeeID);
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Employee.getEmpID());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Employee.getJobID());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,Employee.getName());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Employee.getDOB() );
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE, Employee.getNIC());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Employee.getGender());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,Employee.getMaritalStatus());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_EIGHT,Employee.getEmail());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_NINE,Employee.getContactNo());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TEN,Employee.getAddress());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ELEVEN,Employee.getJobTitle());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWELVE,Employee.getJointDate());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THIRTEEN,Employee.getQualification());
					
					//Add Employee
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
	
	
	/** -------------    Get Employee by ID from Employee table         ------------------------**/
	
	@Override
	public Employee getEmployeeByID(String EmployeeID) {
	
	
		Employee employee = new Employee();
	
		if(EmployeeID != null && !EmployeeID.isEmpty())
		{
			
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get Employee by ID Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, EmployeeID);
					
					ResultSet result = preparedStatement.executeQuery();
					
						while(result.next())
						{
								
								employee.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
								employee.setJobID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
								employee.setName( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
								employee.setDOB(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
								employee.setNIC(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
								employee.setGender(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
								employee.setMaritalStatus(result.getString(HRCommonConstants.COLUMN_INDEX_SEVEN));
								employee.setEmail(result.getString(HRCommonConstants.COLUMN_INDEX_EIGHT));
								employee.setContactNo(result.getString(HRCommonConstants.COLUMN_INDEX_NINE));
								employee.setAddress(result.getString(HRCommonConstants.COLUMN_INDEX_TEN));
								employee.setJobTitle(result.getString(HRCommonConstants.COLUMN_INDEX_ELEVEN));
								employee.setJointDate(result.getString(HRCommonConstants.COLUMN_INDEX_TWELVE));
								employee.setQualification(result.getString(HRCommonConstants.COLUMN_INDEX_THIRTEEN));
								
								
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
		return employee;
	}

	
	/** -------------    Get All Employee from Employee table        ------------------------**/
	
	@Override
	public ArrayList<Employee> getEmployee() {
		
	ArrayList<Employee> employeeList = new ArrayList<Employee>();
		
		try
		{
				connection = DBConnection.getDBConnection();
				
				//Get Attendance by ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_ALL_EMPLOYEE));
				
				
				ResultSet result = preparedStatement.executeQuery();
				
					while(result.next())
					{
							Employee employee = new Employee();
							
							employee.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
							employee.setJobID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
							employee.setName( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
							employee.setDOB(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
							employee.setNIC(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
							employee.setGender(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
							employee.setMaritalStatus(result.getString(HRCommonConstants.COLUMN_INDEX_SEVEN));
							employee.setEmail(result.getString(HRCommonConstants.COLUMN_INDEX_EIGHT));
							employee.setContactNo(result.getString(HRCommonConstants.COLUMN_INDEX_NINE));
							employee.setAddress(result.getString(HRCommonConstants.COLUMN_INDEX_TEN));
							employee.setJobTitle(result.getString(HRCommonConstants.COLUMN_INDEX_ELEVEN));
							employee.setJointDate(result.getString(HRCommonConstants.COLUMN_INDEX_TWELVE));
							employee.setQualification(result.getString(HRCommonConstants.COLUMN_INDEX_THIRTEEN));
							
							employeeList.add(employee);
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
		return employeeList;
	}

	/**--------------         Update an Employee in Employee table       --------------------**/
	
	@Override
	public void updateEmployee(String EmployeeID, Employee Employee) {
		
		//Checking the Employee ID is available
		
		if(EmployeeID != null && !EmployeeID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Update Employee Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_UPDATE_EMPLOYEE));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Employee.getName());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Employee.getDOB() );
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE, Employee.getNIC());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Employee.getGender());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE,Employee.getMaritalStatus());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Employee.getEmail());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,Employee.getContactNo());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_EIGHT,Employee.getAddress());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_NINE,Employee.getJobTitle());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TEN,Employee.getJointDate());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ELEVEN,Employee.getQualification());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWELVE, EmployeeID);
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

	/** -------------    Remove Employee by ID from Employee table         ------------------------**/
	
	@Override
	public void removeEmployee(String EmployeeID) {

		//Checking the Employee id is available
		
		if(EmployeeID != null && !EmployeeID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Delete An Employee Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_REMOVE_EMPLOYEE));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, EmployeeID);
					
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

	/** -------------    Get Employee ID by Name for Employee table         ------------------------**/
	
	@Override
	public String getEmployeeID(String EmployeeName) {
		
		String EmpID = null;
		//Checking the Employee Name is available
			
		if(EmployeeName != null && !EmployeeName.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_ID));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, EmployeeName);
				
				
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
	
	/** -------------    Get Employee ID by Name for Employee table         ------------------------**/
	
	@Override
	public String getEmployeeName(String EmployeeID) {

		String EmpName = null;
		//Checking the Employee id is available
	
		if(EmployeeID != null && !EmployeeID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee Name Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_NAME));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, EmployeeID);
				
				
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
	
	/**--------------------------- Get Job ID by Job Name from Job table ---------------------------**/
	
	@Override
	public String getJobID(String JobName) {

		String JobID = null;
		//Checking the Employee Name is available
			
		if(JobName != null && !JobName.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_EMPLOYEE_JOB_ID));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, JobName);
				
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					JobID = result.getString(1); 
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
		return JobID;
	}
	
	@Override
	public ArrayList<String> getAllEmployeeName() {

		ArrayList<String> arraylist = new ArrayList<String>();
		
		try {
				
				connection = DBConnection.getDBConnection();
				
				//Get All Employee ID will be Retrieve from HRQuery.xml
				preparedStatement = connection.prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_ALL_EMPLOYEE_NAME));
				
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
	
	/**---------------------------                 Array of Employee id list will be return            ---------------------------**/
	
	private ArrayList<String> getEmployeeIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
				
			try {
					
					connection = DBConnection.getDBConnection();
					
					//Get All Employee ID will be Retrieve from HRQuery.xml
					preparedStatement = connection.prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_ALL_EMPLOYEE_IDS));
					
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
