package com.fms.model;

public class Account {

	private String AccID;
	private String EmpID;
	private String EmpName;
	private String UserName;
	private String Password;
	private String Status;
	private String AccType;
	private String ProfileImage;
	
	
	public Account() {
		super();
	}


	public String getAccID() {
		return AccID;
	}


	public void setAccID(String accID) {
		AccID = accID;
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


	public String getUserName() {
		return UserName;
	}


	public void setUserName(String userName) {
		UserName = userName;
	}


	public String getPassword() {
		return Password;
	}


	public void setPassword(String password) {
		Password = password;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	public String getAccType() {
		return AccType;
	}


	public void setAccType(String accType) {
		AccType = accType;
	}


	public String getProfileImage() {
		return ProfileImage;
	}


	public void setProfileImage(String profileImage) {
		ProfileImage = profileImage;
	}


	@Override
	public String toString() {
		return "Account [AccID=" + AccID + ", EmpID=" + EmpID + ", EmpName=" + EmpName + ", UserName=" + UserName
				+ ", Password=" + Password + ", Status=" + Status + ", AccType=" + AccType + ", ProfileImage="
				+ ProfileImage + "]";
	}
	
	
}
