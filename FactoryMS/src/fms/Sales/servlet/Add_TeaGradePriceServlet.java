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
 * Servlet implementation class Add_TeaGradePriceServlet
 */
/**
 * @author Zumry A.M 
 *IT NO:IT19175126
 *
 */

@WebServlet("/Add_TeaGradePriceServlet")
public class Add_TeaGradePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_TeaGradePriceServlet() {
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
		
		response.setContentType("text/HTML");
		
		Tea_Grade_Price TGP = new Tea_Grade_Price();
		
		String TGid = "TG004";
		
		TGP.setTeaGrade_ID(TGid);
		TGP.setDate(request.getParameter("T-Date"));
		TGP.setTea_Grade(request.getParameter("Tea_Grade"));
		TGP.setPrice(request.getParameter("price"));
		
		//call back-end
		Tea_Grade_PriceService AddTeaGradePrice = new Tea_Grade_PriceServiceImpt();
		AddTeaGradePrice.AddTeaGradePrice(TGP);
		
		request.setAttribute("Tea_Grade_Price", TGP);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Tea_Grade_price.jsp");
		dispatcher.forward(request, response);
		
	}

}
