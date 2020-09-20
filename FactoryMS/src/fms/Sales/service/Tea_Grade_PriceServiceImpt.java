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

import com.fms.commonConstant.SalesCommonConstants;
import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.SalesQueryUtil;
import com.fms.commonUtil.SalesCommonUtil;
import com.fms.model.Tea_Grade_Price;


/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

public class Tea_Grade_PriceServiceImpt implements Tea_Grade_PriceService {

	//Initialize logger//
	public static final Logger log = Logger.getLogger(Tea_Grade_PriceServiceImpt.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private PreparedStatement preparedStatement;
	
	
/**-------------   Add Tea Grade and Price For Tea_Grade_Price Table  --------------**/
	@Override
	public void AddTeaGradePrice(Tea_Grade_Price TeaGradePrice) {
		
		String TGPid = SalesCommonUtil.generateTea_Grade_PriceIDs(getTeaGradePriceIDs());
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			// Insert TeaGradePrice Query will be Retrieve from SalesQuery.xml 
			preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_INSERT_TeaGradePrice));
			connection.setAutoCommit(false);
			
			//Generate TeaGradePrice IDs
			TeaGradePrice.setTea_Grade_Price_ID(TGPid);
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, TeaGradePrice.getTea_Grade_Price_ID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, TeaGradePrice.getTeaGrade_ID());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, TeaGradePrice.getTea_Grade());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, TeaGradePrice.getDate());
			preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, TeaGradePrice.getPrice());
			
			//Add Tea Grade Price
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
	
/**-------------   Delete Tea Grade and Price by TGPid For Tea_Grade_Price Table  --------------**/	
	@Override
	public void removeTeaGradePrice(String Tea_Grade_PriceID) {
		
		//Checking the Tea_Grade_Price id is available
		if(Tea_Grade_PriceID != null && !Tea_Grade_PriceID.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_REMOVE_TeaGradePrice));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, Tea_Grade_PriceID);
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

	
/**--------------------------   Update Tea Garde and Price  -----------------------------------**/		
	@Override
	public Tea_Grade_Price UpdateTeaGradePrice(String TeaGPid, Tea_Grade_Price TeaGradePrice)
	{
		if(TeaGPid != null && !TeaGPid.isEmpty())
		{
			try {
				
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_UPDATE_TeaGradePrice));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, TeaGradePrice.getTeaGrade_ID());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_TWO, TeaGradePrice.getTea_Grade());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_THREE, TeaGradePrice.getDate());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FOUR, TeaGradePrice.getPrice());
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_FIVE, TeaGradePrice.getTea_Grade_Price_ID());
			
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
		
		return getTeaGradePriceByID(TeaGPid); 
	}
	
	
	
/**-------------   get Get All For Tea_Grade_Price Table and get by id  --------------**/		
	
/**-------------   View All Tea Grade and Price  --------------**/
	@Override
	public ArrayList<Tea_Grade_Price> getTeaGradePrices()
	{
		return actionOnTeaGradePrices(null);
	}
	
/**-------------   View Tea Grade and Price by ID --------------**/	
	@Override
	public Tea_Grade_Price getTeaGradePriceByID(String TeaGPid) 
	{
		return actionOnTeaGradePrices(TeaGPid).get(0);
	}

/**-------------   ************** actionOnTeaGradePrices ***************  --------------**/	
	public ArrayList<Tea_Grade_Price> actionOnTeaGradePrices(String TeaID)
	{
		ArrayList<Tea_Grade_Price> TeaGradePriceList = new ArrayList<Tea_Grade_Price>();
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			if(TeaID != null && !TeaID.isEmpty()) {
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_TeaGradePriceBYid));
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, TeaID);
			}
			else {
				//Get All Tea_Grade_Price Query will be Retrieve from SalesQuery.xml 
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_ALL_TeaGradePrice));
			}
			
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
		
		return TeaGradePriceList;
	}
	

	
/**-------------   get Get All For Tea_Grade_Price Table and get by id  --------------**/		
	
	public String getTeaGrade(String TeaGradePriceID) 
	{
		String TeaGrade = null ;
		
		if(TeaGradePriceID != null && !TeaGradePriceID.isEmpty())
		{
			try {		
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_GET_TeaGrade));
				
				preparedStatement.setString(SalesCommonConstants.COLUMN_INDEX_ONE, TeaGradePriceID);
				
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
	
/**-------------   ******************************************************  --------------**/
	

	
/**---------------------    Array of Tea_Grade_Price id list will be return         ---------------**/
	
	private ArrayList<String> getTeaGradePriceIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
					
			try {
						
						connection = DBConnection.getDBConnection();
						
						//Get All TeaGradePrice IDs Query will be Retrieve from SalesQuery.xml
						preparedStatement = connection.prepareStatement(SalesQueryUtil.queryByID(SalesCommonConstants.Query_ID_ALL_TeaGradePrice_IDS));
						
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
