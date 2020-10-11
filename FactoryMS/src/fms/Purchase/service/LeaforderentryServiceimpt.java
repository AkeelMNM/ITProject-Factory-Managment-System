package fms.Purchase.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.function.Supplier;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.PurchaseQueryUtil;
import com.fms.commonConstant.PurchaseCommonConstants;
import com.fms.commonUtil.PurchaseCommonUtil;
import com.fms.model.TeaLeaf_Supplier;
import com.fms.model.TeaLeaves;

public class LeaforderentryServiceimpt implements LeaforderentryService {

	//Initialize logger//
		public static final Logger log=Logger.getLogger(LeaforderentryServiceimpt.class.getName());
		
		private static Connection connection;
		
		private static Statement statement;
		
		private PreparedStatement preparedStatement;
	
	
		/********************************************************** Add Tea Leaf Orders *****************************************/
	
	@Override
	public void addTeaLeaves(TeaLeaves TeaLeaves) {
		// TODO Auto-generated method stub
		
		String TLID =PurchaseCommonUtil.generateTealeafIDS(getTeaLeafIDs());

		
		try {
				connection = DBConnection.getDBConnection();
				/*
				 * Query is available in factoryMSQuery.xml file and use
				 * insert_supplier key to extract value of it
				 */
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_INSERT_Leaforder));
				connection.setAutoCommit(false);
				
				//Generate Supplier IDs
				TeaLeaves.setTLID(TLID);
				
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE ,TeaLeaves.getTLID());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, TeaLeaves.getSupID());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, TeaLeaves.getSupplier_Name());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, TeaLeaves.getQuantity());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE, TeaLeaves.getUnit_Price());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SIX, TeaLeaves.getPaid());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN, TeaLeaves.getPDate());
				
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
	
	/********************************************************** View Leaf Orders *****************************************/
	@Override
	public ArrayList<TeaLeaves> getTealeaves() {
		// TODO Auto-generated method stub
		return actionOnLeaves(null);
	}


	//View Leaves by ID
	@Override
	public TeaLeaves getTeaLeafByID(String TeaLeavesID) {
		
		return actionOnLeaves(TeaLeavesID).get(0);
	}


	//view tea leaves/tea leaves function
		private ArrayList<TeaLeaves> actionOnLeaves(String TeaLeavesID) {

			ArrayList<TeaLeaves> tealeafList = new ArrayList<TeaLeaves>();
			
			try {
				connection = DBConnection.getDBConnection();
				
				if(TeaLeavesID != null && !TeaLeavesID.isEmpty()) {
					preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_id_GET_Tealeaf_BY_ID));
					preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, TeaLeavesID);
				}
				else {
					preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_ID_ALL_TeaLeaforder));
				}
				
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					TeaLeaves tealeave = new TeaLeaves();
					
					tealeave.setTLID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
					tealeave.setSupID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
					tealeave.setSupplier_Name(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
					tealeave.setQuantity(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
					tealeave.setUnit_Price(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
					tealeave.setPaid(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
					tealeave.setPDate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
					
					
				
					tealeafList.add(tealeave);
					
				}
				
			}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			}finally {
				
				try {
					if(preparedStatement != null) {
						preparedStatement.close();
					}
					if(connection != null) {
						connection.close();
					}
				}catch(SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
			
			return tealeafList ;
		}
		/* ****************************************update********************************************************************    */
		@Override
		public TeaLeaves UpdateTeaLeaves(String TeaLeavesID, TeaLeaves TeaLeaves) {
			// TODO Auto-generated method stub
			
			if(TeaLeavesID != null && !TeaLeavesID.isEmpty()) 
			{
				try {
					connection = DBConnection.getDBConnection();
					
					preparedStatement =connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_UPDATE_Leaforder ));
					
		

				//	preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, TeaLeaves.getSupplier_Name());
					preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, TeaLeaves.getQuantity());
					preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, TeaLeaves.getUnit_Price());
					preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, TeaLeaves.getPaid());
					preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, TeaLeaves.getPDate());
					preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE, TeaLeaves.getTLID());
					
				
					preparedStatement.executeUpdate();
					
					
				}catch(SQLException | SAXException | ClassNotFoundException | IOException | ParserConfigurationException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}finally {
					try {
						if(preparedStatement != null) {
							preparedStatement.close();
						}
						if(connection != null ) {
							connection.close();
						}
					}catch(SQLException ex){
						log.log(Level.SEVERE, ex.getMessage());
					}
				}
			}
			
			return getTeaLeafByID(TeaLeavesID);
			
		
		}
		
		/** -------------    Remove tea leaves       ------------------------**/
		@Override
		public void removeTeaLeaves(String TLID) {
			// TODO Auto-generated method stub
			
			// Before deleting check whether department ID is available
			if(TLID != null && !TLID.isEmpty()) 
			{
				try {
					connection = DBConnection.getDBConnection();
					
					preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants. QUERY_ID_DELETE_Leaforder ));
					
					preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, TLID);
					preparedStatement.executeUpdate();
					
				}catch(SQLException | SAXException | ClassNotFoundException | IOException |  ParserConfigurationException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}finally {
					try {
						if(preparedStatement != null) {
							preparedStatement.close();
						}
						if(connection != null) {
							connection.close();
						}
					}catch(SQLException ex){
						log.log(Level.SEVERE, ex.getMessage());
					}
				}
			}
			
			
			
			
		}

	/* *************************************** Get all Tea Leaf IDs ************************************************************ */
	private ArrayList<String> getTeaLeafIDs() {
		
		// TODO Auto-generated method stub
		ArrayList<String> arraylist = new ArrayList<String>();
		try {
			
			connection = DBConnection.getDBConnection();
			
			//Get All Supplier ID Query will be Retrieve from EmployeeMSDBQuery.xml
			preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_ID_ALL_TeaLeaforder_IDS));
			
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				arraylist.add(result.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
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
