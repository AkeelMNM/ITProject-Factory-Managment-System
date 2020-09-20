package fms.Sales.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.FactorySales;

import fms.Sales.service.FactorySalesService;
import fms.Sales.service.FactorySalesServiceImpt;

/**
 * Servlet implementation class Update_FactorySalesServlet
 */
/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

@WebServlet("/Update_FactorySalesServlet")
public class Update_FactorySalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_FactorySalesServlet() {
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
		
		FactorySales Sales = new FactorySales();
		
		String SalesID = request.getParameter("SalesID");
		
		Sales.setTea_Grade_PriceID(request.getParameter("TeaGradePriceID"));
		Sales.setDate(request.getParameter("SalDate"));
		Sales.setTea_Grade(request.getParameter("Tea_Garde"));
		Sales.setSelling_Quantity(request.getParameter("Selling_Qty"));
		Sales.setSales_Type(request.getParameter("Sales_Type"));
		Sales.setFactory_Sales_ID(SalesID);
		
		//Call back end
		FactorySalesService UpdateFactorySales = new FactorySalesServiceImpt();
		UpdateFactorySales.UpdateFactorySales(SalesID, Sales);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Factory_Sales.jsp");
		dispatcher.forward(request, response);
		
	}

}
