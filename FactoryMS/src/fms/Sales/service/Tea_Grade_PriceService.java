package fms.Sales.service;

import java.util.ArrayList;

import com.fms.model.Tea_Grade_Price;

/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

public interface Tea_Grade_PriceService {

	//Add Tea Grade and Price For Tea_Grade_Price Table
	public void AddTeaGradePrice(Tea_Grade_Price TeaGradePrice);
	
	//Remove Tea Grade and Price
	public void removeTeaGradePrice(String Tea_Grade_PriceID);
	
	//update Tea Grade and Price
	public Tea_Grade_Price UpdateTeaGradePrice(String TeaGPid, Tea_Grade_Price TeaGradePrice);
	
	//View All Tea Grade and Price
	public ArrayList<Tea_Grade_Price> getTeaGradePrices();
	
	//View Tea Grade and Price by id (one details)
	public Tea_Grade_Price getTeaGradePriceByID(String TeaGPid) ;
	
	//Get Tea Garde only Tea_Grade_price table
	public String getTeaGrade(String TeaGradePriceID);
	
	
}
