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
import com.fms.model.Account;

public class AccountServiceImpt implements AccountService {

		//Initialize logger//
		public static final Logger log = Logger.getLogger(AccountServiceImpt.class.getName());
		
		private static Connection connection;
		
		private static Statement statement;
		
		private PreparedStatement preparedStatement;
	
		
	/**--------------      Add  Account to Account table       --------------------**/
	@Override
	public void addAccount(Account Account) {
		
		String AccountID=HRCommonUtil.generateAIDs(getAccountIDs());
		
		try
		{
				connection = DBConnection.getDBConnection();
				
				//Insert Account Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_INSERT_ACCOUNT));
				connection.setAutoCommit(false);
				
				//Generate Account IDs
				Account.setAccID(AccountID);
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Account.getAccID());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Account.getEmpID());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE,Account.getEmpName());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Account.getUserName());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE, Account.getPassword());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Account.getStatus());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,Account.getAccType());
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_EIGHT,Account.getProfileImage());
				
				//Add Account
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

	/**--------------      Get  Account ID from Account table       --------------------**/
	@Override
	public String getAccountID(String EmployeeID) {

		String AccID = null;
		//Checking the Employee id is available
	
		if(EmployeeID != null && !EmployeeID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Account ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_ACCOUNT_ID));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, EmployeeID);
				
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					AccID = result.getString(1); 
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
		return AccID;
		
	}

	/**--------------      Get  Account by ID from Account table       --------------------**/
	@Override
	public Account getAccountByID(String AccountID) {
		
		Account account = new Account();
		if(AccountID != null && !AccountID.isEmpty())
		{
			
			
			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get Account by ID Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_ACCOUNT));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, AccountID);
					
					ResultSet result = preparedStatement.executeQuery();
					
					
						while(result.next())
						{
								
								
								account.setAccID(result.getString(HRCommonConstants.COLUMN_INDEX_ONE));
								account.setEmpID(result.getString(HRCommonConstants.COLUMN_INDEX_TWO));
								account.setEmpName( result.getString(HRCommonConstants.COLUMN_INDEX_THREE));
								account.setUserName(result.getString(HRCommonConstants.COLUMN_INDEX_FOUR));
								account.setPassword(result.getString(HRCommonConstants.COLUMN_INDEX_FIVE));
								account.setStatus(result.getString(HRCommonConstants.COLUMN_INDEX_SIX));
								account.setAccType(result.getString(HRCommonConstants.COLUMN_INDEX_SEVEN));
								account.setProfileImage(result.getString(HRCommonConstants.COLUMN_INDEX_EIGHT));
					
							
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
		return account;
	}

	/**--------------      Get All  Account from Account table       --------------------**/
	
	@Override
	public ArrayList<Account> getAccount() {

		ArrayList<Account> accountList = new ArrayList<Account>();

			try
			{
					connection = DBConnection.getDBConnection();
					
					//Get All Account Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_ALL_ACCOUNT));

					
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
		return accountList;
	}

	/**--------------         Update an Account in Account table       --------------------**/
	@Override
	public void updateAccount(String AccountID, Account Account) {

		//Checking the Account ID is available
		
		if(AccountID != null && !AccountID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Update Account Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_UPDATE_ACCOUNT));
					
					
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE,Account.getEmpName());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_TWO,Account.getUserName());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_THREE, Account.getPassword());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FOUR,Account.getStatus());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_FIVE,Account.getAccType());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SIX,Account.getProfileImage());
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_SEVEN,AccountID);
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
	
	/**--------------         Get Employee ID in Account table       --------------------**/
	
	@Override
	public String getEmployeeID(String AccountID) {

		String EmpID = null;
		//Checking the Account ID is available
			
		if(AccountID != null && !AccountID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee ID Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_ID_IN_AC));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, AccountID);
				
				
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

	/**--------------      Remove  Account from Account table       --------------------**/
	
	@Override
	public void removeAccount(String AccountID) {
		
		//Checking the Account ID  is available
		if(AccountID != null && !AccountID.isEmpty())
		{
			try 
			{
					connection = DBConnection.getDBConnection();
					
					//Delete An Account Query will be Retrieve from HRQuery.xml
					preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_REMOVE_ACCOUNT));
					
					preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, AccountID);
					
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

	/**--------------         Get Employee Name in Account table       --------------------**/
	
	@Override
	public String getEmpoyeeName(String AccountID) {

		String EmpName = null;
		//Checking the Account id is available
	
		if(AccountID != null && !AccountID.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee Name Query will be Retrieve from HRQuery.xml
				preparedStatement = connection .prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_GET_EMPLOYEE_NAME_IN_AC));
				
				preparedStatement.setString(HRCommonConstants.COLUMN_INDEX_ONE, AccountID);
				
				
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

	
	/**---------------------------                 Array of Account id list will be return            ---------------------------**/
	
	private ArrayList<String> getAccountIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
				
			try {
					
					connection = DBConnection.getDBConnection();
					
					//Get All Account ID will be Retrieve from HRQuery.xml
					preparedStatement = connection.prepareStatement(HRQueryUtil.queryByID(HRCommonConstants.Query_ID_ALL_ACCOUNT_IDS));
					
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
