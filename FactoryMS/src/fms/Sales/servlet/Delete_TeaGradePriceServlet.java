package fms.Sales.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fms.Sales.service.Tea_Grade_PriceService;
import fms.Sales.service.Tea_Grade_PriceServiceImpt;

/**
 * Servlet implementation class Delete_TeaGradePriceServlet
 */
/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

@WebServlet("/Delete_TeaGradePriceServlet")
public class Delete_TeaGradePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_TeaGradePriceServlet() {
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
		
		String TeaGradePriceID = request.getParameter("TGPid");
		
		Tea_Grade_PriceService DeleteTGP = new Tea_Grade_PriceServiceImpt();
		DeleteTGP.removeTeaGradePrice(TeaGradePriceID);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Tea_Grade_price.jsp");
		dispatcher.forward(request, response);

	}

}
