package fms.Purchase.service;

import java.util.ArrayList;

import com.fms.model.PaymentToSuppliers;


public interface PaymenttoSuppliers {

	//Add tea leaf Supplier 
	public void addSupplierPayment(PaymentToSuppliers payment);
	
	//View All tea leaf Supplier
	public ArrayList<PaymentToSuppliers>getpayment();
	
	//View tea leaf supplier by ID
	public PaymentToSuppliers getPaymentByID(String PaymentID);
	
	//update tea leaf Supplier 
	public PaymentToSuppliers UpdateSupplierPayment(String PaymentID,PaymentToSuppliers payment);
	
	//Remove tea leaf Supplier
	public void removeSupplierPayment(String PaymentID);


	
	
	/*new for report   */

	public ArrayList<PaymentToSuppliers> getpaymentBySupNameAndDay(String name, String date);

	public ArrayList<PaymentToSuppliers> getpaymentBySupNameAndMonth(String name, String month);

}
