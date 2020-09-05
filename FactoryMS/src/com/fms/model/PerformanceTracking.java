package com.fms.model;

public class PerformanceTracking {


	private String EPTID;
	private String EmpID;
	private String JobTitle;
	private String EmpName;
	private String TimeIn;
	private String LunchIn;
	private String LunchOut;
	private String TimeOut;
	private String OvetTime;
	private String Performace;
	private String Description;
	
	public PerformanceTracking() {
		super();
	}

	public String getEPTID() {
		return EPTID;
	}

	public void setEPTID(String ePTID) {
		EPTID = ePTID;
	}

	
	public String getEmpID() {
		return EmpID;
	}
	
	public void setEmpID(String empID) {
		EmpID = empID;
	}

	public String getEmpName() {
		return EmpName;
	}
	
	public String getJobTitle() {
		return JobTitle;
	}
	
	public void setJobTitle(String jobTitle) {
		JobTitle = jobTitle;
	}

	public void setEmpName(String empName) {
		EmpName = empName;
	}

	public String getTimeIn() {
		return TimeIn;
	}

	public void setTimeIn(String timeIn) {
		TimeIn = timeIn;
	}

	public String getLunchIn() {
		return LunchIn;
	}

	public void setLunchIn(String lunchIn) {
		LunchIn = lunchIn;
	}

	public String getLunchOut() {
		return LunchOut;
	}

	public void setLunchOut(String lunchOut) {
		LunchOut = lunchOut;
	}

	public String getTimeOut() {
		return TimeOut;
	}

	public void setTimeOut(String timeOut) {
		TimeOut = timeOut;
	}

	public String getOvetTime() {
		return OvetTime;
	}

	public void setOvetTime(String ovetTime) {
		OvetTime = ovetTime;
	}

	public String getPerformace() {
		return Performace;
	}

	public void setPerformace(String performace) {
		Performace = performace;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	@Override
	public String toString() {
		return "PerformacneTracking [EPTID=" + EPTID + ", JobTitle=" + JobTitle + ", EmpName=" + EmpName + ", TimeIn="
				+ TimeIn + ", LunchIn=" + LunchIn + ", LunchOut=" + LunchOut + ", TimeOut=" + TimeOut + ", OvetTime="
				+ OvetTime + ", Performace=" + Performace + ", Description=" + Description + "]";
	}
	
	
	
}
