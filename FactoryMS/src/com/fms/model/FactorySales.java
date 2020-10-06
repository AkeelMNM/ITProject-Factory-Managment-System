package com.fms.model;

public class FactorySales {
	
	private String Factory_Sales_ID;
	private String Tea_Grade_PriceID;
	private String Date;
	private String Tea_Grade;
	private String Selling_Quantity;
	private String Sales_Type;
	private String Month;
	
	
	public FactorySales() {
		super();
	}

	public String getFactory_Sales_ID() {
		return Factory_Sales_ID;
	}
	
	public void setFactory_Sales_ID(String factory_Sales_ID) {
		Factory_Sales_ID = factory_Sales_ID;
	}
	
	public String getTea_Grade_PriceID() {
		return Tea_Grade_PriceID;
	}
	
	public void setTea_Grade_PriceID(String tea_Grade_PriceID) {
		Tea_Grade_PriceID = tea_Grade_PriceID;
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
	
	public String getSelling_Quantity() {
		return Selling_Quantity;
	}
	
	public void setSelling_Quantity(String selling_Quantity) {
		Selling_Quantity = selling_Quantity;
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
		return "FactorySales [Factory_Sales_ID=" + Factory_Sales_ID + ", Tea_Grade_PriceID=" + Tea_Grade_PriceID
				+ ", Date=" + Date + ", Tea_Grade=" + Tea_Grade + ", Selling_Quantity=" + Selling_Quantity
				+ ", Sales_Type=" + Sales_Type + ", Month=" + Month + "]";
	}

}
