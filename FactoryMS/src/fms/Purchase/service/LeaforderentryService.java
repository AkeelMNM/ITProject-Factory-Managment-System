package fms.Purchase.service;

import java.util.ArrayList;

import com.fms.model.PaymentToSuppliers;
import com.fms.model.TeaLeaf_Supplier;
import com.fms.model.TeaLeaves;

public interface LeaforderentryService {
	

	//Add tea leaf 
	public void addTeaLeaves(TeaLeaves TeaLeaves);
	
	//View All tea leaf 
	public ArrayList<TeaLeaves> getTealeaves();
	
	//View tealeaf  by ID
	public TeaLeaves getTeaLeafByID(String TeaLeavesID);
	
	//update tea leaf 
	public TeaLeaves UpdateTeaLeaves(String TeaLeavesID,TeaLeaves TeaLeaves);
	
	//Remove tea leaf 
	public void removeTeaLeaves(String TLID);
	
	
	
	
	
	/*new to report          */


/*	public ArrayList<PaymentToSuppliers> getTealeafByEmpNameAndDay(String name, String date);

	public ArrayList<PaymentToSuppliers> getPerformacneTrackingByEmpNameAndDay(String name, String month);

	public ArrayList<PaymentToSuppliers> getpaymentByEmpNameAndDayByEmpNameAndDay(String name, String date);*/
	
	
	
	
	
	
	
	

}
