package com.fms.model;

public class SalesTeaStock {
	
	private String ReleseStock_ID;
	
	private String RelesedDate;
	private String Tea_Grades_Quantity;
	private String Tea_Grades;
	private String StockId;
	private String Location;
	

	public String getStockId() {
		return StockId;
	}

	public void setStockId(String stockId) {
		StockId = stockId;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public String getSalesStockId() {
		return ReleseStock_ID;
		
	}

	public String getReleseStock_ID() {
		return ReleseStock_ID;
	}

	public void setReleseStock_ID(String releseStock_ID) {
		ReleseStock_ID = releseStock_ID;
	}

	public String getRelesedDate() {
		return RelesedDate;
	}

	public void setRelesedDate(String relesedDate) {
		RelesedDate = relesedDate;
	}

	public String getTea_Grades_Quantity() {
		return Tea_Grades_Quantity;
	}

	public void setTea_Grades_Quantity(String tea_Grades_Quantity) {
		Tea_Grades_Quantity = tea_Grades_Quantity;
	}

	public String getTea_Grades() {
		return Tea_Grades;
	}

	public void setTea_Grades(String tea_Grades) {
		Tea_Grades = tea_Grades;
	}

	

	@Override
	public String toString() {
		return "SalesTeaStock [ReleseStock_ID=" + ReleseStock_ID + ", Stock_ID=" + StockId + ", RelesedDate="
				+ RelesedDate + ", Tea_Grades_Quantity=" + Tea_Grades_Quantity + ", Tea_Grades=" + Tea_Grades + ", Location=" + Location + "]";
	}

	
}
