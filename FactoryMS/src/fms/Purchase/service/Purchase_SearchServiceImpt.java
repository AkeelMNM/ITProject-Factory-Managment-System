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
import com.fms.commonConstant.PurchaseCommonConstants;
import com.fms.model.PaymentToSuppliers;
import com.fms.model.TeaLeaf_Supplier;
import com.fms.model.TeaLeaves;

public class Purchase_SearchServiceImpt implements Purchase_SearchService {
	
	
	//Initialize logger//
			public static final Logger log=Logger.getLogger(SupplierServiceImpt.class.getName());
			
			private static Connection connection;
			
			private static Statement statement;
			
			private PreparedStatement preparedStatement;

	@Override
	public ArrayList<TeaLeaf_Supplier> SearchTeaLeafSupplier(String obj) 
	{
			
		ArrayList<TeaLeaf_Supplier> SupplierList = new ArrayList<TeaLeaf_Supplier>();
		
		if(obj != null && !obj.isEmpty())
		{
			try
			{			
				connection = DBConnection.getDBConnection();
				
				String Query = "SELECT * From tealeaf_supplier Where SupID like '%"+obj+"%' or Name like '%"+obj+"%' or NIC like '%"+obj+"%' or Contact_No like '%"+obj+"%' or Address like '%"+obj+"%' or License_No like '%"+obj+"%' or Estate like '%"+obj+"%' ";
				
				preparedStatement=connection.prepareStatement(Query);
				
				ResultSet result =preparedStatement.executeQuery();

				while(result.next())
					{
						TeaLeaf_Supplier Sup = new TeaLeaf_Supplier();
						
						Sup.setSupID(result.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
						Sup.setName(result.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
						Sup.setNIC(result.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
						Sup.setContact_No(result.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
						Sup.setAddress(result.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
						Sup.setLicense_No(result.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
						Sup.setEstate(result.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
						
						SupplierList.add(Sup);
					}
					
			}
			 catch (SQLException |   ClassNotFoundException e) {
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
		return SupplierList;

	}
/***************************TEA LEAVES SEARCH************************************************/
	@Override
	public ArrayList<TeaLeaves> SearchTeaLeaf(String obj) {
		// TODO Auto-generated method stub
ArrayList<TeaLeaves> tealeafList = new ArrayList<TeaLeaves>();
		
		if(obj != null && !obj.isEmpty())
		{
			try
			{			
				connection = DBConnection.getDBConnection();
				
				String Query = "SELECT * From tealeaves Where TLID like '%"+obj+"%' or SupID like '%"+obj+"%' or Supplier_Name like '%"+obj+"%' or Quantity like '%"+obj+"%' or Unit_Price like '%"+obj+"%' or Paid like '%"+obj+"%' or PDate like '%"+obj+"%' ";
				
				preparedStatement=connection.prepareStatement(Query);
				
				ResultSet result =preparedStatement.executeQuery();

				while(result.next())
					{
					TeaLeaves tealeave = new TeaLeaves();
						
						tealeave.setTLID(result.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
						tealeave.setSupID(result.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
						tealeave.setSupplier_Name(result.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
						tealeave.setQuantity(result.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
						tealeave.setUnit_Price(result.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
						tealeave.setPaid(result.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
						tealeave.setPDate(result.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
						
						tealeafList.add(tealeave);
					}
					
			}
			 catch (SQLException |   ClassNotFoundException e) {
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
		return tealeafList;
	}

	@Override
	public ArrayList<PaymentToSuppliers> SearchTeaLeafpayment(String obj) {
		// TODO Auto-generated method stub
ArrayList<PaymentToSuppliers> paymentList = new ArrayList<PaymentToSuppliers>();
		
		if(obj != null && !obj.isEmpty())
		{
			try
			{			
				connection = DBConnection.getDBConnection();
				
				String Query = "SELECT * From Payment  Where PaymentID like '%"+obj+"%' or SupID like '%"+obj+"%' or Date like '%"+obj+"%' or Month like '%"+obj+"%' or Name like '%"+obj+"%' or Rate like '%"+obj+"%' or Value like '%"+obj+"%' or Final_Amount like '%"+obj+"%' or Ispaid like '%"+obj+"%' or Payment_Type like '%"+obj+"%' ";
				
				preparedStatement=connection.prepareStatement(Query);
				
				ResultSet result =preparedStatement.executeQuery();

				while(result.next())
					{
					PaymentToSuppliers payment = new PaymentToSuppliers();
						
					payment.setPaymenID(result.getString(PurchaseCommonConstants.COLUMN_INDEX_ONE));
					payment.setSupID(result.getString(PurchaseCommonConstants.COLUMN_INDEX_TWO));
					payment.setDate(result.getString(PurchaseCommonConstants.COLUMN_INDEX_THREE));
					payment.setMonth(result.getString(PurchaseCommonConstants.COLUMN_INDEX_FOUR));
					payment.setName(result.getString(PurchaseCommonConstants.COLUMN_INDEX_FIVE));
			
					payment.setRate(result.getString(PurchaseCommonConstants.COLUMN_INDEX_SIX));
					payment.setValue(result.getString(PurchaseCommonConstants.COLUMN_INDEX_SEVEN));
					payment.setFinal_Amount(result.getString(PurchaseCommonConstants.COLUMN_INDEX_EIGHT));
					payment.setIspaid(result.getString(PurchaseCommonConstants.COLUMN_INDEX_NINE));
					payment.setPayment_Type(result.getString(PurchaseCommonConstants.COLUMN_INDEX_TEN));
					
						
					paymentList.add(payment);
					}
					
			}
			 catch (SQLException |   ClassNotFoundException e) {
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
		return paymentList;
	}
	
	
	
	
}
