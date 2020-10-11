package fms.Sales.service;

import java.io.IOException;
import java.util.ArrayList;

import com.fms.model.FactorySales;
import com.itextpdf.text.DocumentException;

/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

public interface FactorySales_Report_GeneratingService {

	//Monthly report
	public void generateFactorySaleReportMonth(ArrayList<FactorySales> salesList,String month) throws DocumentException, IOException;
	
	//Yearly Report
	public void generateFactorySaleReportYearly(ArrayList<FactorySales> salesList,String Year);
	
	
}
