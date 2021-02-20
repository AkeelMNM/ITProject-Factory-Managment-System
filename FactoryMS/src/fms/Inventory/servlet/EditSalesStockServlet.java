package fms.Inventory.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.SalesTeaStock;
import com.fms.model.TeaStock;

import fms.Inventory.service.SalesStockService;
import fms.Inventory.service.SalesStockServiceImp;
import fms.Inventory.service.stockService;
import fms.Inventory.service.stockServiceImp;

/**
 * Servlet implementation class EditSalesStockServlet
 */
@WebServlet("/EditSalesStockServlet")
public class EditSalesStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSalesStockServlet() {
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
		SalesTeaStock stea = new SalesTeaStock();
		String SalesId = request.getParameter("id");
		
		
		stea.setRelesedDate(request.getParameter("update"));
		stea.setTea_Grades(request.getParameter("grades"));
		stea.setTea_Grades_Quantity(request.getParameter("sqty"));
		
		
		SalesStockService updateSStock = new SalesStockServiceImp();
		updateSStock.UpdateSalesTeaStock(SalesId, stea);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Inventory/Add_SalesStock.jsp");
		dispatcher.forward(request, response);
	}

}
