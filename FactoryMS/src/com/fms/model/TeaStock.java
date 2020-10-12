package com.fms.model;

public class TeaStock {

	private String StockID;
	private String TeaGrade_ID;
	private String Storing_Date;
	private String Tea_Grades;
	private String Tea_Grades_Qty;
	private String Location;
	private String Month;
	
	public String getMonth() {
		return Month;
	}
	public void setMonth(String month) {
		Month = month;
	}
	public String getStockID() {
		return StockID;
	}
	public void setStockID(String stockID) {
		StockID = stockID;
	}
	public String getTeaGrade_ID() {
		return TeaGrade_ID;
	}
	public void setTeaGrade_ID(String teaGrade_ID) {
		TeaGrade_ID = teaGrade_ID;
	}
	public String getStoring_Date() {
		return Storing_Date;
	}
	public void setStoring_Date(String storing_Date) {
		Storing_Date = storing_Date;
	}
	public String getTea_Grades() {
		return Tea_Grades;
	}
	public void setTea_Grades(String tea_Grades) {
		Tea_Grades = tea_Grades;
	}
	public String getTea_Grades_Qty() {
		return Tea_Grades_Qty;
	}
	public void setTea_Grades_Qty(String tea_Grades_Qty) {
		Tea_Grades_Qty = tea_Grades_Qty;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	@Override
	public String toString() {
		return "TeaStock [StockID=" + StockID + ", TeaGrade_ID=" + TeaGrade_ID + ", Storing_Date=" + Storing_Date
				+ ", Tea_Grades=" + Tea_Grades + ", Tea_Grades_Qty=" + Tea_Grades_Qty + ", Location=" + Location + "]";
	}
		
	
}
