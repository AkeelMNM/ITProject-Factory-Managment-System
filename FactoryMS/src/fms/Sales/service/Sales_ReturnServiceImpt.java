package fms.Sales.service;

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
import com.fms.QueryUtil.SalesQueryUtil;
import com.fms.commonConstant.SalesCommonConstants;
import com.fms.commonUtil.SalesCommonUtil;
import com.fms.model.Sales_Return;

/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

public class Sales_ReturnServiceImpt implements Sales_ReturnService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(Tea_Grade_PriceServiceImpt.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private PreparedStatement preparedStatement;
	

/**-------------   Add Sales return For Sales return Table --------------**/
	@Override
	public void AddSalesReturn(Sales_Return Sales_Return) {
		
		String FactorySalesID = SalesCommonUtil.generateTea_Grade_PriceIDs(getFactorySalesIDs());
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			// Insert Sales_Return Query will be Retrieve from SalesQuery.xml 
			preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_INSERT_SalesReturn));
			connection.setAutoCommit(false);
			
			//Generate Sales_Return IDs
			Sales_Return.setSales_ReturnID(FactorySalesID);
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, Sales_Return.getSales_ReturnID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, Sales_Return.getFactory_SalesID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, Sales_Return.getDate());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, Sales_Return.getTea_Grade());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, Sales_Return.getReturn_Quantity());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SIX, Sales_Return.getSales_Type());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SEVEN, Sales_Return.getMonth());
			
			//Add Sales_Return
			preparedStatement.execute();
			connection.commit();
			
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

	
/**-------------   Delete Sales return by SalesReturnId For Sales return Table  --------------**/	
	@Override
	public void removeSalesReturn(String SalesReturnID) {
		
		//Checking the Sales Return id is available
		if(SalesReturnID != null && !SalesReturnID.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_REMOVE_SalesReturn));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, SalesReturnID);
				preparedStatement.executeUpdate();
				
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
		
	}

	
/**--------------------------   Update Sales return  -----------------------------------**/			
	@Override
	public Sales_Return UpdateSalesReturn(String SalesReturnID, Sales_Return Sales_Return) 
	{	
		if(SalesReturnID != null && !SalesReturnID.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_UPDATE_SalesReturn));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, Sales_Return.getFactory_SalesID());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, Sales_Return.getDate());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, Sales_Return.getTea_Grade());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, Sales_Return.getReturn_Quantity());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, Sales_Return.getSales_Type());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SIX, Sales_Return.getMonth());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SEVEN, Sales_Return.getSales_ReturnID());
			
				preparedStatement.executeUpdate();
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
		
		return getSalesReturnByID(SalesReturnID); 
	}
	
	
/**-------------   get Get All For Sales return Table and get by id  --------------**/		
	
/**-------------   View All Sales return  --------------**/
	@Override
	public ArrayList<Sales_Return> getSalesReturn() {

		return actionOnFactorySales(null);
	}
	
/**-------------   View Factory Sales by ID (one details) --------------**/	
	@Override
	public Sales_Return getSalesReturnByID(String SalesReturnID) {

		return actionOnFactorySales(SalesReturnID).get(0);
	}
	
	
	public ArrayList<Sales_Return> actionOnFactorySales(String SalesReturnID)
	{
		ArrayList<Sales_Return> FactorySalesList = new ArrayList<Sales_Return>();
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			if(SalesReturnID != null && !SalesReturnID.isEmpty()) {
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_SalesReturnBYid));
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, SalesReturnID);
			}
			else {
				//Get All Tea_Grade_Price Query will be Retrieve from SalesQuery.xml 
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_ALL_SalesReturn));
			}
			
			ResultSet result = preparedStatement.executeQuery();
			
			while(result.next())
			{
				Sales_Return rtn = new Sales_Return();
				
				rtn.setSales_ReturnID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
				rtn.setFactory_SalesID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
				rtn.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
				rtn.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
				rtn.setReturn_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
				rtn.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
				rtn.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));
				
				FactorySalesList.add(rtn);
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
		
		return FactorySalesList;
	}
	
	
/**---------------------    Array of Sales return id list will be return    ---------------**/
	
	private ArrayList<String> getFactorySalesIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
					
			try {
						
						connection = DBConnection.getDBConnection();
						
						//Get All Factory Sales IDs Query will be Retrieve from SalesQuery.xml 
						preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_ALL_SalesReturn_IDS));
						
						ResultSet result = preparedStatement.executeQuery();
						while(result.next())
						{
							arraylist.add(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
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
