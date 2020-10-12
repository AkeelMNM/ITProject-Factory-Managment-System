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

import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.InventoryQueryUtil;
import com.fms.commonConstant.InventryComman;
import com.fms.commonUtil.InventryCommonUtil;
import com.fms.model.TeaStock;

public  class stockServiceImp implements stockService{
	
	public static final Logger log = Logger.getLogger(stockServiceImp.class.getName());

	private static Connection connection;

	private static Statement statement;

	
	private PreparedStatement preparedStatement;

	

	
	
	
	/*******************************ADD Stock *********************************************/
	
	
	@Override
	public void addTeaStocks(TeaStock teastock) {
		
		String StockID = InventryCommonUtil.generateStockIDs(getStockIDs());
		
		try {
			connection = DBConnection.getDBConnection();
			/*
			 * Query is available in EmployeeQuery.xml file and use
			 * insert_employee key to extract value of it
			 */
			preparedStatement = connection
					.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_INSERT_Stock));
			connection.setAutoCommit(false);
			
			//Generate employee IDs
			teastock.setStockID(StockID);
			preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, teastock.getStockID());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_TWO, teastock.getTeaGrade_ID());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_THREE, teastock.getStoring_Date());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_FOUR, teastock.getTea_Grades());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_FIVE, teastock.getTea_Grades_Qty());
			preparedStatement.setString(InventryComman.COLUMN_INDEX_SIX,teastock.getLocation());
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



/********************REMOVE STOCK***************************************************/
	@Override
	public void RemoveTeaStock(String StockID) 
	{
		if (StockID != null && !StockID.isEmpty()) {
			/*
			 * Remove employee query will be retrieved from EmployeeQuery.xml
			 */
			try {
				connection = DBConnection.getDBConnection();
				preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_REMOVE_Stock));
				preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, StockID);
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
	
	/************************************UPDTAE STOCK***********************************************/

	@Override
	public void  UpdateTeaStock(String StockID ,TeaStock teastock) {

			// TODO Auto-generated method stub
			/*
			 * Before fetching employee it checks whether employee ID is available
			 */
			if (StockID != null && !StockID.isEmpty()) {
				/*
				 * Update employee query will be retrieved from EmployeeQuery.xml
				 */
				try {
					connection = DBConnection.getDBConnection();
					preparedStatement = connection
							.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_UPDATE_STOCKS));
					
					
					preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, teastock.getStoring_Date());
					preparedStatement.setString(InventryComman.COLUMN_INDEX_TWO, teastock.getTea_Grades());
					preparedStatement.setString(InventryComman.COLUMN_INDEX_THREE, teastock.getTea_Grades_Qty());
					preparedStatement.setString(InventryComman.COLUMN_INDEX_FOUR, teastock.getLocation());
					preparedStatement.setString(InventryComman.COLUMN_INDEX_FIVE, StockID);
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
			// Get the updated employee
			
		}
	

	


/* ++++++++++++++++++++++++++++ Array of Tea Stock ID list +++++++++++++++++++++++++++++++++++++++++++++++++*/
	
	private ArrayList<String> getStockIDs() 
	{
		ArrayList<String> arraylist = new ArrayList<String>();
		
		try {
			
			connection = DBConnection.getDBConnection();
			
			//Get all tea Stock ids
			preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_ALL_TeaStock_IDs));
			
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
/*++++++++++++++++++++Get Tea Stock By Id+++++++++++++++++++++++++++++++++++*/	
	@Override
	public TeaStock getTeaStockById(String StockID) {
		// TODO Auto-generated method stub
		return actionOnStock(StockID).get(0);
	}
	@Override
	public void addStock(TeaStock teastock) {
		// TODO Auto-generated method stub
		
	}
	
/*+++++++++++++++++++++++++++++++++GET All Tea Stock ++++++++++++++++++++++++++++++++*/
	@Override
	public ArrayList<TeaStock> getAllTeaStock() {
		// TODO Auto-generated method stub
		ArrayList<TeaStock> stockList = new ArrayList<TeaStock>();
		try {
			connection = DBConnection.getDBConnection();
			
			preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_ALL_Stock));
		

			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				
				 TeaStock ts = new TeaStock();
				
				ts.setStockID(result.getString(InventryComman.COLUMN_INDEX_ONE));
				ts.setTeaGrade_ID(result.getString(InventryComman.COLUMN_INDEX_TWO));
				ts.setStoring_Date(result.getString(InventryComman.COLUMN_INDEX_THREE));
				ts.setTea_Grades(result.getString(InventryComman.COLUMN_INDEX_FOUR));
				ts.setTea_Grades_Qty(result.getString(InventryComman.COLUMN_INDEX_FIVE));
				ts.setLocation(result.getString(InventryComman.COLUMN_INDEX_SIX));
				
				stockList.add(ts);
				
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
		return stockList;
	}


	private ArrayList<TeaStock> actionOnStock(String StockId) {

		ArrayList<TeaStock> stocklist = new ArrayList<TeaStock>();
		try {
			connection = DBConnection.getDBConnection();
			/*
			 * Before fetching employee it checks whether employee ID is
			 * available
			 */
			if (StockId!= null && !StockId.isEmpty()) {
				
				preparedStatement = connection
						.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_GET_StockByID));
				preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, StockId);
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				TeaStock tea = new TeaStock();
				tea.setStockID(resultSet.getString(InventryComman.COLUMN_INDEX_ONE));
				tea.setTeaGrade_ID(resultSet.getString(InventryComman.COLUMN_INDEX_TWO));
				tea.setStoring_Date(resultSet.getString(InventryComman.COLUMN_INDEX_THREE));
				tea.setTea_Grades(resultSet.getString(InventryComman.COLUMN_INDEX_FOUR));
				tea.setTea_Grades_Qty(resultSet.getString(InventryComman.COLUMN_INDEX_FIVE));
				tea.setLocation(resultSet.getString(InventryComman.COLUMN_INDEX_SIX));
				
				stocklist.add(tea);
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
		return stocklist;
	}

/*+++++++++++++GET TEa Grade Id ++++++++++++++++++++++++++*/
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
					
					TeaGradeId = result.getNString(1);
				}
				
			} 
			catch(IOException |ClassNotFoundException |SQLException|ParserConfigurationException|SAXException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			}
			finally {
				/*
				 * Close prepared statement and database connectivity at the end of
				 * transaction
				 */
				try {
					if(preparedStatement != null) {
						preparedStatement.close();
					}
					if(connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					// TODO: handle exception
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
			
			
		}
	
		 return TeaGradeId;
		
	
	}
	
	@Override
	public String getLocation(String LocationName) {
		// TODO Auto-generated method stub
String TeaGradeId = null;
		
		if(LocationName != null && !LocationName.isEmpty()) {
			try {
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_GET_LOCATIONS));
				
				preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, LocationName);
				
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



	@Override
	public ArrayList<TeaStock> getStockDetailsMonth(String month) {
		ArrayList<TeaStock> tList = new ArrayList<TeaStock>();
		
		try {
			connection = DBConnection.getDBConnection();
			
			preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_ALL_STOCK_BY_MONTH));
			preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, month);

			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				
				 TeaStock ts = new TeaStock();
				
				 ts.setStockID(result.getString(InventryComman.COLUMN_INDEX_ONE));
				 ts.setTeaGrade_ID(result.getString(InventryComman.COLUMN_INDEX_TWO));
				 ts.setStoring_Date(result.getString(InventryComman.COLUMN_INDEX_THREE));
				 ts.setMonth(result.getString(InventryComman.COLUMN_INDEX_FOUR));
				 ts.setTea_Grades(result.getString(InventryComman.COLUMN_INDEX_FIVE));
				 ts.setTea_Grades_Qty(result.getString(InventryComman.COLUMN_INDEX_SIX));
				 ts.setLocation(result.getString(InventryComman.COLUMN_INDEX_SEVEN));
				
				 tList.add(ts);
				
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
		return tList;
	}



	@Override
	public ArrayList<TeaStock> getStockDetailsDate(String date) {
		
		ArrayList<TeaStock> tList = new ArrayList<TeaStock>();
		
		try {
			connection = DBConnection.getDBConnection();
			
			preparedStatement = connection.prepareStatement(InventoryQueryUtil.queryByID(InventryComman.QUERY_ID_ALL_STOCK_BY_DATE));
			preparedStatement.setString(InventryComman.COLUMN_INDEX_ONE, date);

			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				
				 TeaStock ts = new TeaStock();
				
				ts.setStockID(result.getString(InventryComman.COLUMN_INDEX_ONE));
				ts.setTeaGrade_ID(result.getString(InventryComman.COLUMN_INDEX_TWO));
				ts.setStoring_Date(result.getString(InventryComman.COLUMN_INDEX_THREE));
				ts.setMonth(result.getString(InventryComman.COLUMN_INDEX_FOUR));
				ts.setTea_Grades(result.getString(InventryComman.COLUMN_INDEX_FIVE));
				ts.setTea_Grades_Qty(result.getString(InventryComman.COLUMN_INDEX_SIX));
				ts.setLocation(result.getString(InventryComman.COLUMN_INDEX_SEVEN));
				
				tList.add(ts);
				
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
		return tList;
	}

}



