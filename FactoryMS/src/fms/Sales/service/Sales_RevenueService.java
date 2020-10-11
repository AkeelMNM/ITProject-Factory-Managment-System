package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.FactorySales;
import com.fms.model.Sales_Return;
import com.fms.model.Sales_Revenue;
import com.fms.model.Tea_Grade_Price;

/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

public interface Sales_RevenueService {
	
	//Add Sales_Revenue For Sales_Revenue Table
	public void AddSalesRevenue(Sales_Revenue Sales_Revenue);
	
	//Remove Sales_Revenue
	public void removeSalesRevenue(String SalesRevenueID);
	
	//update Sales_Revenue
	public Sales_Revenue UpdateSalesRevenue(String SalesRevenueID, Sales_Revenue Sales_Revenue);
	
	//View All Sales_Revenue
	public ArrayList<Sales_Revenue> getAllSalesRevenue();
	
	//View Sales_Revenue by id (one details)
	public Sales_Revenue getSalesRevenueByID(String SalesRevenueID) ;
	
	//Get Sales Revenue by SalesType and Month and year  //Month Report
	public ArrayList<Sales_Revenue> getSalesRevenueBySalesTypeAndMonth(String SalesType,String Month,String Year);
		
	//Get SalesRevenue by SalesType and year		//Year Report
	public ArrayList<Sales_Revenue> getSsalesRevenueBySalesTypeAndYear(String SalesType,String Year);
	
	//get Sold Details by FactorySales,Return,TeaGeadePrice ArrayList
	public ArrayList<Sales_Revenue> getSoldDetails(ArrayList<FactorySales> SalesList, ArrayList<Sales_Return> ReturnList,ArrayList<Tea_Grade_Price> priceList );
	
	
}
