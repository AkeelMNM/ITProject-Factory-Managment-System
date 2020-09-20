package fms.Purchase.service;



import java.util.function.Supplier;

import com.fms.model.Purchase;

public interface PurchaseService {

	
	
	public void  addleaforder(Purchase purchase);
	
	public void updateleaforder(String supplierId, Purchase purchase);
	
	public void removeleaforder(String SupID);

	
	


	
	

}
