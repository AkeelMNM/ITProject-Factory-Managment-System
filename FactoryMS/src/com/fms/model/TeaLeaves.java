package com.fms.model;

public class TeaLeaves {

	private String  TLID;
	private String  PaymenID;
	private String  SupID;
	private String  Supplier_Name;
	private String  Quantity;
	private String  Unit_Price;
	private String  Paid;
	private String  PDate;
	
	
	
	
	public String getTLID() {
		return TLID;
	}
	public void setTLID(String tLID) {
		TLID = tLID;
	}
	public String getPaymenID() {
		return PaymenID;
	}
	public void setPaymenID(String paymenID) {
		PaymenID = paymenID;
	}
	public String getSupID() {
		return SupID;
	}
	public void setSupID(String supID) {
		SupID = supID;
	}
	public String getSupplier_Name() {
		return Supplier_Name;
	}
	public void setSupplier_Name(String supplier_Name) {
		Supplier_Name = supplier_Name;
	}
	public String getQuantity() {
		return Quantity;
	}
	public void setQuantity(String quantity) {
		Quantity = quantity;
	}
	public String getUnit_Price() {
		return Unit_Price;
	}
	public void setUnit_Price(String unit_Price) {
		Unit_Price = unit_Price;
	}
	public String getPaid() {
		return Paid;
	}
	public void setPaid(String paid) {
		Paid = paid;
	}
	

	
	public String getPDate() {
		return PDate;
	}
	public void setPDate(String pDate) {
		PDate = pDate;
	}
	@Override
	public String toString() {
		return "TeaLeaves [TLID=" + TLID + ", PaymenID=" + PaymenID + ", SupID=" + SupID + ", Supplier_Name="
				+ Supplier_Name + ", Quantity=" + Quantity + ", Unit_Price=" + Unit_Price + ", Paid=" + Paid
				+ ", PDate=" + PDate + "]";
	}
	
	

	
	
}
