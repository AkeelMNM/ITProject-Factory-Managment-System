package com.fms.commonUtil;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.fms.commonConstant.InventryComman;

import fms.Inventory.service.stockService;


public class InventryCommonUtil {
	public static final Logger log = Logger.getLogger(stockService.class.getName());

public static String generateStockIDs(ArrayList<String> arrayList) {
		
		String id;
		int next = arrayList.size();
		next++;
		id = InventryComman.Query_id_Stock_ID_PREFIX + next ;
		
		if(arrayList.contains(id))
		{
			next++;
			id = InventryComman.Query_id_Stock_ID_PREFIX + next ;
		}
		return id;
	}

public static String generateSalesStockIDs(ArrayList<String> arrayList) {
	
	String id;
	int next = arrayList.size();
	next++;
	id = InventryComman.Query_ID_SALES_STOCK_ID_PREFIX + next ;
	
	if(arrayList.contains(id))
	{
		next++;
		id = InventryComman.Query_ID_SALES_STOCK_ID_PREFIX + next ;
	}
	return id;
}
}
