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
import com.itextpdf.text.DocumentException;

import fms.Sales.service.FactorySalesService;
import fms.Sales.service.FactorySalesServiceImpt;
import fms.Sales.service.FactorySales_Report_GeneratingService;
import fms.Sales.service.FactorySales_Report_GeneratingServiceImpt;

/**
 * Servlet implementation class FactorySales_ReportGenerateServlet
 */

/**
 * @author Zumry A.M 
 *IT NO:IT19175126
 *
 */

@WebServlet("/Manager_Factory_Sales_Report_GenerateServlet")
public class Manager_Factory_Sales_Report_GenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager_Factory_Sales_Report_GenerateServlet() {
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
		
		ArrayList<FactorySales> FactorySalesList = new ArrayList<FactorySales>();
		FactorySalesService SalesService = new FactorySalesServiceImpt();
		
		if("View".equals(request.getParameter("viewbutton"))) 
		{
			if("Year".equals(Option)) 
			{
				FactorySalesList = SalesService.getFactorySalesBySalesTypeAndYear(SalesType, Year);
				request.setAttribute("FSyear", Year);
			}
			if(month != null && "Month".equals(Option)) 
			{
				FactorySalesList = SalesService.getFactorySalesBySalesTypeAndMonth(SalesType, month,Year);
				request.setAttribute("FSMonth", month);
			}
			
			request.setAttribute("FactorySalesList", FactorySalesList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_FactorySales.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) 
		{	
			FactorySales_Report_GeneratingService rgs = new FactorySales_Report_GeneratingServiceImpt();
				
			if("Month".equals(Option)) 
			{	
				FactorySalesList =SalesService.getFactorySalesBySalesTypeAndMonth(SalesType, month,Year);
				try {
					rgs.generateFactorySaleReportMonth(FactorySalesList, month);
				} catch (DocumentException | IOException e) {
					e.printStackTrace();
				}
			}
			if("Year".equals(Option)) 
			{
				FactorySalesList = SalesService.getFactorySalesBySalesTypeAndYear(SalesType, Year);
				rgs.generateFactorySaleReportYearly(FactorySalesList, Year);
			}
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_FactorySales.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}
	

}
