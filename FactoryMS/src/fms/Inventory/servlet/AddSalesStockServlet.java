package fms.Inventory.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.SalesTeaStock;


import fms.Inventory.service.SalesStockService;
import fms.Inventory.service.SalesStockServiceImp;

/**
 * Servlet implementation class AddSalesStockServlet
 */
@WebServlet("/AddSalesStockServlet")
public class AddSalesStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSalesStockServlet() {
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
		response.setContentType("text/html");
		SalesTeaStock salesTeaStock = new SalesTeaStock();
		SalesStockService salesStockService = new SalesStockServiceImp();
		
		//String grades = request.getParameter("grades");
		//String sr = salesStockService.getTeaGradeId(grades);
		//salesTeaStock.setStockId(sr);
		salesTeaStock.setRelesedDate(request.getParameter("Sdate"));
		salesTeaStock.setTea_Grades(request.getParameter("grades"));
		salesTeaStock.setTea_Grades_Quantity(request.getParameter("Sqty"));
		salesTeaStock.setLocation(request.getParameter("Location"));
		
		salesStockService.addSalesTeaStocks(salesTeaStock);
		request.setAttribute("Sales", salesTeaStock);
		
		javax.servlet.RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Inventory/Add_SalesStock.jsp");
		dispatcher.forward(request, response);
	}

}
