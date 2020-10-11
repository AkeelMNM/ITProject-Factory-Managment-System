/**
 * 
 */
package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.FactorySales;
import com.fms.model.Sales_Return;
import com.fms.model.Sales_Revenue;
import com.fms.model.Tea_Grade_Price;

/**
 * @author Zumry A.M
 * NO:IT19175126
 *
 */

public interface Sales_SearchService {

	//Factory Sales Search Method 
	public ArrayList<FactorySales> SearchFactorySales(String Value);
	
	//Sales Revenue Search Method 
	public ArrayList<Sales_Revenue> SearchSalesRevenue(String Value);
	
	//Tea grade Price Search Method 
	public ArrayList<Tea_Grade_Price> SearchTeaGradePrice(String Value);
	
	//Sales Return  Search Method 
	public ArrayList<Sales_Return> SearchSalesReturn(String Value);
	
}
