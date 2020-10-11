package fms.Purchase.service;

import java.util.ArrayList;

import com.fms.model.PaymentToSuppliers;
import com.fms.model.TeaLeaf_Supplier;
import com.fms.model.TeaLeaves;

public interface Purchase_SearchService {
	
	//Tea leaf supplier search
		public ArrayList<TeaLeaf_Supplier> SearchTeaLeafSupplier(String obj);
		
	//Tea leaf  search
		public ArrayList<TeaLeaves> SearchTeaLeaf(String obj);
		
	//payment to supplier search
		public ArrayList<PaymentToSuppliers> SearchTeaLeafpayment(String obj);

}
