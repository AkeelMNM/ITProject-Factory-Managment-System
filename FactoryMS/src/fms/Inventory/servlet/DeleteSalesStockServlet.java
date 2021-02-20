package fms.Inventory.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fms.Inventory.service.SalesStockService;
import fms.Inventory.service.SalesStockServiceImp;
import fms.Inventory.service.stockService;
import fms.Inventory.service.stockServiceImp;

/**
 * Servlet implementation class DeleteSalesStockServlet
 */
@WebServlet("/DeleteSalesStockServlet")
public class DeleteSalesStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSalesStockServlet() {
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
		// TODO Auto-generated method stub
	
	String sales_StockID = request.getParameter("SalesSid");			
		
		SalesStockService salesService = new SalesStockServiceImp();
		salesService.RemoveSalesTeaStock(sales_StockID);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Inventory/Add_SalesStock.jsp");
		dispatcher.forward(request, response);
	}

}
