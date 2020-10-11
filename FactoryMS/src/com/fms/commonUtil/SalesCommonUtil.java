package com.fms.commonUtil;

import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Logger;

import com.fms.commonConstant.SalesCommonConstants;

import fms.Sales.service.Tea_Grade_PriceService;

/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

public class SalesCommonUtil {
	
	public static final Logger log = Logger.getLogger(Tea_Grade_PriceService.class.getName());

	//Creating new Tea_Grade_Price ID
	public static String generateTea_Grade_PriceIDs(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=SalesCommonConstants.Tea_Grade_Price_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=SalesCommonConstants.Tea_Grade_Price_ID_PREFIX + alSize;
		}
		return id;
	}
	
	//Creating new Factory Sales ID
	public static String generateFactorySalesIDs(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=SalesCommonConstants.Factory_Sales_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=SalesCommonConstants.Factory_Sales_ID_PREFIX + alSize;
		}
		return id;
	}
	
	//Creating new Sales Return ID
	public static String generateSalesReturnIDs(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=SalesCommonConstants.SalesReturn_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=SalesCommonConstants.SalesReturn_ID_PREFIX + alSize;
		}
		return id;
	}
	
	//Creating new Sales_Revenue ID
	public static String generateSalesRevenueIDs(ArrayList<String> arrayList)
	{
		String id;
		int alSize = arrayList.size();
		alSize++;
		id=SalesCommonConstants.SalesRevenue_ID_PREFIX + alSize;
		if(arrayList.contains(id))
		{
			alSize++;
			id=SalesCommonConstants.SalesRevenue_ID_PREFIX + alSize;
		}
		return id;
	}
	
}
