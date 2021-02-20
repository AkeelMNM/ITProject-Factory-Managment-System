
package fms.Inventory.service;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.fms.DBconnection.DBConnection;
import com.fms.QueryUtil.InventoryQueryUtil;
import com.fms.commonConstant.InventryComman;
import com.fms.model.SalesTeaStock;
import com.fms.model.TeaStock;

public interface SalesStockService {

	/** Initialize Logger**/
	public static final Logger log = Logger.getLogger(SalesStockService.class.getName()); 
	
	//Add tea Stock
		public void addSalesTeaStocks(SalesTeaStock SalesStock);
		
		//Remove sales Tea Stock
		
		public void RemoveSalesTeaStock(String releseStock_ID);

		//Update sales Tea Stock
		
		
		
		//View all Tea stock
		public ArrayList<SalesTeaStock> getAllSalesTeaStock();
		
		//view by id
		public SalesTeaStock  getSalesTeaStockById(String releseStock_ID );
		
		void addSalesStock(SalesTeaStock salesteastock);
		
		public void UpdateSalesTeaStock(String releseStock_ID, SalesTeaStock salesteastock);
		public String getTeaGradeId(String TeaGradeName);
		public String getStockId(String Location);
		
}
