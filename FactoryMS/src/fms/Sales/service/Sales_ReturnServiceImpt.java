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
	
	private PreparedStatement preparedStatement;
	

/**-------------   Add Sales return For Sales return Table --------------**/
	@Override
	public void AddSalesReturn(Sales_Return Sales_Return) {
		
		String SalesReturnID = SalesCommonUtil.generateSalesReturnIDs(getSalesReturnIDs());
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			// Insert Sales_Return Query will be Retrieve from SalesQuery.xml 
			preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_INSERT_SalesReturn));
			connection.setAutoCommit(false);
			
			//Generate Sales_Return IDs
			Sales_Return.setSales_ReturnID(SalesReturnID);
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
	

	
/** -------------  ***************************  Get Sales return  by TeaGrade and Month from SalesReturn table    ***************************   ------------------------**/
	@Override
	public ArrayList<Sales_Return> getSalesReturnBySalesTypeAndMonth(String SalesType,String Month,String Year)
	{
		ArrayList<Sales_Return> RtnList = new ArrayList<Sales_Return>();
		
		if(SalesType != null && !SalesType.isEmpty())
		{
			try
			{
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_SALES_RETURN_BY_SALES_TYPE_MONTH));
				
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
							Sales_Return Rtn = new Sales_Return();
							
							Rtn.setSales_ReturnID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
							Rtn.setFactory_SalesID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
							Rtn.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
							Rtn.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
							Rtn.setReturn_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
							Rtn.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
							Rtn.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));
							Rtn.setYear(yr);
							
							RtnList.add(Rtn);
							
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
		
		return RtnList;
	}	

	
/** -------------  ***************************  Get Sales Return by TeaGrade and Year from SalesReturn table  ***************************   ------------------------**/
	@Override
	public ArrayList<Sales_Return> getSsalesReturnBySalesTypeAndYear(String SalesType,String Year)
	{
		ArrayList<Sales_Return> ReturnList = new ArrayList<Sales_Return>();
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
						
						String Query = "SELECT * From Sales_Return Where Sales_Type = '"+SalesType+"' and Date like '"+Year+"%' and Month = '"+MonthList.get(i)+"' and Tea_Grade = '"+TeaGradeList.get(j)+"' " ;
						preparedStatement = connection.prepareStatement(Query);
						
						ResultSet result = preparedStatement.executeQuery();
						
						Sales_Return Rtn = new Sales_Return();
						
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
							Rtn.setReturn_Quantity(String.valueOf(Total));
							Rtn.setFactory_SalesID(String.valueOf(Count)); // number of Return 
							
							if(Total != 0.0) 
							{
								ReturnList.add(Rtn);	
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
		
		return ReturnList;
	}

	
	
/**-------------   ******************************************************  --------------**/
	
	
/**---------------------    Array of Sales return id list will be return    ---------------**/
	
	private ArrayList<String> getSalesReturnIDs()
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
