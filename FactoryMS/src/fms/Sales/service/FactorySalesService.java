package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.FactorySales;
import com.fms.model.Tea_Grade_Price;

/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

public interface FactorySalesService {

	//Add Factory Sales For FactorySales Table
	public void AddFactorySales(FactorySales FactorySales);
	
	//Remove Factory Sales
	public void removeFactorySales(String FactorySalesID);
	
	//update Tea Grade and Price
	public FactorySales UpdateFactorySales(String FactorySalesID,FactorySales FactorySales);
		
	//View All Factory Sales
	public ArrayList<FactorySales> getAllFactorySales();
	
	//View Factory Sales by id (one details)
	public FactorySales getFactorySalesByID(String FactorySalesID) ;		
	
	//Get Tea Garde only Factory Sales table
	public String getTeaGrade(String FactorySalesID);
	

}
