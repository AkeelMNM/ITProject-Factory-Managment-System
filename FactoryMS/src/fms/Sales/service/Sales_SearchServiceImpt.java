/**
 * 
 */
package fms.Sales.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.fms.DBconnection.DBConnection;
import com.fms.commonConstant.SalesCommonConstants;
import com.fms.model.FactorySales;
import com.fms.model.Sales_Return;
import com.fms.model.Sales_Revenue;
import com.fms.model.Tea_Grade_Price;

/**
 * @author Zumry A.M
 * NO:IT19175126
 *
 */

public class Sales_SearchServiceImpt implements Sales_SearchService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(Sales_SearchServiceImpt.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private PreparedStatement preparedStatement;

	
/**-----------------   Factory Sales Search Method  -----------------------------**/	
	@Override
	public ArrayList<FactorySales> SearchFactorySales(String Value) 
	{
		ArrayList<FactorySales> FactorySalesList = new ArrayList<FactorySales>();
		
		if(Value != null && !Value.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				String Query =" SELECT * From Factory_Sales Where Factory_Sales_ID like '%"+Value+"%' or Tea_Grade_PriceID like '%"+Value+"%' or Date like '%"+Value+"%' or Tea_Grade like '%"+Value+"%' or Selling_Quantity like '%"+Value+"%' or Sales_Type like '%"+Value+"%' ";
				preparedStatement = connection.prepareStatement(Query);
				
				ResultSet result = preparedStatement.executeQuery();

				while(result.next())
				{
					FactorySales Sales = new FactorySales();
					
					Sales.setFactory_Sales_ID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
					Sales.setTea_Grade_PriceID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
					Sales.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
					Sales.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
					Sales.setSelling_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
					Sales.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
					
					FactorySalesList.add(Sales);
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
		return FactorySalesList;
	}


/**-----------------  Sales Revenue Search Method  -----------------------------**/	
	@Override
	public ArrayList<Sales_Revenue> SearchSalesRevenue(String Value) 
	{
		ArrayList<Sales_Revenue> SalesRevenueList = new ArrayList<Sales_Revenue>();
		
		if(Value != null && !Value.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				String Query = "SELECT * From Sales_Revenue where Sales_RevenueID like '%"+Value+"%' or Factory_SalesID like '%"+Value+"%' or Date like '%"+Value+"%' or Tea_Grade like '%"+Value+"%' or Sold_Quantity like '%"+Value+"%' or Sales_Type like '%"+Value+"%' ";

				preparedStatement = connection.prepareStatement(Query);				
				ResultSet result = preparedStatement.executeQuery();

				while(result.next())
				{
					Sales_Revenue Revenue = new Sales_Revenue();
					
					Revenue.setSales_RevenueID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
					Revenue.setFactory_SalesID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
					Revenue.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
					Revenue.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
					Revenue.setSold_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
					Revenue.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
					
					SalesRevenueList.add(Revenue);
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
		return SalesRevenueList;
	}

	
/**-----------------   Tea grade Price Search Method   -----------------------------**/	
	@Override
	public ArrayList<Tea_Grade_Price> SearchTeaGradePrice(String Value) 
	{
		ArrayList<Tea_Grade_Price> TeaGradePriceList = new ArrayList<Tea_Grade_Price>();
		
		if(Value != null && !Value.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				String Query = "SELECT * From Tea_Grade_Price where Tea_Grade_Price_ID like '%"+Value+"%' or TeaGrade_ID like '%"+Value+"%' or Tea_Grade like '%"+Value+"%' or Date like '%"+Value+"%' or Price like '%"+Value+"%' ";
				
				preparedStatement = connection.prepareStatement(Query);
				ResultSet result = preparedStatement.executeQuery();

				while(result.next())
				{
					Tea_Grade_Price TGP = new Tea_Grade_Price();
					
					TGP.setTea_Grade_Price_ID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
					TGP.setTeaGrade_ID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
					TGP.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
					TGP.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
					TGP.setPrice(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
					
					TeaGradePriceList.add(TGP);
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
		return TeaGradePriceList;
	}

	
/**-----------------   Sales Return  Search Method  -----------------------------**/	
	@Override
	public ArrayList<Sales_Return> SearchSalesReturn(String Value) 
	{	
		ArrayList<Sales_Return> SalesReturnList = new ArrayList<Sales_Return>();
		
		if(Value != null && !Value.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				String Query = "SELECT * From Sales_Return where Sales_ReturnID like '%"+Value+"%' or Factory_SalesID like '%"+Value+"%' or Date like '%"+Value+"%' or Tea_Grade like '%"+Value+"%' or Return_Quantity like '%"+Value+"%' or Sales_Type like '%"+Value+"%' ";
				
				preparedStatement = connection.prepareStatement(Query);		
				ResultSet result = preparedStatement.executeQuery();

				while(result.next())
				{
					Sales_Return Return = new Sales_Return();
					
					Return.setSales_ReturnID(result.getString(SalesCommonConstants.COLUMN_INDEX_ONE));
					Return.setFactory_SalesID(result.getString(SalesCommonConstants.COLUMN_INDEX_TWO));
					Return.setDate(result.getString(SalesCommonConstants.COLUMN_INDEX_THREE));
					Return.setTea_Grade(result.getString(SalesCommonConstants.COLUMN_INDEX_FOUR));
					Return.setReturn_Quantity(result.getString(SalesCommonConstants.COLUMN_INDEX_FIVE));
					Return.setSales_Type(result.getString(SalesCommonConstants.COLUMN_INDEX_SIX));
					
					SalesReturnList.add(Return);
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
		return SalesReturnList;
	}

}
