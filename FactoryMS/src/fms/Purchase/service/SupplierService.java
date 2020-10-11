package fms.Purchase.service;

import java.util.ArrayList;

import com.fms.model.TeaLeaf_Supplier;;

public interface SupplierService {

	//Add tea leaf Supplier 
	public void addSupplier(TeaLeaf_Supplier Supplier);
	
	//View All tea leaf Supplier
	public ArrayList<TeaLeaf_Supplier> getSupplier();
	
	//View tea leaf supplier by ID
	public TeaLeaf_Supplier getTeaLeafSupplierByID(String SupID);
	
	//update tea leaf Supplier 
	public TeaLeaf_Supplier UpdateSupplier(String SupID,TeaLeaf_Supplier Supplier);
	
	//Remove tea leaf Supplier
	public void removeSupplier(String SupID);
	
	//get Supplier id by name
	public String getSupplierIdByName(String supName);
	
	//get Supplier  name
	public ArrayList<String> getallSupplierName();
	
	
	
}
