package fms.Expense.service;

public class Expenses {
	private String date,exp_type,descrp,ex_supp,pay_method,chek_no;
	private double ammount;
	private int id;
	public String getEx_supp() {
		return ex_supp;
	}
	public void setEx_supp(String ex_supp) {
		this.ex_supp = ex_supp;
	}
	public String getChek_no() {
		return chek_no;
	}
	public void setChek_no(String chek_no) {
		this.chek_no = chek_no;
	}
	public double getAmmount() {
		return ammount;
	}
	public void setAmmount(double ammount) {
		this.ammount = ammount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescrp() {
		return descrp;
	}
	public void setDescrp(String descrp) {
		this.descrp = descrp;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getExp_type() {
		return exp_type;
	}
	public void setExp_type(String exp_type) {
		this.exp_type = exp_type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
