package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.Sales_Return;

/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

public interface SalesReturn_Report_GeneratingService {

	//Monthly report
	public void generateFactorySaleReportMonth(ArrayList<Sales_Return> ReturnList,String month) ;
	
	//Yearly Report
	public void generateFactorySaleReportYearly(ArrayList<Sales_Return> ReturnList,String Year);
	
	
}
