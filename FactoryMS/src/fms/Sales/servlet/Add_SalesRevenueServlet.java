package fms.Sales.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.FactorySales;
import com.fms.model.Sales_Return;
import com.fms.model.Sales_Revenue;
import com.fms.model.Tea_Grade_Price;
import com.fms.model.Tea_Grades;

import fms.Sales.service.FactorySalesService;
import fms.Sales.service.FactorySalesServiceImpt;
import fms.Sales.service.Sales_ReturnService;
import fms.Sales.service.Sales_ReturnServiceImpt;
import fms.Sales.service.Sales_RevenueService;
import fms.Sales.service.Sales_RevenueServiceImpt;
import fms.Sales.service.Tea_Grade_PriceService;
import fms.Sales.service.Tea_Grade_PriceServiceImpt;

/**
 * Servlet implementation class Add_SalesRevenueServlet
 */
/**
 * @author Zumry A.M 
 *IT NO:IT19175126
 *
 */

@WebServlet("/Add_SalesRevenueServlet")
public class Add_SalesRevenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_SalesRevenueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/HTML");
		
		String Month = null;
		String monthNum = null;
		
		Sales_Revenue Revenue = new Sales_Revenue();
		
		String date = request.getParameter("RevDate");
		String SalesType = request.getParameter("SalesType");
		String[] Sold_Qty = request.getParameterValues("Sold_Qty[]");
		String[] Amount = request.getParameterValues("total_Amount[]");
		String[] FactorySalesID = request.getParameterValues("FactorySalesID[]");
		String[] TeaGrade = new String [FactorySalesID.length];
		
		
		if("Generate".equals(request.getParameter("Get"))) {
			
			FactorySalesService List1 = new FactorySalesServiceImpt();
			Sales_ReturnService List2 = new Sales_ReturnServiceImpt();
			Tea_Grade_PriceService List3 = new Tea_Grade_PriceServiceImpt();
			
			ArrayList<FactorySales> SalesList = List1.getTeaGrade_And_SellingQty(date, SalesType) ;
			ArrayList<Sales_Return> ReturnList = List2.getSalesReturn();
			ArrayList<Tea_Grade_Price> PriceList = List3.getTeaGradePrices();
			
			Sales_RevenueService Re = new Sales_RevenueServiceImpt();
			ArrayList<Sales_Revenue> SoldList = Re.getSoldDetails(SalesList, ReturnList, PriceList);
			
			request.setAttribute("SoldList", SoldList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Sales Revenue.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			//Splitting Date
			if(date != null && !date.isEmpty())
			{
				String[] x = date.split("-");
					
				monthNum = x[1];
				
				if(monthNum != null)
				{
					if(monthNum.equals("01")) {
						Month = "January";
					}else if(monthNum.equals("02")) {
						Month = "February";
					}else if(monthNum.equals("03")) {
						Month = "March";
					}else if(monthNum.equals("04")) {
						Month = "April";
					}else if(monthNum.equals("05")) {
						Month = "May";
					}else if(monthNum.equals("06")) {
						Month = "June";
					}else if(monthNum.equals("07")) {
						Month = "July";
					}else if(monthNum.equals("08")) {
						Month = "August";
					}else if(monthNum.equals("09")) {
						Month = "September";
					}else if(monthNum.equals("10")) {
						Month = "October";
					}else if(monthNum.equals("11")) {
						Month = "November";
					}else if(monthNum.equals("12")) {
						Month = "December";
					}
				}
			}
			
			//call back end
			Sales_RevenueService AddRevenue = new Sales_RevenueServiceImpt();
			FactorySalesService GetTeaGradeInFactorySales = new FactorySalesServiceImpt();
			
			//Get tea grade
			for(int i = 0 ; i < FactorySalesID.length ; i++)
			{
				String n = null;
				n = GetTeaGradeInFactorySales.getTeaGrade(FactorySalesID[i]);
				TeaGrade[i] = n ;
			}
			
			//Insert Sales Revenue
			for(int i = 0 ; i <FactorySalesID.length ; i++)
			{
				if(TeaGrade[i] != null) {
					Revenue.setDate(date);
					Revenue.setMonth(Month);
					Revenue.setSales_Type(SalesType);
					Revenue.setFactory_SalesID(FactorySalesID[i]);
					Revenue.setTea_Grade(TeaGrade[i]);
					Revenue.setSold_Quantity(Sold_Qty[i]);
					Revenue.setAmount(Amount[i]);
	
					AddRevenue.AddSalesRevenue(Revenue);
				}
			}
		
			request.setAttribute("Sales_Revenue", Revenue);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Sales Revenue.jsp");
			dispatcher.forward(request, response);
		}
	}

}
