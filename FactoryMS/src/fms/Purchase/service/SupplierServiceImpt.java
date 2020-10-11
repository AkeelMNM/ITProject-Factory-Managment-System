package fms.Purchase.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.function.Supplier;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;
import javax.xml.parsers.ParserConfigurationException;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;

import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.PurchaseQueryUtil;
import com.fms.commonConstant.PurchaseCommonConstants;
import com.fms.commonUtil.PurchaseCommonUtil;
import com.fms.model.TeaLeaf_Supplier;



public class SupplierServiceImpt implements SupplierService {

	//Initialize logger//
	public static final Logger log=Logger.getLogger(SupplierServiceImpt.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private PreparedStatement preparedStatement;
	
	
/** -------------    Add supplier for tea leafe suplier table        ------------------------**/
	@Override
	public void addSupplier(TeaLeaf_Supplier Supplier) 
	{

		String SupID =PurchaseCommonUtil.generateSupIDS(getSupplierIDs());
		
		try {
				connection = DBConnection.getDBConnection();
				/*
				 * Query is available in factoryMSQuery.xml file and use
				 * insert_supplier key to extract value of it
				 */
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_INSERT_SUPPLIER));
				connection.setAutoCommit(false);
				
				//Generate Supplier IDs
				Supplier.setSupID(SupID);
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE ,Supplier.getSupID());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, Supplier.getName());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, Supplier.getNIC());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, Supplier.getContact_No());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE, Supplier.getAddress());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SIX, Supplier.getLicense_No());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN, Supplier.getEstate());
				
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
	/********************************************************** View suppliers *****************************************/
	//view tea leaf suppliers
	@Override
	public ArrayList<TeaLeaf_Supplier> getSupplier() {
	
		return actionOnSupplier(null);
	}
	
	//View supplier by ID
	@Override
	public TeaLeaf_Supplier getTeaLeafSupplierByID(String SupID) {

		return actionOnSupplier(SupID).get(0);
	}	

	//view Suppliers/Spplier function
	private ArrayList<TeaLeaf_Supplier> actionOnSupplier(String SupID) {

		ArrayList<TeaLeaf_Supplier> SupplierList = new ArrayList<TeaLeaf_Supplier>();
		
		try {
			connection = DBConnection.getDBConnection();
			
			if(SupID != null && !SupID.isEmpty()) {
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_id_GET_SUPPLIER_BY_ID));
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, SupID);
			}
			else {
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_id_GET_ALL_SUPPLIER));
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				TeaLeaf_Supplier sup = new TeaLeaf_Supplier();
				sup.setSupID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
				sup.setName(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
				sup.setNIC(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
				sup.setContact_No(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
				sup.setAddress(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
				sup.setLicense_No(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
				sup.setEstate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
				
				
			
				SupplierList.add(sup);
				
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
		
		return SupplierList ;
	}


/** -------------    Update Tea Leaf Supplier         ------------------------**/
	@Override
	public TeaLeaf_Supplier UpdateSupplier(String SupID,TeaLeaf_Supplier Supplier) {
		if(SupID != null && !SupID.isEmpty()) 
		{
			try {
				connection = DBConnection.getDBConnection();
				
				preparedStatement =connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_UPDATE_SUPPLIER ));
				
				
	
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, Supplier.getName());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, Supplier.getNIC());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, Supplier.getContact_No());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, Supplier.getAddress());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE, Supplier.getLicense_No());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SIX, Supplier.getEstate());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN, SupID);
				
				
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
		
		return getTeaLeafSupplierByID(SupID);
		

	}

	
	
/** -------------    Remove supplier        ------------------------**/
	@Override
	public void removeSupplier(String SupID) {
		// Before deleting check whether department ID is available
		if(SupID != null && !SupID.isEmpty()) 
		{
			try {
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_DELETE_SUPPLIER));
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, SupID);
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

	/* *************************************** Get Supplier ID By Supplier Name ************************************************************ */
	
	@Override
	public String getSupplierIdByName(String supName) {
		String supID = null;
		
		//Checking the supName id is available
	
		if(supName != null && !supName.isEmpty())
		{
			try 
			{
				connection = DBConnection.getDBConnection();
				
				// Get Employee Name Query will be Retrieve from EmployeeMSDBQuery.xml
				preparedStatement =connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_TO_GET_NAME_BY_SUPID));
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, supName);
				
				
				ResultSet result = preparedStatement.executeQuery();
				
				if(result.next())
				{
					supID = result.getString(1); 
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
		}
		return supID;
	}
	
/* *************************************** Get all Supplier IDs ************************************************************ */

	private ArrayList<String> getSupplierIDs() {
		ArrayList<String> arraylist = new ArrayList<String>();
		
		try {
				
				connection = DBConnection.getDBConnection();
				
				//Get All Supplier ID Query will be Retrieve from EmployeeMSDBQuery.xml
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_ID_ALL_TeaLeafSupplier_IDS));
				
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
	@Override
	public ArrayList<String> getallSupplierName() {
		// TODO Auto-generated method stub
		
		
		
ArrayList<String> arraylist = new ArrayList<String>();
		
		try {
				
				connection = DBConnection.getDBConnection();
				
				//Get All Supplier ID Query will be Retrieve from EmployeeMSDBQuery.xml
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_ID_ALL_Supplier_name));
				
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
