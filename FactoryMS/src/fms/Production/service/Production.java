package fms.Production.service;

public class Production {
	private int id;
	private String teaGrade,wastageType,leavesWastage,teaWastage,date;
	private double quntity,finalAmmount;
	public double getFinalAmmount() {
		return finalAmmount;
	}
	public void setFinalAmmount(double finalAmmount) {
		this.finalAmmount = finalAmmount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeaWastage() {
		return teaWastage;
	}
	public void setTeaWastage(String teaWastage) {
		this.teaWastage = teaWastage;
	}
	public String getWastageType() {
		return wastageType;
	}
	public void setWastageType(String wastageType) {
		this.wastageType = wastageType;
	}
	public String getTeaGrade() {
		return teaGrade;
	}
	public void setTeaGrade(String teaGrade) {
		this.teaGrade = teaGrade;
	}
	public String getLeavesWastage() {
		return leavesWastage;
	}
	public void setLeavesWastage(String leavesWastage) {
		this.leavesWastage = leavesWastage;
	}
	public double getQuntity() {
		return quntity;
	}
	public void setQuntity(double quntity) {
		this.quntity = quntity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	

}
