package fms.Sales.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Sales_Return;

import fms.Sales.service.SalesReturn_Report_GeneratingService;
import fms.Sales.service.SalesReturn_Report_GeneratingServiceImpt;
import fms.Sales.service.Sales_ReturnService;
import fms.Sales.service.Sales_ReturnServiceImpt;

/**
 * Servlet implementation class Manager_SalesReturn_Report_GenerateServlet
 */

/**
 * @author Zumry A.M 
 *IT NO:IT19175126
 *
 */

@WebServlet("/Manager_Sales_Return_Report_GenerateServlet")
public class Manager_Sales_Return_Report_GenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager_Sales_Return_Report_GenerateServlet() {
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
		
		ArrayList<Sales_Return> ReturnList = new ArrayList<Sales_Return>();
		Sales_ReturnService ReturnService = new Sales_ReturnServiceImpt();
		
		if("View".equals(request.getParameter("viewbutton"))) 
		{
			if("Year".equals(Option)) 
			{
				ReturnList = ReturnService.getSsalesReturnBySalesTypeAndYear(SalesType, Year);
				request.setAttribute("Rtnyear", Year);
			}
			if(month != null && "Month".equals(Option)) 
			{
				ReturnList = ReturnService.getSalesReturnBySalesTypeAndMonth(SalesType, month,Year);
				request.setAttribute("RtnMonth", month);
			}
			
			request.setAttribute("ReturnList", ReturnList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_SalesReturn.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) 
		{	
			SalesReturn_Report_GeneratingService rgs = new SalesReturn_Report_GeneratingServiceImpt();
				
			if("Month".equals(Option)) 
			{	
				ReturnList =ReturnService.getSalesReturnBySalesTypeAndMonth(SalesType, month,Year);
				rgs.generateFactorySaleReportMonth(ReturnList, month);
			}
			if("Year".equals(Option)) 
			{
				ReturnList = ReturnService.getSsalesReturnBySalesTypeAndYear(SalesType, Year);
				rgs.generateFactorySaleReportYearly(ReturnList, Year);
			}
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_SalesReturn.jsp");
			dispatcher.forward(request, response);
	
		}
		
	}

}
