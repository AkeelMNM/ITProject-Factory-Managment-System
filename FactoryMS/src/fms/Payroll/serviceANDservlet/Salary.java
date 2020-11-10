package fms.Payroll.serviceANDservlet;

public class Salary {
	
	private int sal_ID;
	private int EmpID ;
	private String insurance;
	private String time;
	private float Tax, Total_allowance , Total_deduction , net_salary ;
	private float medical,bonus ;
	private String Absent;
	
	
	public float getMedical() {
		return medical;
	}
	public void setMedical(float medical) {
		this.medical = medical;
	}
	public float getBonus() {
		return bonus;
	}
	public void setBonus(float bonus) {
		this.bonus = bonus;
	}

	public int getSal_ID() {
		return sal_ID;
	}
	public void setSal_ID(int sal_ID) {
		this.sal_ID = sal_ID;
	}
	public int getEmpID() {
		return EmpID;
	}
	public void setEmpID(int empID) {
		EmpID = empID;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public float getTax() {
		return Tax;
	}
	public void setTax(float tax) {
		Tax = tax;
	}
	public float getTotal_allowance() {
		return Total_allowance;
	}
	public void setTotal_allowance(float total_allowance) {
		Total_allowance = total_allowance;
	}
	public float getTotal_deduction() {
		return Total_deduction;
	}
	public void setTotal_deduction(float total_deduction) {
		Total_deduction = total_deduction;
	}
	public float getNet_salary() {
		return net_salary;
	}
	public void setNet_salary(float net_salary) {
		this.net_salary = net_salary;
	}
	public String getAbsent() {
		return Absent;
	}
	public void setAbsent(String absent) {
		Absent = absent;
	}
	
	

}
