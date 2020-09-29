package com.fms.model;

public class E_Leave {

	private String LeaveID;
	private String EmpID;
	private String EmpName;
	private String JobTitle;
	private String Date;
	private String Month;
	private String Leave_Status;
	
	
	public E_Leave() {
		super();
	}


	public String getLeaveID() {
		return LeaveID;
	}


	public void setLeaveID(String leaveID) {
		LeaveID = leaveID;
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


	public void setEmpName(String empName) {
		EmpName = empName;
	}


	public String getDate() {
		return Date;
	}


	public void setDate(String date) {
		Date = date;
	}


	public String getMonth() {
		return Month;
	}


	public void setMonth(String month) {
		Month = month;
	}


	public String getLeave_Status() {
		return Leave_Status;
	}


	public void setLeave_Status(String leave_Status) {
		Leave_Status = leave_Status;
	}
	
	


	public String getJobTitle() {
		return JobTitle;
	}


	public void setJobTitle(String jobTitle) {
		JobTitle = jobTitle;
	}


	@Override
	public String toString() {
		return "E_Leave [LeaveID=" + LeaveID + ", EmpID=" + EmpID + ", EmpName=" + EmpName + ", JobTitle=" + JobTitle
				+ ", Date=" + Date + ", Month=" + Month + ", Leave_Status=" + Leave_Status + "]";
	}


	
	
	
	
}
