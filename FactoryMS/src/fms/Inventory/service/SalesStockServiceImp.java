package fms.Inventory.service;

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
import com.fms.QueryUtil.InventoryQueryUtil;
import com.fms.QueryUtil.SalesQueryUtil;
import com.fms.commonConstant.InventryComman;
import com.fms.commonUtil.InventryCommonUtil;
import com.fms.model.SalesTeaStock;
import com.fms.model.TeaStock;

public class SalesStockServiceImp implements SalesStockService{

	public static final Logger log = Logger.getLogger(SalesStockServiceImp.class.getName());

	private static Connection connection;

	private static Statement statement;

	
	private PreparedStatement preparedStatement;

	/*******************************ADD SALES TASKS *********************************************/
	@Override
	public void addSalesTeaStocks(SalesTeaStock salesteastock) {
		
		String relesedTeaStock  = InventryCommonUtil.generateSalesStockIDs(getSalesStockIDs());
		
		try {
			connection = DBConnection.getDBConnection();
			/*
			 * Query is available in EmployeeQuery.xml file and use
			 * insert_employee key to extract value of it
			 */
			preparedStatement = connection
					.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_INSERT_SALES_STOCK));
			connection.setAutoCommit(false);
			
			//Generate employee IDs
			salesteastock.setReleseStock_ID(relesedTeaStock);
			preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, salesteastock.getReleseStock_ID());
			//preparedStatement.setString(InventryComman.COLUMN_INDEX_TWO, salesteastock.getStockId());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_THREE, salesteastock.getRelesedDate());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_FOUR, salesteastock.getTea_Grades_Quantity());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_FIVE, salesteastock.getTea_Grades());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_SIX, salesteastock.getLocation());
			// Add employee
			preparedStatement.execute();
			connection.commit();

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
	}
	
	/********************REMOVE SAles  STOCK***************************************************/
	@Override
	public void RemoveSalesTeaStock(String releseStock_ID) 
	{
		if (releseStock_ID != null && !releseStock_ID.isEmpty()) {
			/*
			 * Remove inventry query will be retrieved from Inventryquery.xml
			 */
			try {
				connection = DBConnection.getDBConnection();
				preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_REMOVE_SALES_STOCK));
				preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, releseStock_ID);
				preparedStatement.executeUpdate();
			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end
				 * of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
		
	}
	/************************************UPDTAE SALES STOCK***********************************************/

	@Override
	public void UpdateSalesTeaStock(String releseStock_ID,SalesTeaStock SteaStock) {

			// TODO Auto-generated method stub
			/*
			 * Before fetching employee it checks whether employee ID is available
			 */
			if (releseStock_ID != null && !releseStock_ID.isEmpty()) {
				/*
				 * Update employee query will be retrieved from EmployeeQuery.xml
				 */
				try {
					connection = DBConnection.getDBConnection();
					preparedStatement = connection
							.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_GET_SALES_STOCK_BY_ID));
					
					preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE,SteaStock.getSalesStockId() );
					preparedStatement.setString(InventryComman.COLUMN_INDEX_TWO, SteaStock.getRelesedDate());
					preparedStatement.setString(InventryComman.COLUMN_INDEX_THREE, SteaStock.getTea_Grades());
					preparedStatement.setString(InventryComman.COLUMN_INDEX_FOUR, SteaStock.getTea_Grades_Quantity());
				
					preparedStatement.executeUpdate();

				} catch (SQLException | SAXException | IOException | ParserConfigurationException
						| ClassNotFoundException e) {
					log.log(Level.SEVERE, e.getMessage());
				} finally {
					/*
					 * Close prepared statement and database connectivity at the end
					 * of transaction
					 */
					try {
						if (preparedStatement != null) {
							preparedStatement.close();
						}
						if (connection != null) {
							connection.close();
						}
					} catch (SQLException e) {
						log.log(Level.SEVERE, e.getMessage());
					}
				}
			}
			
		}
	

	
	
	
	
	
	
	
	/*++++++++++++++++++++++++++++++Array of Sales Stock Id list+++++++++++++++++++++++++++++++ */

	private ArrayList<String> getSalesStockIDs() {
		// TODO Auto-generated method stub
ArrayList<String> arraylist = new ArrayList<String>();
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			//Get all tea Stock ids
			preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_ALL_SALES_TEA_STOCK_IDs));
			
			ResultSet result = preparedStatement.executeQuery();
			while (result.next()) 
			{
				arraylist.add(result.getString(InventryComman.COLUMN_INDEX_ONE));
			}
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return arraylist;
	}

	

	@Override
	public ArrayList<SalesTeaStock> getAllSalesTeaStock() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void getSalesTeaStockById(String releseStock_ID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addSalesStock(SalesTeaStock salesteastock) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getTeaGradeId(String TeaGradeName) {
		// TODO Auto-generated method stub
String TeaGradeId = null;
		
		if(TeaGradeName != null && !TeaGradeName.isEmpty()) {
			try {
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.Query_ID_GET_TEA_GRADE_Id));
				
				preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, TeaGradeName);
				
				ResultSet result = preparedStatement.executeQuery();
				if(result.next()) {
					
					TeaGradeId = result.getString(1);
				}
			} catch (IOException | ClassNotFoundException |SQLException| ParserConfigurationException |SAXException ex) {
				
				log.log(Level.SEVERE, ex.getMessage());
			}
			finally {
				try {
					if(preparedStatement!= null) {
						
						preparedStatement.close();
					}
					if(connection != null) {
						
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
		}
			
			
		 return TeaGradeId;
	}
	
	
	
	/*public String getTeaGradeId(String TeaGradeName) {
		
		String TeaGradeId = null;
		
		if(TeaGradeName != null && !TeaGradeName.isEmpty()) {
			
			try {
				
				connection = DBConnection.getDBConnection();
				
				 preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.Query_ID_GET_TEA_GRADE_Id));


                 preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, TeaGradeName);


                 ResultSet result = preparedStatement.executeQuery();

                 if(result.next())

                 {​​​​

                     TeaGradeId = result.getString(1);

                 }​​​​
			}
			catch (IOException | ClassNotFoundException | SQLException | ParserConfigurationException | SAXException ex ) {​​​​


                log.log(Level.SEVERE,ex.getMessage());
		}
			finally {
				
				//Closing DB Connection and Prepared statement
				try {
					if((preparedStatement!=null )){
						
						preparedStatement.close();

					}
					  if((connection != null)) {​​​​

	                         connection.close();
					  }
	               
				}
				catch(SQLException ex) {
					
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
		}
		 return TeaGradeId;
	}*/

}
