package com.fms.model;

public class Sales_Return {

	private String Sales_ReturnID;
	private String Factory_SalesID;
	private String Date;
	private String Tea_Grade;
	private String Return_Quantity;
	private String Sales_Type;
	private String Month;
	
	
	public Sales_Return() {
		super();
	}

	public String getSales_ReturnID() {
		return Sales_ReturnID;
	}
	
	public void setSales_ReturnID(String sales_ReturnID) {
		Sales_ReturnID = sales_ReturnID;
	}
	
	public String getFactory_SalesID() {
		return Factory_SalesID;
	}
	
	public void setFactory_SalesID(String factory_SalesID) {
		Factory_SalesID = factory_SalesID;
	}
	
	public String getDate() {
		return Date;
	}
	
	public void setDate(String date) {
		Date = date;
	}
	
	public String getTea_Grade() {
		return Tea_Grade;
	}
	
	public void setTea_Grade(String tea_Grade) {
		Tea_Grade = tea_Grade;
	}
	
	public String getReturn_Quantity() {
		return Return_Quantity;
	}
	
	public void setReturn_Quantity(String return_Quantity) {
		Return_Quantity = return_Quantity;
	}
	
	public String getSales_Type() {
		return Sales_Type;
	}
	
	public void setSales_Type(String sales_Type) {
		Sales_Type = sales_Type;
	}

	public String getMonth() {
		return Month;
	}

	public void setMonth(String month) {
		Month = month;
	}

	@Override
	public String toString() {
		return "Sales_Return [Sales_ReturnID=" + Sales_ReturnID + ", Factory_SalesID=" + Factory_SalesID + ", Date="
				+ Date + ", Tea_Grade=" + Tea_Grade + ", Return_Quantity=" + Return_Quantity + ", Sales_Type="
				+ Sales_Type + ", Month=" + Month + "]";
	}
	
}
