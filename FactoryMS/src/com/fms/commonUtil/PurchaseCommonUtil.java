package com.fms.commonUtil;

import java.util.ArrayList;
import java.util.logging.Logger;


import com.fms.commonConstant.PurchaseCommonConstants;

import fms.Purchase.service.PurchaseService;

public class PurchaseCommonUtil {

	
	public static final Logger log = Logger.getLogger(PurchaseService.class.getName());

	//Creating new Supplier ID
	
	public static String generateSupIDS(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=PurchaseCommonConstants.SUPPLIER_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=PurchaseCommonConstants.SUPPLIER_ID_PREFIX + alSize;
		}
		return id;
	}


	
	
	
	
	
	public static String generateAIDs(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=PurchaseCommonConstants.SUPPLIER_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=PurchaseCommonConstants.SUPPLIER_ID_PREFIX+ alSize;
		}
		return id;
	}
	

}
