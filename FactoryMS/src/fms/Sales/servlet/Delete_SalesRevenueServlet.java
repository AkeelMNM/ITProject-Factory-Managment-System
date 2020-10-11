package fms.Sales.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fms.Sales.service.Sales_RevenueService;
import fms.Sales.service.Sales_RevenueServiceImpt;

/**
 * Servlet implementation class Delete_SalesRevenueServlet
 */
/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

@WebServlet("/Delete_SalesRevenueServlet")
public class Delete_SalesRevenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_SalesRevenueServlet() {
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

		response.setContentType("text/html");
		
		String RevenueID = request.getParameter("RevID");
		
		Sales_RevenueService DeleteRevenue = new Sales_RevenueServiceImpt();
		DeleteRevenue.removeSalesRevenue(RevenueID);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Sales Revenue.jsp");
		dispatcher.forward(request, response);
		
	}

}
