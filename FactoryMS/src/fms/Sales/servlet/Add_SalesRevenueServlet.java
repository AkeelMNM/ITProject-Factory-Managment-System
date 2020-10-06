package fms.Sales.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Sales_Revenue;

import fms.Sales.service.FactorySalesService;
import fms.Sales.service.FactorySalesServiceImpt;
import fms.Sales.service.Sales_RevenueService;
import fms.Sales.service.Sales_RevenueServiceImpt;

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
		
		Sales_Revenue Revenue = new Sales_Revenue();
		
		String date = request.getParameter("RevDate");
		String SalesType = request.getParameter("SalesType");
		String[] Sold_Qty = request.getParameterValues("Sold_Qty[]");
		String[] Amount = request.getParameterValues("total_Amount[]");
		String[] FactorySalesID = request.getParameterValues("FactorySalesID[]");
		String[] TeaGrade = new String [FactorySalesID.length];
		
		//Splitting Date
		if(date != null && !date.isEmpty())
		{
			String[] x = date.split("-");
				
			Month = x[1];
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
