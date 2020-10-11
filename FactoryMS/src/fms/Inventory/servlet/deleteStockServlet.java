package fms.Inventory.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import fms.Inventory.service.stockService;
import fms.Inventory.service.stockServiceImp;

/**
 * Servlet implementation class deleteStockServlet
 */
@WebServlet("/deleteStockServlet")
public class deleteStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteStockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		String Tea_StockID = request.getParameter("StockId");			
		
		stockService StockService = new stockServiceImp();
		StockService.RemoveTeaStock(Tea_StockID);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Inventory/Add_Stock.jsp");
		dispatcher.forward(request, response);
	}

}
