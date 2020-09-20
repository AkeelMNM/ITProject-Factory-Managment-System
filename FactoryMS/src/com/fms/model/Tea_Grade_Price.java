package com.fms.model;

public class Tea_Grade_Price {

	private String Tea_Grade_Price_ID;
	private String TeaGrade_ID;
	private String Tea_Grade;
	private String Date;
	private String Price;
	
	
	public Tea_Grade_Price() {
		super();
	}

	public String getTea_Grade_Price_ID() {
		return Tea_Grade_Price_ID;
	}
	
	public void setTea_Grade_Price_ID(String tea_Grade_Price_ID) {
		Tea_Grade_Price_ID = tea_Grade_Price_ID;
	}
	
	public String getTeaGrade_ID() {
		return TeaGrade_ID;
	}
	
	public void setTeaGrade_ID(String teaGrade_ID) {
		TeaGrade_ID = teaGrade_ID;
	}
	
	public String getTea_Grade() {
		return Tea_Grade;
	}
	
	public void setTea_Grade(String tea_Grade) {
		Tea_Grade = tea_Grade;
	}
	
	public String getDate() {
		return Date;
	}
	
	public void setDate(String date) {
		Date = date;
	}
	
	public String getPrice() {
		return Price;
	}
	
	public void setPrice(String price) {
		Price = price;
	}

	@Override
	public String toString() {
		return "Tea_Grade_Price [Tea_Grade_Price_ID=" + Tea_Grade_Price_ID + ", TeaGrade_ID=" + TeaGrade_ID
				+ ", Tea_Grade=" + Tea_Grade + ", Date=" + Date + ", Price=" + Price + "]";
	}
	
	
}
