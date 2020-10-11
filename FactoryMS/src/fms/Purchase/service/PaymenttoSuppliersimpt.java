package fms.Purchase.service;

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
import com.fms.QueryUtil.PurchaseQueryUtil;
import com.fms.commonConstant.PurchaseCommonConstants;
import com.fms.commonUtil.PurchaseCommonUtil;
import com.fms.model.PaymentToSuppliers;
import com.fms.model.TeaLeaf_Supplier;

public class PaymenttoSuppliersimpt implements PaymenttoSuppliers {
	//Initialize logger//
		public static final Logger log=Logger.getLogger(SupplierServiceImpt.class.getName());
		
		private static Connection connection;
		
		private static Statement statement;
		
		private PreparedStatement preparedStatement;

	@Override
	public void addSupplierPayment(PaymentToSuppliers payment) {
		// TODO Auto-generated method stub
		
		
		String PaymentID =PurchaseCommonUtil.generatePaymentIDS(gettealeafpaymentids());
		
		try {
				connection = DBConnection.getDBConnection();
				/*
				 * Query is available in factoryMSQuery.xml file and use
				 * insert_supplier key to extract value of it
				 */
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_INSERT_SUUPPLIERPAYMENT));
				connection.setAutoCommit(false);
				
				//Generate Supplier IDs
				payment.setPaymenID(PaymentID);

				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE ,payment.getPaymenID());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO ,payment.getSupID());
	
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, payment.getDate());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, payment.getMonth());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE ,payment.getName());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SIX, payment.getRate());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN, payment.getValue());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT, payment.getFinal_Amount());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_NINE, payment.getIspaid());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TEN, payment.getPayment_Type());
				
				
				// Add payment
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


	/********************************************************** View payment *****************************************/
	@Override
	public ArrayList<PaymentToSuppliers> getpayment() {
		
		return actionOnPayment(null);
	}

	@Override
	public PaymentToSuppliers getPaymentByID(String PaymentID) {
		
		return actionOnPayment(PaymentID).get(0);
	}
	
	//view Suppliers/Spplier function
	private ArrayList<PaymentToSuppliers> actionOnPayment(String PaymentID) {

		ArrayList<PaymentToSuppliers> paymentList = new ArrayList<PaymentToSuppliers>();
		
		try {
			connection = DBConnection.getDBConnection();
			if(PaymentID != null && !PaymentID.isEmpty()) {
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_id_GET_PAYMENT_BY_ID));
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, PaymentID);
			}
			else {
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_id_GET_ALL_PAYMENT));
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				PaymentToSuppliers Payment = new PaymentToSuppliers();
				
				Payment.setPaymenID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
				Payment.setSupID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
				Payment.setDate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
				Payment.setMonth(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
				
				Payment.setName(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
				Payment.setRate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
				Payment.setValue(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
				Payment.setFinal_Amount(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT));
				Payment.setIspaid(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_NINE));
				Payment.setPayment_Type(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TEN));
				
				
			
				paymentList.add(Payment);
				
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
		
		return paymentList ;
	}
	
	/* ****************************************update********************************************************************    */

	@Override
	public PaymentToSuppliers UpdateSupplierPayment(String PaymentID, PaymentToSuppliers payment) {
		// TODO Auto-generated method stub
		
		if(PaymentID != null && !PaymentID.isEmpty()) 
		{
			try {
				connection = DBConnection.getDBConnection();
				
				preparedStatement =connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_UPDATE_SUUPPLIERPAYMENT ));
				
	
				
		
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, payment.getDate());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, payment.getMonth());
				//preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO ,payment.getName());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_THREE, payment.getRate());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FOUR, payment.getValue());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_FIVE, payment.getFinal_Amount());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SIX, payment.getIspaid());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN, payment.getPayment_Type());
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT,payment.getPaymenID());
				
				
				
				
				
				
			
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
		
		return getPaymentByID(PaymentID);
		
	
		
	
	}

	@Override
	public void removeSupplierPayment(String PaymentID) {
		// TODO Auto-generated method stub
		if(PaymentID != null && !PaymentID.isEmpty()) 
		{
			try {
				connection = DBConnection.getDBConnection();
				
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.QUERY_ID_DELETE_SUUPPLIERPAYMENT));
				
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, PaymentID);
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

	
/* *************************************** Get all payment IDs ************************************************************ */
	private ArrayList<String> gettealeafpaymentids() {
		
		ArrayList<String> arraylist = new ArrayList<String>();
		try {
			
			connection = DBConnection.getDBConnection();
			
			//Get All Supplier ID Query will be Retrieve from EmployeeMSDBQuery.xml
			preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_ID_ALL_TeaLeafpayment_IDS));
			
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

	/* ***************************************      Tea Leaf order report         ************************************************************ */
	@Override
	public ArrayList<PaymentToSuppliers> getpaymentBySupNameAndDay(String name, String date) {
		// TODO Auto-generated method stub
		
ArrayList<PaymentToSuppliers> paymentList = new ArrayList<PaymentToSuppliers>();
		
		try {
			connection = DBConnection.getDBConnection();
			if(name != null && !name.isEmpty()) {
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_id_GET_PAYMENT_BY_NAME_AND_DAY));
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, name);
			}
			
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				PaymentToSuppliers Payment = new PaymentToSuppliers();
				
				Payment.setPaymenID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
				Payment.setSupID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
				Payment.setDate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
				Payment.setMonth(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
				
				Payment.setName(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
				Payment.setRate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
				Payment.setValue(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
				Payment.setFinal_Amount(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT));
				Payment.setIspaid(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_NINE));
				Payment.setPayment_Type(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TEN));
				
			
				paymentList.add(Payment);
				
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
		
		return paymentList ;
		

		
	}


	@Override
	public ArrayList<PaymentToSuppliers> getpaymentBySupNameAndMonth(String name, String month) {
		
		
		ArrayList<PaymentToSuppliers> paymentList = new ArrayList<PaymentToSuppliers>();
		try {
			connection = DBConnection.getDBConnection();
			if(name != null && !name.isEmpty()) {
				preparedStatement = connection.prepareStatement(PurchaseQueryUtil.queryByID(PurchaseCommonConstants.Query_id_GET_PAYMENT_BY_NAME_AND_MONTH));
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_ONE, name);
				preparedStatement.setString(PurchaseCommonConstants.COLUMN_INDEX_TWO, month);
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				PaymentToSuppliers Payment = new PaymentToSuppliers();
				
				Payment.setPaymenID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
				Payment.setSupID(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
				Payment.setDate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
				Payment.setMonth(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
				
				Payment.setName(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
				Payment.setRate(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
				Payment.setValue(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
				Payment.setFinal_Amount(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT));
				Payment.setIspaid(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_NINE));
				Payment.setPayment_Type(resultSet.getString(PurchaseCommonConstants.COLUMN_INDEX_TEN));
				
				
			
				paymentList.add(Payment);
				
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
		
		return paymentList ;
	}
	
	
}
