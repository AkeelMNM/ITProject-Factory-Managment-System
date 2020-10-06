package fms.Sales.service;

import java.io.IOException;
import java.util.ArrayList;

import com.fms.model.FactorySales;
import com.itextpdf.text.DocumentException;

public interface FactorySales_ReportGeneratingService {

	//Monthly report
	public void generateFactorySaleReportMonth(ArrayList<FactorySales> ptList,String month) throws DocumentException, IOException;
	
	//Yearly Report
	public void generateFactorySaleReportDay(ArrayList<FactorySales> ptList,String date);
	
	
}
