package fms.Purchase.service;

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
import com.fms.QueryUtil.PurchaseQueryUtil;
import com.fms.commonConstant.PurchaseCommonConstants;
import com.fms.model.Purchase;



import com.fms.commonUtil.PurchaseCommonUtil;



public class PurchaseServiceImpt implements PurchaseService {
	
	
	 public static final Logger log=Logger.getLogger(PurchaseServiceImpt.class.getName());
		

		private static Connection connection;

		private static java.sql.Statement statement;	

		private PreparedStatement preparedStatement;

		
		
		
		
		
		//Add Leaf Order Entry
	@Override
	public void addleaforder(Purchase purchase) {
		// TODO Auto-generated method stub

String TLID =PurchaseCommonConstants.generateTLIDs(getPurchaseId());
		
		try {
				connection = DBConnection.getDBConnection();
				/*
				 * Query is available in LeaveMSDBQuery.xml file and use
				 * insert_Leave key to extract value of it
				 */
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_INSERT_Leaforder));
				connection.setAutoCommit(false);
				
				//Generate Purchase IDs
				//purchase.setPurchaseId(LeaveID);
				purchase.setTealeafId(TLID);
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE ,purchase.getTealeafId());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, purchase.getPaymentId());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, purchase.getSupplierId());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, purchase.getSupplier());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE, purchase.getQuantity());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SIX, purchase.getUnitPrice());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN, purchase.getPaid());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT, purchase.getDate());
				
				

				// Add Leaf order entry
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


	private Object getPurchaseId() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateleaforder(String TLID, Purchase purchase) {
		// TODO Auto-generated method stub
		
		

		/*
		 * Before fetching leaf it checks whether leave ID is available
		 */
	//add if you need	if (tealeafId!= null && !tealeafId.isEmpty()) {
			/*
			 * Update Leaf query will be retrieved from EmployeeMSDBQuery.xml
			 */
			try {
				connection = DBConnection.getDBConnection();
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_UPDATE_LEAF));
				
				
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE ,purchase.getTealeafId());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, purchase.getPaymentId());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, purchase.getSupplierId());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, purchase.getSupplier());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE, purchase.getQuantity());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SIX, purchase.getUnitPrice());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN, purchase.getPaid());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT, purchase.getDate());
				
				
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

		
	//add if you need	}

	@Override
	public void removeleaforder(String tealeafId) {
		// TODO Auto-generated method stub
		
		
		
		// Before deleting check whether leaf ID is available
		if (tealeafId != null && !tealeafId.isEmpty()) {
			/*
			 * Remove leave query will be retrieved from EmployeeMSDBQuery.xml
			 */
			try {
				
				connection = DBConnection.getDBConnection();
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_REMOVE_Leaforder));
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, tealeafId);
				
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



	
	/*private ArrayList<String>getsupplierIDs() throws SAXException, IOException, ParserConfigurationException{
		
		ArrayList<String> arrayList = new ArrayList<String>();
		
		try {
			connection = DBConnection.getDBConnection();
			preparedStatement = connection.prepareStatement(PurchaseCommonUtil.queryByID(PurchaseCommonConstants.QUERY_ID_GET_SUPP_IDS));
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
			}
		} catch (SQLException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			
			 
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
		return arrayList;
}*/

	
	
	
private ArrayList<String> getSupplierIDs()
	{
			ArrayList<String> arraylist = new ArrayList<String>();
				
			try {
					
					connection = DBConnection.getDBConnection();
					
					//Get All Attendance ID Query will be Retrieve from EmployeeMSDBQuery.xml
					preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_GET_SUPP_IDS));
					
					ResultSet result = preparedStatement.executeQuery();
					while(result.next())
					{
						arraylist.add(result.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
					}	
			} 
			catch (ClassNotFoundException |SAXException|IOException| ParserConfigurationException|SQLException e)
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
