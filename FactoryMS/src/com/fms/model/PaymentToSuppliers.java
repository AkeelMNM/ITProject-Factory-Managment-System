package com.fms.model;

public class PaymentToSuppliers {
	
	
	private String  PaymenID;
	private String  Date;
	private String  Rate;
	private String  Value;
	private String  Final_Amount;
	private String  Ispaid;
	private String  Payment_Type;
	private String  SupID;
	private String  name;
	private String  month;
	//private String  Supplier_Name;
	
	
	public String getPaymenID() {
		return PaymenID;
	}
	public void setPaymenID(String paymenID) {
		PaymenID = paymenID;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getRate() {
		return Rate;
	}
	public void setRate(String rate) {
		Rate = rate;
	}
	public String getValue() {
		return Value;
	}
	public void setValue(String value) {
		Value = value;
	}
	public String getFinal_Amount() {
		return Final_Amount;
	}
	public void setFinal_Amount(String final_Amount) {
		Final_Amount = final_Amount;
	}
	public String getIspaid() {
		return Ispaid;
	}
	public void setIspaid(String ispaid) {
		Ispaid = ispaid;
	}
	public String getPayment_Type() {
		return Payment_Type;
	}
	public void setPayment_Type(String payment_Type) {
		Payment_Type = payment_Type;
	}
	
	public String getSupID() {
		return SupID;
	}
	public void setSupID(String supID) {
		SupID = supID;
	}

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "PaymentToSuppliers [PaymenID=" + PaymenID + ", Date=" + Date + ", Rate=" + Rate + ", Value=" + Value
				+ ", Final_Amount=" + Final_Amount + ", Ispaid=" + Ispaid + ", Payment_Type=" + Payment_Type
				+ ", SupID=" + SupID + ", name=" + name + ", month=" + month + "]";
	}
	
	
	
	
	
	

}
