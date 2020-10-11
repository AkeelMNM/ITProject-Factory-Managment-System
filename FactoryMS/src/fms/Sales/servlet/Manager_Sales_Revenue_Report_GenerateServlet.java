package fms.Sales.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Sales_Revenue;

import fms.Sales.service.Sales_RevenueService;
import fms.Sales.service.Sales_RevenueServiceImpt;
import fms.Sales.service.Sales_Revenue_Report_GeneratingService;
import fms.Sales.service.Sales_Revenue_Report_GeneratingServiceImpt;

/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

/**
 * Servlet implementation class Manager_Sales_Revenue_Report_GenerateServlet
 */
@WebServlet("/Manager_Sales_Revenue_Report_GenerateServlet")
public class Manager_Sales_Revenue_Report_GenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager_Sales_Revenue_Report_GenerateServlet() {
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
		
		String SalesType = request.getParameter("SalesType");
		String month = request.getParameter("month");
		String Option = request.getParameter("Option");
		String Year = request.getParameter("year");
		
		ArrayList<Sales_Revenue> RevenueList = new ArrayList<Sales_Revenue>();
		Sales_RevenueService RevenueService = new Sales_RevenueServiceImpt();
		
		if("View".equals(request.getParameter("viewbutton"))) 
		{
			if("Year".equals(Option)) 
			{
				RevenueList = RevenueService.getSsalesRevenueBySalesTypeAndYear(SalesType, Year);
				request.setAttribute("ReYear", Year);
			}
			if(month != null && "Month".equals(Option)) 
			{
				RevenueList = RevenueService.getSalesRevenueBySalesTypeAndMonth(SalesType, month,Year);
				request.setAttribute("ReMonth", month);
			}
			
			request.setAttribute("ReturnList", RevenueList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_SalesRevenue.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) 
		{	
			Sales_Revenue_Report_GeneratingService rgs = new Sales_Revenue_Report_GeneratingServiceImpt();
				
			if("Month".equals(Option)) 
			{	
				RevenueList = RevenueService.getSalesRevenueBySalesTypeAndMonth(SalesType, month,Year);
				rgs.generateFactorySaleReportMonth(RevenueList, month);
			}
			if("Year".equals(Option)) 
			{
				RevenueList = RevenueService.getSsalesRevenueBySalesTypeAndYear(SalesType, Year);
				rgs.generateFactorySaleReportYearly(RevenueList, Year);
			}
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_SalesRevenue.jsp");
			dispatcher.forward(request, response);
	
		}
		
	}

}
