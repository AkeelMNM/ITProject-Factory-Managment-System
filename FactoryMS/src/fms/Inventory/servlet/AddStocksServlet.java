package fms.Inventory.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.fms.model.TeaStock;


import fms.Inventory.service.stockService;
import fms.Inventory.service.stockServiceImp;

/**
 * Servlet implementation class AddStocksServlet
 */
@WebServlet("/AddStocksServlet")
public class AddStocksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStocksServlet() {
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
	 * @param <stockService>
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		TeaStock teastock = new TeaStock();
		stockService StockService = new stockServiceImp();
		
		String grades =request.getParameter("grades");
		String r = StockService.getTeaGradeId(grades);
		teastock.setTeaGrade_ID(r);
		teastock.setStoring_Date(request.getParameter("Date"));
		teastock.setTea_Grades(request.getParameter("grades"));
		teastock.setTea_Grades_Qty(request.getParameter("TeaGradeQ"));
		teastock.setLocation(request.getParameter("location"));
		
		
		StockService.addTeaStocks(teastock);

		request.setAttribute("stock", teastock);
		javax.servlet.RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Inventory/Add_Stock.jsp");
		dispatcher.forward(request, response);
	}

}
