package fms.Inventory.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.TeaStock;

import fms.Inventory.service.stockService;
import fms.Inventory.service.stockServiceImp;

/**
 * Servlet implementation class editStockServlet
 */
@WebServlet("/editStockServlet")
public class editStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editStockServlet() {
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
		
		TeaStock teas = new TeaStock();
		String StockId = request.getParameter("id");
		
		
		teas.setStoring_Date(request.getParameter("udate"));
		teas.setLocation(request.getParameter("location"));
		teas.setTea_Grades(request.getParameter("grades"));
		teas.setTea_Grades_Qty(request.getParameter("TeaGQty"));
		
		stockService updateStock = new stockServiceImp();
		updateStock.UpdateTeaStock(StockId, teas);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Inventory/Add_Stock.jsp");
		dispatcher.forward(request, response);
	}

}
