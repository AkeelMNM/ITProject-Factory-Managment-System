package com.fms.commonUtil;

import java.util.ArrayList;
import java.util.logging.Logger;


import com.fms.commonConstant.PurchaseCommonConstants;

public class PurchaseCommonUtil {

	
	public static final Logger log = Logger.getLogger(PurchaseCommonUtil.class.getName());

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
	
	
	//Creating new payment ID
	public static String generatePaymentIDS(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=PurchaseCommonConstants.PAYMENT_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=PurchaseCommonConstants.PAYMENT_ID_PREFIX+ alSize;
		}
		return id;
	}

	//Creating new tea leaf ID
	public static String generateTealeafIDS(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=PurchaseCommonConstants.TEALEAF_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=PurchaseCommonConstants.TEALEAF_ID_PREFIX + alSize;
		}
		return id;
	}

	
	
	
	
	

	
	

}
