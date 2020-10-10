package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.FactorySales;

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
	
	//Get FactorySales by TeaGrade and Month
	public ArrayList<FactorySales> getFactorySalesBySalesTypeAndMonth(String SalesType,String Month,String Year);
		
	//Get FactorySales by TeaGrade and year
	public ArrayList<FactorySales> getFactorySalesBySalesTypeAndYear(String SalesType,String Year);
		

}
