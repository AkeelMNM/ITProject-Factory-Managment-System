package fms.HR.service;

import java.util.ArrayList;

import com.fms.model.Account;
import com.fms.model.E_Leave;
import com.fms.model.Employee;
import com.fms.model.Job;
import com.fms.model.PerformanceTracking;

public interface SearchService {
	
	
	//Method for Search in Employee
	public ArrayList<Employee> searchEmployee(String key);
	
	//Method for Search in Account
	public ArrayList<Account> searchAccount(String key);
		
	//Method for Search in Job
	public ArrayList<Job> searchJob(String key);
		
	//Method for Search in Employee Performance Tracking
	public ArrayList<PerformanceTracking> searchPerformanceTracking(String key);
		
	//Method for Search in Leave
	public ArrayList<E_Leave> searchLeave(String key);
		

}
