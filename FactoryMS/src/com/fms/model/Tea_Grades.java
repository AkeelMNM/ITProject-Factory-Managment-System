package com.fms.model;

public class Tea_Grades {

	private String TeaGrade_ID;
	private String Tea_Grade_Name;
	
	public Tea_Grades() {
		super();
	}

	public String getTeaGrade_ID() {
		return TeaGrade_ID;
	}

	public void setTeaGrade_ID(String teaGrade_ID) {
		TeaGrade_ID = teaGrade_ID;
	}

	public String getTea_Grade_Name() {
		return Tea_Grade_Name;
	}

	public void setTea_Grade_Name(String tea_Grade_Name) {
		Tea_Grade_Name = tea_Grade_Name;
	}

	@Override
	public String toString() {
		return "Tea_Grades [TeaGrade_ID=" + TeaGrade_ID + ", Tea_Grade_Name=" + Tea_Grade_Name + "]";
	}

	
}
