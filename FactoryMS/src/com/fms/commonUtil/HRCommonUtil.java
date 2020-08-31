package com.fms.commonUtil;

import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Logger;

public class HRCommonUtil {
	
	
	//public static final Logger log = Logger.getLogger(AttendanceService.class.getName());

	//Creating new Employee ID
	
	public static String generateAIDs(ArrayList<String> arrayList)
	{
		String id = null;
		int alSize = arrayList.size();
		alSize++;
		//id=CommonConstants.EMPLOYEE_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			//id=CommonConstants.EMPLOYEE_ID_PREFIX + alSize;
		}
		return id;
	}
}
