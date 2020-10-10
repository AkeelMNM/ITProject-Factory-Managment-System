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

/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

public class FactorySalesServiceImpt implements FactorySalesService{

	//Initialize logger//
	public static final Logger log = Logger.getLogger(Tea_Grade_PriceServiceImpt.class.getName());
	
	private static Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
/**-------------   Add Factory Sales For FactorySales Table --------------**/
	@Override
	public void AddFactorySales(FactorySales FactorySales) {

		String FactorySalesID = SalesCommonUtil.generateFactorySalesIDs(getFactorySalesIDs());
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			// Insert TeaGradePrice Query will be Retrieve from SalesQuery.xml 
			preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_INSERT_FactorySales));
			connection.setAutoCommit(false);
			
			//Generate FactorySales IDs
			FactorySales.setFactory_Sales_ID(FactorySalesID);
			
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, FactorySales.getFactory_Sales_ID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, FactorySales.getTea_Grade_PriceID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, FactorySales.getDate());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, FactorySales.getTea_Grade());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, FactorySales.getSelling_Quantity());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SIX, FactorySales.getSales_Type());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SEVEN, FactorySales.getMonth());
			
			//Add FactorySales
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
	
/**-------------   Delete FactorySales by FactorySalesID For FactorySales Table  --------------**/	
	@Override
	public void removeFactorySales(String FactorySalesID) {
		
		//Checking the FactorySales ID is available
		if(FactorySalesID != null && !FactorySalesID.isEmpty())
		{
			try {
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_REMOVE_FactorySales));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, FactorySalesID);
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
	
/**--------------------------   Update Factory Sales  -----------------------------------**/		
	@Override
	public FactorySales UpdateFactorySales(String FactorySalesID,FactorySales FactorySales)
	{
		if(FactorySalesID != null && !FactorySalesID.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_UPDATE_FactorySales));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, FactorySales.getTea_Grade_PriceID());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, FactorySales.getDate());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, FactorySales.getTea_Grade());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, FactorySales.getSelling_Quantity());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, FactorySales.getSales_Type());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SIX, FactorySales.getMonth());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_SEVEN, FactorySales.getFactory_Sales_ID());
				
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
		
		return getFactorySalesByID(FactorySalesID);
	}
	
/**-------------   get Get All For Factory Sales Table and get by id  --------------**/		
	
/**-------------   View All Factory Sales  --------------**/
	@Override
	public ArrayList<FactorySales> getAllFactorySales() {

		return actionOnFactorySales(null);
	}

/**-------------   View Factory Sales by ID --------------**/	
	@Override
	public FactorySales getFactorySalesByID(String FactorySalesID) {
		
		return actionOnFactorySales(FactorySalesID).get(0);
	}
	
/**-------------   ************** actionOnTeaGradePrices ***************  --------------**/		
	public ArrayList<FactorySales> actionOnFactorySales(String FactorySalesID)
	{
		ArrayList<FactorySales> FactorySalesList = new ArrayList<FactorySales>();
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			if(FactorySalesID != null && !FactorySalesID.isEmpty()) {
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_FactorySalesBYid));
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, FactorySalesID);
			}
			else {
				//Get All Tea_Grade_Price Query will be Retrieve from SalesQuery.xml 
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_ALL_FactorySales));
			}
			
			ResultSet result = preparedStatement.executeQuery();
			
			while(result.next())
			{
				FactorySales Fsales = new FactorySales();
				
				Fsales.setFactory_Sales_ID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
				Fsales.setTea_Grade_PriceID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
				Fsales.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
				Fsales.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
				Fsales.setSelling_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
				Fsales.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
				Fsales.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));
				
				FactorySalesList.add(Fsales);
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
	
	
/**-------------   get Tea Grade only Factory sales Table by FactorySales ID  --------------**/		
	@Override
	public String getTeaGrade(String FactorySalesID) 
	{
		String TeaGrade = null ;
		
		if(FactorySalesID != null && !FactorySalesID.isEmpty())
		{
			try {		
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_TeaGrade_IN_FACTORY_SALES));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, FactorySalesID);
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					TeaGrade = result.getString(1);
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
		return TeaGrade;
	}
	
/** -------------  ***************************  Get FactorySales by TeaGrade and Month from FactorySales table   ***************************   ------------------------**/
	@Override
	public ArrayList<FactorySales> getFactorySalesBySalesTypeAndMonth(String SalesType,String Month,String Year)
	{
		ArrayList<FactorySales> SalesList = new ArrayList<FactorySales>();
		
		if(SalesType != null && !SalesType.isEmpty())
		{
			try
			{
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_FACTORY_SALES_BY_SALES_TYPE_MONTH));
				
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
							FactorySales Fsales = new FactorySales();
							
							Fsales.setFactory_Sales_ID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
							Fsales.setTea_Grade_PriceID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
							Fsales.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
							Fsales.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
							Fsales.setSelling_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
							Fsales.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
							Fsales.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));
							Fsales.setYear(yr);
							
							SalesList.add(Fsales);
							
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
		
		return SalesList;
	}	
	
/** -------------  ***************************  Get FactorySales by TeaGrade and Year from FactorySales table  ***************************   ------------------------**/
	@Override
	public ArrayList<FactorySales> getFactorySalesBySalesTypeAndYear(String SalesType,String year)
	{
		ArrayList<FactorySales> SalesList = new ArrayList<FactorySales>();
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
						
						String Query = "SELECT * From Factory_Sales Where Sales_Type = '"+SalesType+"' and Date like '"+year+"%' and Month = '"+MonthList.get(i)+"' and Tea_Grade = '"+TeaGradeList.get(j)+"' " ;
						preparedStatement = connection.prepareStatement(Query);
						
						ResultSet result = preparedStatement.executeQuery();
						
						FactorySales sales = new FactorySales();
						
						while(result.next())
						{
							
							Total = Total + Double.parseDouble(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
							date = result.getString(SalesCommonConstants.COLUMN_INDEX_THREE);
							
							sales.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
							sales.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
							sales.setMonth(result.getString(SalesCommonConstants.COLUMN_INDEX_SEVEN));

							Count = Count + 1;
						}
						
						if(date != null) 
						{
							String[] x = date.split("-");
							
							yr = x[0];
						
							sales.setYear(yr);
							sales.setSelling_Quantity(String.valueOf(Total));
							sales.setTea_Grade_PriceID(String.valueOf(Count)); // number of Sales 
							
							if(Total != 0.0) 
							{
								SalesList.add(sales);	
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
		
		return SalesList;
	}


	
/**-------------   ******************************************************  --------------**/
	

/**---------------------    Array of Factory Sales id list will be return    ---------------**/
	
	private ArrayList<String> getFactorySalesIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
					
			try {
						
						connection = DBConnection.getDBConnection();
						
						//Get All AttendanceStatus IDs Query will be Retrieve from EmployeeMSDBQuery.xml
						preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_ALL_FactorySales_IDS));
						
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
