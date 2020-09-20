package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.Sales_Revenue;

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
	
	
}
