package com.fms.model;

public class Job {

	private String JobID;
	private String JobTitle;
	private String creatingDate;
	private String BasicSalary;
	private String SalPayMethod;
	private double EtfRate;
	private double EpfRate;
	private double OtRate;
	
	public Job() {
		super();
	}

	public String getJobID() {
		return JobID;
	}

	public void setJobID(String jobID) {
		JobID = jobID;
	}

	public String getJobTitle() {
		return JobTitle;
	}

	public void setJobTitle(String jobTitle) {
		JobTitle = jobTitle;
	}

	public String getCreatingDate() {
		return creatingDate;
	}

	public void setCreatingDate(String creatingDate) {
		this.creatingDate = creatingDate;
	}

	public String getBasicSalary() {
		return BasicSalary;
	}

	public void setBasicSalary(String basicSalary) {
		BasicSalary = basicSalary;
	}

	public String getSalPayMethod() {
		return SalPayMethod;
	}

	public void setSalPayMethod(String salPayMethod) {
		SalPayMethod = salPayMethod;
	}

	public double getEtfRate() {
		return EtfRate;
	}

	public void setEtfRate(double etfRate) {
		EtfRate = etfRate;
	}

	public double getEpfRate() {
		return EpfRate;
	}

	public void setEpfRate(double epfRate) {
		EpfRate = epfRate;
	}

	public double getOtRate() {
		return OtRate;
	}

	public void setOtRate(double otRate) {
		OtRate = otRate;
	}

	@Override
	public String toString() {
		return "Job [JobID=" + JobID + ", JobTitle=" + JobTitle + ", creatingDate=" + creatingDate + ", BasicSalary="
				+ BasicSalary + ", SalPayMethod=" + SalPayMethod + ", EtfRate=" + EtfRate + ", EpfRate=" + EpfRate
				+ ", OtRate=" + OtRate + "]";
	}
	
	
	
}
