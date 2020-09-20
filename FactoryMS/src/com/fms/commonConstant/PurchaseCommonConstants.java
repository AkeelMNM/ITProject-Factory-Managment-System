package com.fms.commonConstant;



public class PurchaseCommonConstants {

	
	
	
	
	/** Constant for Column index One */
	public static final int COLUMN_INDEX_ONE = 1;
	
	/** Constant for Column index two */
	public static final int COLUMN_INDEX_TWO = 2;
	
	/** Constant for Column index three */
	public static final int COLUMN_INDEX_THREE = 3;
	
	/** Constant for Column index four */
	public static final int COLUMN_INDEX_FOUR = 4;
	
	/** Constant for Column index five */
	public static final int COLUMN_INDEX_FIVE = 5;
	
	/** Constant for Column index six */
	public static final int COLUMN_INDEX_SIX = 6;
	
	/** Constant for Column index seven */
	public static final int COLUMN_INDEX_SEVEN = 7;
	
	/** Constant for Column index eight */
	public static final int COLUMN_INDEX_EIGHT = 8;

	
	
/** *****************Leaf Order *****************************************   */
	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_INSERT_Leaforder = "insert_tealeaf";
	

	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_UPDATE_Leaforder = "update_leaforder";
	

	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_DELETE_Leaforder = "delete_leaforder";
	

	
/** *****************SUPPLIER*****************************************   */
	
	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_INSERT_SUPPLIER = "insert_supplier";
	
	//Constant for query id for get All Attendance IDs in EmployeeMSDBQuery.xml 
	public static final String Query_ID_ALL_TeaLeafSupplier_IDS ="get_attendanceids";	

	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_UPDATE_SUPPLIER = "update_supplier";
	

	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_DELETE_SUPPLIER = "delete_supplier";
	
	public static final String Query_id_REMOVE_SUPPLIER_BY_ID ="delete_supplierbyid";
	
	
	public static final String SUPPLIER_ID_PREFIX = "SU0";
	
	
	
	
	
	
	
	
	
/** *****************PAYMENT*****************************************   */
	
	public static final String QUERY_ID_INSERT_SUUPPLIERPAYMENT = "insert_supplierpayment";
	

	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_UPDATE_SUUPPLIERPAYMENT = "update_supplierpayment";
	

	/** Constant for query id of insert leave in EmployeeMSDDBQuery.xml */
	public static final String QUERY_ID_DELETE_SUUPPLIERPAYMENT = "delete_supplierpayment";
	

	
	
	
	
	
	public static final String QUERY_ID_INSERT_Purchase ="insert_tealeaf";

	public static final String QUERY_ID_REMOVE_Leaforder = "removeleaforder";

	public static final String QUERY_ID_UPDATE_LEAF ="upateleaf";

	public static final String QUERY_ID_GET_SUPP_IDS = "getleaveids";

	public static final String Query_id_GET_SUPPLIER_BY_ID ="getsupplierids";

	public static final String Query_id_GET_ALL_SUPPLIER ="getallsupplierids";



	



	public static String generateTLIDs(Object purchaseId) {
		// TODO Auto-generated method stub
		return null;
	}



	
}
