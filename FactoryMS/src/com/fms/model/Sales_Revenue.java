package com.fms.model;

public class Sales_Revenue {

	private String Sales_RevenueID;
	private String Factory_SalesID;
	private String Date;
	private String Tea_Grade;
	private String Sold_Quantity;
	private String Sales_Type;
	
	
	public Sales_Revenue() {
		super();
	}

	public String getSales_RevenueID() {
		return Sales_RevenueID;
	}
	
	public void setSales_RevenueID(String sales_RevenueID) {
		Sales_RevenueID = sales_RevenueID;
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
	
	public String getSold_Quantity() {
		return Sold_Quantity;
	}
	
	public void setSold_Quantity(String sold_Quantity) {
		Sold_Quantity = sold_Quantity;
	}
	
	public String getSales_Type() {
		return Sales_Type;
	}
	
	public void setSales_Type(String sales_Type) {
		Sales_Type = sales_Type;
	}

	@Override
	public String toString() {
		return "Sales_Revenue [Sales_RevenueID=" + Sales_RevenueID + ", Factory_SalesID=" + Factory_SalesID + ", Date="
				+ Date + ", Tea_Grade=" + Tea_Grade + ", Sold_Quantity=" + Sold_Quantity + ", Sales_Type=" + Sales_Type
				+ "]";
	}
	
}
