package fms.Sales.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Tea_Grade_Price;

import fms.Sales.service.Tea_Grade_PriceService;
import fms.Sales.service.Tea_Grade_PriceServiceImpt;

/**
 * Servlet implementation class Update_TeaGradePriceServlet
 */
/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

@WebServlet("/Update_TeaGradePriceServlet")
public class Update_TeaGradePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_TeaGradePriceServlet() {
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
		
		Tea_Grade_Price TGP = new Tea_Grade_Price();
		
		String TeaGradePriceID = request.getParameter("TGPid");
		
		TGP.setTea_Grade_Price_ID(TeaGradePriceID);
		TGP.setDate(request.getParameter("T-Date"));
		TGP.setTea_Grade(request.getParameter("TeaGarde"));
		TGP.setPrice(request.getParameter("TeaPrice"));
		TGP.setTeaGrade_ID(request.getParameter("TeaGradeID"));
		
		//Call back end
		Tea_Grade_PriceService updateTGP = new Tea_Grade_PriceServiceImpt();
		updateTGP.UpdateTeaGradePrice(TeaGradePriceID, TGP);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Tea_Grade_price.jsp");
		dispatcher.forward(request, response);
		
	}

}
