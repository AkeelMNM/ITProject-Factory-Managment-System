package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.Sales_Return;

/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

public interface Sales_ReturnService {

	//Add Tea Grade and Price For Tea_Grade_Price Table
	public void AddSalesReturn(Sales_Return Sales_Return);
	
	//Remove Tea Grade and Price
	public void removeSalesReturn(String SalesReturnID);
	
	//update Tea Grade and Price
	public Sales_Return UpdateSalesReturn(String SalesReturnID, Sales_Return Sales_Return);
	
	//View All Tea Grade and Price
	public ArrayList<Sales_Return> getSalesReturn();
	
	//View Tea Grade and Price by id (one details)
	public Sales_Return getSalesReturnByID(String SalesReturnID) ;
	
	//Get Sales return by TeaGrade and Month
	public ArrayList<Sales_Return> getSalesReturnBySalesTypeAndMonth(String SalesType,String Month,String Year);
		
	//Get SalesRetunn by TeaGrade and year
	public ArrayList<Sales_Return> getSsalesReturnBySalesTypeAndYear(String SalesType,String Year);
	
}
