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
import com.fms.model.Job;

public class JobServiceImpt implements JobService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(JobServiceImpt.class.getName());
			
	private static Connection connection;
		
	private static Statement statement;
			
	private PreparedStatement preparedStatement;
	
	
	/** -------------    Add Job to Job table        ------------------------**/
	
	@Override
	public void addJob(Job Job) {

		String JobID=HRCommonUtil.generateEIDs(getJobIDs());
		
		try
		{
				connection = DBConnection.getDBConnection();
				
				//Insert Job Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_INSERT_JOB));
				connection.setAutoCommit(false);
				
				//Generate Job IDs
				Job.setJobID(JobID);
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Job.getJobID());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Job.getJobTitle());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,Job.getCreatingDate());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Job.getBasicSalary());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE, Job.getSalPayMethod());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Job.getEtfRate());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,Job.getEpfRate());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_EIGHT,Job.getOtRate());
				
				//Add Job
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

	/** -------------    Get Job by id from Job table        ------------------------**/
	
	@Override
	public ArrayList<Job> getJobByID(String JobID) {
	
		ArrayList<Job> jobList = new ArrayList<Job>();
		
		if(JobID != null && !JobID.isEmpty())
		{
			
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get Job by ID Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_JOB));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, JobID);
					
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
		return jobList;
	}

	/** -------------    Get All Job from Job table        ------------------------**/
	
	@Override
	public ArrayList<Job> getJob() {

		ArrayList<Job> jobList = new ArrayList<Job>();
			
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get All Job  Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_JOB));
					
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
		
		return jobList;
	}

	/** -------------    Update Job in Job table        ------------------------**/
	
	@Override
	public void updateJob(String JobID, Job Job) {

		//Checking the Employee ID is available
		
		if(JobID != null && !JobID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Update Job Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_UPDATE_JOB));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Job.getJobID());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Job.getJobTitle());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,Job.getCreatingDate());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Job.getBasicSalary());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE, Job.getSalPayMethod());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Job.getEtfRate());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,Job.getEpfRate());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_EIGHT,Job.getOtRate());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_NINE,JobID);
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

	/** -------------    Remove Job in Job table        ------------------------**/
	
	@Override
	public void removeJob(String JobID) {

		//Checking the Job id is available
		
		if(JobID != null && !JobID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Delete An Job Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_REMOVE_JOB));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, JobID);
					
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
	
	private ArrayList<String> getJobIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
				
			try {
					
					connection = DBConnection.getDBConnection();
					
					//Get All Employee ID will be Retrieve from HRQuery.xml
					preparedStatement = connection.prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_ALL_JOB_IDS));
					
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
