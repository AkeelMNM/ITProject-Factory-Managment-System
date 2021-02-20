package com.fms.model;

public class Employee {
	
	private String EmpID;
	private String JobID;
	private String Name;
	private String DOB;
	private String NIC;
	private String Gender;
	private String MaritalStatus;
	private String ContactNo;
	private String Email;
	private String Address;
	private String JobTitle;
	private String JointDate;
	private String Qualification;
	
	
	public Employee() {
		super();
	}
	
	public String getJobID() {
		return JobID;
	}
	
	public void setJobID(String jobID) {
		JobID = jobID;
	}
	
	public String getEmpID() {
		return EmpID;
	}
	
	public void setEmpID(String empID) {
		EmpID = empID;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		Name = name;
	}
	
	public String getDOB() {
		return DOB;
	}
	
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getNIC() {
		return NIC;
	}
	
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	
	public String getGender() {
		return Gender;
	}
	
	public void setGender(String gender) {
		Gender = gender;
	}
	
	public String getMaritalStatus() {
		return MaritalStatus;
	}
	
	public void setMaritalStatus(String maritalStatus) {
		MaritalStatus = maritalStatus;
	}
	
	public String getContactNo() {
		return ContactNo;
	}
	
	public void setContactNo(String contactNo) {
		ContactNo = contactNo;
	}
	
	public String getEmail() {
		return Email;
	}
	
	public void setEmail(String email) {
		Email = email;
	}
	
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	
	public String getJobTitle() {
		return JobTitle;
	}
	
	public void setJobTitle(String jobTitle) {
		JobTitle = jobTitle;
	}
	
	public String getJointDate() {
		return JointDate;
	}
	public void setJointDate(String jointDate) {
		JointDate = jointDate;
	}
	
	public String getQualification() {
		return Qualification;
	}
	
	public void setQualification(String qualification) {
		Qualification = qualification;
	}
	
	@Override
	public String toString() {
		return "Employee [EmpID=" + EmpID + ", Name=" + Name + ", DOB=" + DOB + ", NIC=" + NIC + ", Gender=" + Gender
				+ ", MaritalStatus=" + MaritalStatus + ", ContactNo=" + ContactNo + ", Email=" + Email + ", Address="
				+ Address + ", JobTitle=" + JobTitle + ", JointDate=" + JointDate + ", Qualification=" + Qualification
				+ "]";
	}
	
	
}
