package fms.HR.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.fms.DBconnection.DBConnection;
import com.fms.commonConstant.HRCommonConstants;
import com.fms.model.Account;
import com.fms.model.E_Leave;
import com.fms.model.Employee;
import com.fms.model.Job;
import com.fms.model.PerformanceTracking;

public class SearchServieImpt implements SearchService{

	
	//Initialize logger//
			public static final Logger log = Logger.getLogger(SearchServieImpt.class.getName());
			
			private static Connection connection;
			
			private static Statement statement;
			
			private PreparedStatement preparedStatement;
			
			
			/**--------------      Method for Search in Employee       --------------------**/
			@Override
			public ArrayList<Employee> searchEmployee(String key) {
				
				ArrayList<Employee> employeeList = new ArrayList<Employee>();
				
				if(key != null && !key.isEmpty())
				{

					try
					{
						connection = DBConnection.getDBConnection();
						
						//Query for search in Employee
						String query = "SELECT * from employee where Employee_Name like '%"+key+"%' or DOB like '%"+key+"%' or NIC like '%"+key+"%' or Gender like '%"+key+"%' or Marital_Status like '%"+key+"%' or Email like '%"+key+"%' or Contact_No like '%"+key+"%' or Address like '%"+key+"%' or Job_Title like '%"+key+"%' or Date_Joined like '%"+key+"%' or Qualification like '%"+key+"%'";
						preparedStatement = connection .prepareStatement(query);
						
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
					catch (ClassNotFoundException | SQLException e) {
						
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
				return employeeList;
			}

			/**--------------      Method for Search in Account      --------------------**/
			@Override
			public ArrayList<Account> searchAccount(String key) {
					
					ArrayList<Account> accountList = new ArrayList<Account>();
	
					if(key != null && !key.isEmpty())
					{
						try
						{
								connection = DBConnection.getDBConnection();
								
								//Query for search in Account
								String query = "select * from account where Employee_Name like '%"+key+"%' or UserName like '%"+key+"%' or Status like '%"+key+"%' or AccountType like '%"+key+"%'";
								preparedStatement = connection .prepareStatement(query);
								
								ResultSet result = preparedStatement.executeQuery();
								
									while(result.next())
									{
											Account account = new Account();
											
											account.setAccID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
											account.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
											account.setEmpName( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
											account.setUserName(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
											account.setPassword(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
											account.setStatus(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
											account.setAccType(result.getString(HRCommonConstants.COLUMN_INDEX_SEVEN));
											account.setProfileImage(result.getString(HRCommonConstants.COLUMN_INDEX_EIGHT));
								
											accountList.add(account);
									}
								
						} 
						catch ( ClassNotFoundException | SQLException e) {
								
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
				return accountList;
			}
			
			/**--------------      Method for Search in Job       --------------------**/
			@Override
			public ArrayList<Job> searchJob(String key) {
				
				ArrayList<Job> jobList = new ArrayList<Job>();
				
				if(key != null && !key.isEmpty())
				{
					try
					{
							connection = DBConnection.getDBConnection();
							
							//Query for search in Jobs
							String query = "select * from jobs where Job_Title like '%"+key+"%' or Create_Date like '%"+key+"%' or Basic_Salary like '%"+key+"%' or Salary_Payment_Methoed like '%"+key+"%' or ETF_Rate like '%"+key+"%' or EPF_Rate like '%"+key+"%' or Over_Time_Rate like '%"+key+"%'";
							preparedStatement = connection .prepareStatement(query);
							
							ResultSet result = preparedStatement.executeQuery();
							
								while(result.next())
								{
										Job job = new Job();
										
										job.setJobID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
										job.setJobTitle(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
										job.setCreatingDate( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
										job.setBasicSalary(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
										job.setSalPayMethod(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
										job.setEtfRate(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
										job.setEpfRate(result.getString(HRCommonConstants.COLUMN_INDEX_SEVEN));
										job.setOtRate(result.getString(HRCommonConstants.COLUMN_INDEX_EIGHT));
										
										jobList.add(job);
								}
							
					} 
					catch ( ClassNotFoundException | SQLException e) {
							
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
				return jobList;
			}
			
			/**--------------      Method for Search in Employee Performance Tracking       --------------------**/
			@Override
			public ArrayList<PerformanceTracking> searchPerformanceTracking(String key) {
				
				ArrayList<PerformanceTracking> PerformanceTrackingList = new ArrayList<PerformanceTracking>();

				if(key != null && !key.isEmpty())
				{
					try
					{
							connection = DBConnection.getDBConnection();
							
							//Query for search in Employee Performance Tracking
							String query = "select * from perfomance_tracking where Emp_Job_Title like '%"+key+"%' or Emp_Name like '%"+key+"%' or Time_In like '%"+key+"%' or Lunch_In like '%"+key+"%' or Lunch_Out like '%"+key+"%' or Time_Out like '%"+key+"%' or Over_Time like '%"+key+"%' or Performace like '%"+key+"%' or Description like '%"+key+"%'";
							preparedStatement = connection .prepareStatement(query);
						
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
					catch ( ClassNotFoundException | SQLException e) {
							
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
			
			/**--------------      Method for Search in Leave      --------------------**/
			@Override
			public ArrayList<E_Leave> searchLeave(String key) {
				
				ArrayList<E_Leave> leavelist = new ArrayList<E_Leave>();
				
				if(key != null && !key.isEmpty())
				{
					
					try
					{
							connection = DBConnection.getDBConnection();
							
							//Query for search in Employee Leave
							String query = "select * from e_leave where Emp_Name like '%"+key+"%' or Date like '%"+key+"%' or Month like '%"+key+"%' or Leave_Status like '%"+key+"%'";
							preparedStatement = connection .prepareStatement(query);
		
							
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
										
										leavelist.add(leave);
										
								}
							
					} 
					catch (ClassNotFoundException | SQLException e) {
							
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
				return leavelist;
			}
}
