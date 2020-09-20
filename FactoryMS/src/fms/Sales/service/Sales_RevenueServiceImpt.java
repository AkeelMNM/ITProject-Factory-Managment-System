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
import com.fms.model.Sales_Revenue;

/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

public class Sales_RevenueServiceImpt implements Sales_RevenueService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(Sales_RevenueServiceImpt.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private PreparedStatement preparedStatement;
	
	
/**-----------------   Add Sales Revenue For Sales_Revenue Table  -----------------------------**/	
	@Override
	public void AddSalesRevenue(Sales_Revenue Sales_Revenue) {

		String SalesRevenueID = SalesCommonUtil.generateTea_Grade_PriceIDs(getSalesRevenueIDs());
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			// Insert TeaGradePrice Query will be Retrieve from SalesQuery.xml 
			preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_INSERT_SalesRevenue));
			connection.setAutoCommit(false);
			
			//Generate Sales Revenue IDs
			Sales_Revenue.setSales_RevenueID(SalesRevenueID);
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, Sales_Revenue.getSales_RevenueID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, Sales_Revenue.getFactory_SalesID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, Sales_Revenue.getDate());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, Sales_Revenue.getTea_Grade());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, Sales_Revenue.getSold_Quantity());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SIX, Sales_Revenue.getSales_Type());
			
			//Add Sales Revenue
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


/**-------------   Delete Sales Revenue by SalesRevenueID For Sales_Revenue  --------------**/	
	@Override
	public void removeSalesRevenue(String SalesRevenueID) {
		
		//Checking the SalesRevenueID id is available
		if(SalesRevenueID != null && !SalesRevenueID.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_REMOVE_SalesRevenue));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, SalesRevenueID);
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
	
	
/**--------------------------   Update Sales Revenue  --------------------------------------**/		
	@Override
	public Sales_Revenue UpdateSalesRevenue(String SalesRevenueID, Sales_Revenue Sales_Revenue) {

		if(SalesRevenueID != null && !SalesRevenueID.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_UPDATE_SalesRevenue));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, Sales_Revenue.getFactory_SalesID());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, Sales_Revenue.getDate());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, Sales_Revenue.getTea_Grade());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, Sales_Revenue.getSold_Quantity());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, Sales_Revenue.getSales_Type());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SIX, Sales_Revenue.getSales_RevenueID());
			
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
		
		return getSalesRevenueByID(SalesRevenueID); 
	}

	
	
/**-------------   get Get All For Sales Revenue Table and get by id  --------------**/		
	
/**-------------   View All Sales Revenue  --------------**/
	@Override
	public ArrayList<Sales_Revenue> getAllSalesRevenue() {

		return actionOnSalesRevenue(null);
	}
		
/**-------------   View Sales Revenue by ID --------------**/	
	@Override
	public Sales_Revenue getSalesRevenueByID(String SalesRevenueID) {
		
		return actionOnSalesRevenue(SalesRevenueID).get(0);
	}
	

	public ArrayList<Sales_Revenue> actionOnSalesRevenue(String SalesRevenueID)
	{
		ArrayList<Sales_Revenue> SalesRevenueList = new ArrayList<Sales_Revenue>();
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			if(SalesRevenueID != null && !SalesRevenueID.isEmpty()) {
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_SalesRevenueBYid));
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, SalesRevenueID);
			}
			else {
				//Get All Sales Revenue Query will be Retrieve from SalesQuery.xml 
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_ALL_SalesRevenue));
			}
			
			ResultSet result = preparedStatement.executeQuery();
			
			while(result.next())
			{
				Sales_Revenue revenue = new Sales_Revenue();
				
				revenue.setSales_RevenueID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
				revenue.setFactory_SalesID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
				revenue.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
				revenue.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
				revenue.setSold_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
				revenue.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
				
				SalesRevenueList.add(revenue);
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
		
		return SalesRevenueList;
	}
	
	
/**-------------   ******************************************************  --------------**/

	
/**---------------------    Array of Sales Revenue id list will be return         ---------------**/	
	private ArrayList<String> getSalesRevenueIDs() 
	{
		ArrayList<String> arraylist = new ArrayList<String>();
		
		try {
					
					connection = DBConnection.getDBConnection();
					
					//Get All Sales Revenue IDs Query will be Retrieve from SalesQuery.xml
					preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_ALL_SalesRevenue_IDS));
					
					ResultSet result = preparedStatement.executeQuery();
					while(result.next())
					{
						arraylist.add(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
					}	
		} 
		catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException e)
		{	
					log.log(Level.SEVERE,e.getMessage());
		}finally{
				//Closing DB Connection and Prepared statement
				try{
					if(preparedStatement != null)
					{
						preparedStatement.close();
					}
					if(connection != null)
					{
						connection.close();
					}
				} 
				catch (SQLException e) {
					log.log(Level.SEVERE,e.getMessage());
				}
				
		}
		return arraylist;
	}

		
	
}
