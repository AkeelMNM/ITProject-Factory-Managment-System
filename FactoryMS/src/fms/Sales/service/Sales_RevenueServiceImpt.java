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
import com.fms.commonUtil.SalesCommonUtil;
import com.fms.model.FactorySales;
import com.fms.model.Sales_Return;
import com.fms.model.Sales_Revenue;
import com.fms.model.Tea_Grade_Price;

/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

public class Sales_RevenueServiceImpt implements Sales_RevenueService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(Sales_RevenueServiceImpt.class.getName());
	
	private static Connection connection;
	
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
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SEVEN, Sales_Revenue.getAmount());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_EIGHT,Sales_Revenue.getMonth());
			
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
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SIX, Sales_Revenue.getAmount());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SEVEN, Sales_Revenue.getMonth());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_EIGHT, Sales_Revenue.getSales_RevenueID());
			
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
				revenue.setAmount(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));
				revenue.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_EIGHT));
				
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
	

	
/** -------------  ***************************  Get Sales Revenue  by Sales Type and Month from Sales_Revenue table    ***************************   ------------------------**/
	@Override
	public ArrayList<Sales_Revenue> getSalesRevenueBySalesTypeAndMonth(String SalesType,String Month,String Year)
	{
		ArrayList<Sales_Revenue> RevenueList = new ArrayList<Sales_Revenue>();
		
		if(SalesType != null && !SalesType.isEmpty())
		{
			try
			{
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_SALES_REVENUE_BY_SALES_TYPE_MONTH));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, SalesType);
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, Month);
				
				ResultSet result = preparedStatement.executeQuery();
				
				while(result.next())
				{
					
					String date = result.getString("Date");
					String yr;
					
					if(date != null) 
					{
						String[] x = date.split("-");
						
						yr = x[0];
						
						if(yr.equals(Year)) 
						{
							Sales_Revenue Revenue = new Sales_Revenue();
							
							Revenue.setSales_RevenueID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
							Revenue.setFactory_SalesID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
							Revenue.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
							Revenue.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
							Revenue.setSold_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
							Revenue.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
							Revenue.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));
							Revenue.setYear(yr);
							
							RevenueList.add(Revenue);
							
						}
					}
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
		
		return RevenueList;
	}	

	
/** -------------  ***************************  Get Sales Revenue by Sales type and Year from SalesRevenue table  ***************************   ------------------------**/
	@Override
	public ArrayList<Sales_Revenue> getSsalesRevenueBySalesTypeAndYear(String SalesType,String Year)
	{
		ArrayList<Sales_Revenue> RevenueList = new ArrayList<Sales_Revenue>();
		ArrayList<String> MonthList = new ArrayList<String>();
		ArrayList<String> TeaGradeList = new ArrayList<String>();
		
		MonthList.add("January");MonthList.add("February");MonthList.add("March");MonthList.add("April");MonthList.add("May");MonthList.add("June");
		MonthList.add("July");MonthList.add("August");MonthList.add("September");MonthList.add("October");MonthList.add("November");MonthList.add("December");
		
		TeaGradeList.add("DUST");TeaGradeList.add("FANNINGS");TeaGradeList.add("BOP1A/B.M");TeaGradeList.add("FANNINGS");TeaGradeList.add("FINE");
		
		if(SalesType != null && !SalesType.isEmpty())
		{
			try
			{
				connection = DBConnection.getDBConnection();
				
				for(int i=0 ; i<MonthList.size(); i++)
				{
					for(int j=0 ; j<TeaGradeList.size(); j++)
					{
						double Total = 0;
						int Count = 0;
						String date = null;
						String yr;
						
						String Query = "SELECT * From Sales_Revenue Where Sales_Type = '"+SalesType+"' and Date like '"+Year+"%' and Month = '"+MonthList.get(i)+"' and Tea_Grade = '"+TeaGradeList.get(j)+"' " ;
						preparedStatement = connection.prepareStatement(Query);
						
						ResultSet result = preparedStatement.executeQuery();
						
						Sales_Revenue Rtn = new Sales_Revenue();
						
						while(result.next())
						{
							
							Total = Total + Double.parseDouble(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
							date = result.getString(SalesCommonConstants.COLUMN_INDEX_THREE);
							
							Rtn.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
							Rtn.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
							Rtn.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));

							Count = Count + 1;
						}
						
						if(date != null) 
						{
							String[] x = date.split("-");
							
							yr = x[0];
						
							Rtn.setYear(yr);
							Rtn.setSold_Quantity(String.valueOf(Total));
							Rtn.setFactory_SalesID(String.valueOf(Count)); // number of Return 
							
							if(Total != 0.0) 
							{
								RevenueList.add(Rtn);	
							}
						}
					}
				}
				
			} catch (ClassNotFoundException | SQLException ex ) {
				
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
		
		return RevenueList;
	}


	
	
/** -------------  ***************************  Get sold Details by Sales ArrayList, Return ArrayList and TeaGradePrice ArrayList  ***************************   ------------------------**/
	@Override
	public ArrayList<Sales_Revenue> getSoldDetails(ArrayList<FactorySales> SalesList, ArrayList<Sales_Return> ReturnList,ArrayList<Tea_Grade_Price> priceList )
	{
		ArrayList<Sales_Revenue> SoldList = new ArrayList<Sales_Revenue>();
		
		for(int i = 1 ; i<SalesList.size() ; i++) 
		{
			double key = 0 ; 
			double amount = 0 ;
			
			if(SalesList.get(i).getFactory_Sales_ID().equals(ReturnList.get(i).getFactory_SalesID())) 
			{
				Sales_Revenue Re = new Sales_Revenue();
				
				key = Double.parseDouble(SalesList.get(i).getSelling_Quantity()) - Double.parseDouble(ReturnList.get(i).getReturn_Quantity());
				
				Re.setFactory_SalesID(SalesList.get(i).getFactory_Sales_ID());
				Re.setTea_Grade(SalesList.get(i).getTea_Grade());
				Re.setSold_Quantity(String.valueOf(key));
				
				if(SalesList.get(i).getTea_Grade().equals(priceList.get(i).getTea_Grade())) 
				{
					amount = Double.parseDouble(priceList.get(i).getPrice()) * key ;
					Re.setAmount(String.valueOf(amount));
				}
				
				SoldList.add(Re);
			}
		}
		return SoldList;
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
