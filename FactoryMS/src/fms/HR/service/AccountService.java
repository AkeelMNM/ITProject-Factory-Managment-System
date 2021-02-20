package fms.HR.service;

import java.util.ArrayList;

import com.fms.model.Account;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */

public interface AccountService {

	//Add Account for Account table
	public void addAccount(Account Account);
	
	//Get EmployeeID for Account table
	public String getEmployeeID(String EmployeeName);
	
	//Get Account ID in Account table
	public String getAccountID(String EmployeeID);
	
	//Get particular Account from Account table
	public Account getAccountByID(String AccountID);

	//Get All Account from Account table
	public ArrayList<Account> getAccount();
	
	//Update an Account in Account table
	public void updateAccount(String AccountID, Account Account);
	
	//Remove an Account from Account table
	public void removeAccount(String AccountID);
	
	// Get Employee Name in Account table
	public String getEmpoyeeName(String AccountID);

}
