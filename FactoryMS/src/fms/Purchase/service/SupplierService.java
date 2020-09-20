package fms.Purchase.service;

import java.util.ArrayList;

import com.fms.model.TeaLeaf_Supplier;;

public interface SupplierService {


	public void addSupplier(TeaLeaf_Supplier Supplier);
	
	public ArrayList<TeaLeaf_Supplier> getDepartments();
	
	//View supplier by ID
	public TeaLeaf_Supplier getTeaLeafSupplierByID(String SupID);
	
	public TeaLeaf_Supplier UpdateSupplier(String SupID,TeaLeaf_Supplier Supplier);
	
	public void removeSupplier(String SupID);
	
	
}
