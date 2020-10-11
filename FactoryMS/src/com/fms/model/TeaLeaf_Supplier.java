package com.fms.model;

public class TeaLeaf_Supplier {


	private String SupID;
	private String Name;
	private String NIC;
	private String Contact_No;
	private String Address;
	private String License_No;
	private String Estate;
	
	public String getSupID() {
		return SupID;
	}
	public void setSupID(String supID) {
		SupID = supID;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getNIC() {
		return NIC;
	}
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	public String getContact_No() {
		return Contact_No;
	}
	public void setContact_No(String contact_No) {
		Contact_No = contact_No;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getLicense_No() {
		return License_No;
	}
	public void setLicense_No(String license_No) {
		License_No = license_No;
	}
	public String getEstate() {
		return Estate;
	}
	public void setEstate(String estate) {
		Estate = estate;
	}
	
	@Override
	public String toString() {
		return "TeaLeaf_Supplier [SupID=" + SupID + ", Name=" + Name + ", NIC=" + NIC + ", Contact_No=" + Contact_No
				+ ", Address=" + Address + ", License_No=" + License_No + ", Estate=" + Estate + "]";
	}
	
	
	
}
