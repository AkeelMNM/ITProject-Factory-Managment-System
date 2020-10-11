package fms.Inventory.service;
import java.util.*;
import java.util.ArrayList;
import java.util.logging.Logger;

import com.fms.model.TeaStock;

public interface stockService {

	/** Initialize Logger**/
	public static final Logger log = Logger.getLogger(stockService.class.getName()); 
	
	//Add tea Stock
	public void addTeaStocks(TeaStock stock);

	
	public String getTeaGradeId(String TeaGradeName);
	//Remove Tea Stock
	public void RemoveTeaStock(String StockID);
	
	//Update Tea Stock
	
	
	
	//View all Tea stock
	public ArrayList<TeaStock> getAllTeaStock();
	
	//view by id
	public TeaStock getTeaStockById(String StockID);

	void addStock(TeaStock teastock);

	public void UpdateTeaStock(String StockID, TeaStock teastock);

	public String getLocation(String LocationName);
	
	
	
}
