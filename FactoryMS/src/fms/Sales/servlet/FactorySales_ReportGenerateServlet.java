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
import fms.Sales.service.FactorySales_ReportGeneratingService;
import fms.Sales.service.FactorySales_ReportGeneratingServiceImpt;

/**
 * Servlet implementation class FactorySales_ReportGenerateServlet
 */
/**
 * @author Zumry A.M 
 *IT NO:IT19175126
 *
 */

@WebServlet("/FactorySales_ReportGenerateServlet")
public class FactorySales_ReportGenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FactorySales_ReportGenerateServlet() {
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
		String Year = request.getParameter("year");
		
		ArrayList<FactorySales> FactorySalesList = new ArrayList<FactorySales>();
		FactorySalesService SalesService = new FactorySalesServiceImpt();
		
		if(Year == "") {
			Year = null;
		}
		
		if("View".equals(request.getParameter("viewbutton"))) 
		{
			if(Year != null) 
			{
				FactorySalesList = SalesService.getFactorySalesBySalesTypeAndYear(SalesType, Year);
				request.setAttribute("EPyear", Year);
				request.setAttribute("Key", request.getParameter("key"));
			}
			if(month != null && Year == null) 
			{
				FactorySalesList = SalesService.getFactorySalesBySalesTypeAndMonth(SalesType, month);
				request.setAttribute("EPMonth", month);
			}
			
			request.setAttribute("FactorySalesList", FactorySalesList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_FactorySales.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) 
		{	
			FactorySales_ReportGeneratingService rgs = new FactorySales_ReportGeneratingServiceImpt();
				
			if(Year == null ) 
			{	
				FactorySalesList =SalesService.getFactorySalesBySalesTypeAndMonth(SalesType, month);
				try {
					rgs.generateFactorySaleReportMonth(FactorySalesList, month);
				} catch (DocumentException | IOException e) {
					e.printStackTrace();
				}
			}
			if(Year != null) 
			{
				FactorySalesList = SalesService.getFactorySalesBySalesTypeAndYear(SalesType, Year);
				rgs.generateFactorySaleReportDay(FactorySalesList, Year);		
			}
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Report_FactorySales.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}
	

}
