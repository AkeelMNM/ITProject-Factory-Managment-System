package fms.HR.service;

import java.util.ArrayList;
import com.fms.model.PerformanceTracking;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */

public interface PerformanceTrackingService {

	//Add Performance Tracking for PerformanceTracking table
	public void addPerformanceTracking(PerformanceTracking performanceTracking);
	
	//Get PerformacneTracking ID in PerformacneTracking table
	public String getPerformacneTrackingID(String EmployeeID);
	
	//Get particular PerformacneTracking Details from PerformacneTracking table
	public ArrayList<PerformanceTracking> getPerformacneTrackingByID(String performanceTrackingID);

	//Get All Performance Tracking Details from PerformanceTracking table
	public ArrayList<PerformanceTracking> getPerformacneTracking();
	
	//Update an PerformanceTracking in PerformanceTracking table
	public void updatePerformanceTracking(String performanceTrackingID, PerformanceTracking performanceTracking);
	
	//Remove an PerformanceTracking Detail from PerformanceTracking table
	public void removePerformacneTracking(String performanceTrackingID);
	
	// Get Employee Name in PerformanceTracking table
	public String getEmpoyeeName(String performanceTrackingID);
			
	//Get Employee ID in Performance Tracking Table
	public String getEmployeeID(String performanceTrackingID);
}
