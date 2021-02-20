package com.fms.commonUtil;

import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Logger;

import com.fms.commonConstant.HRCommonConstants;

import fms.HR.service.EmployeeService;

public class HRCommonUtil {
	
	
	public static final Logger log = Logger.getLogger(EmployeeService.class.getName());

	//Creating new Employee ID
	
	public static String generateEIDs(ArrayList<String> arrayList)
	{
		String id = null;
		int alSize = arrayList.size();
		alSize++;
		id=HRCommonConstants.EMPLOYEE_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=HRCommonConstants.EMPLOYEE_ID_PREFIX + alSize;
		}
		return id;
	}
	
	//Creating new Job ID
	
	public static String generateJIDs(ArrayList<String> arrayList)
	{
		String id = null;
		int alSize = arrayList.size();
		alSize++;
		id=HRCommonConstants.JOB_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=HRCommonConstants.JOB_ID_PREFIX + alSize;
		}
		return id;
	}
	
	//Creating new Performance Tracking ID
		
	public static String generatePTIDs(ArrayList<String> arrayList)
	{
		String id = null;
		int alSize = arrayList.size();
		alSize++;
		id=HRCommonConstants.PERFROMANCE_TRACKING_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=HRCommonConstants.PERFROMANCE_TRACKING_ID_PREFIX + alSize;
		}
			return id;
	}
	
	//Creating new Account ID
		
	public static String generateAIDs(ArrayList<String> arrayList)
	{
		String id = null;
		int alSize = arrayList.size();
		alSize++;
		id=HRCommonConstants.ACCOUNT_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=HRCommonConstants.ACCOUNT_ID_PREFIX + alSize;
		}
		return id;
	}
	
	//Creating new Leave ID
		
	public static String generateLIDs(ArrayList<String> arrayList)
	{
		String id = null;
		int alSize = arrayList.size();
		alSize++;
		id=HRCommonConstants.LEAVE_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=HRCommonConstants.LEAVE_ID_PREFIX + alSize;
		}
		return id;
	}
}
