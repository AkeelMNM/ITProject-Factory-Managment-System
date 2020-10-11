package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.Sales_Revenue;

/**
 * @author Zumry A.M 
 *IT NO:IT19175126
 *
 */

public interface Sales_Revenue_Report_GeneratingService {

	//Monthly report
		public void generateFactorySaleReportMonth(ArrayList<Sales_Revenue> RevenueList,String month) ;
		
		//Yearly Report
		public void generateFactorySaleReportYearly(ArrayList<Sales_Revenue> RevenueList,String Year);
		
	
}
