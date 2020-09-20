package fms.Purchase.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.fms.model.Purchase;


import fms.Purchase.service.PurchaseService;
import fms.Purchase.service.PurchaseServiceImpt;

/**
 * Servlet implementation class AddLeafOrderEntry
 */
@WebServlet("/AddLeafOrderEntry")
public class AddLeafOrderEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLeafOrderEntry() {
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
		//doGet(request, response);
		
		response.setContentType("text/html");
		
		
		Purchase purchase = new Purchase();

		purchase.setDate(request.getParameter("date"));
		purchase.setSupplier("supplier");
		purchase.setGrade("grade");
		purchase.setQuantity("quantity");
		purchase.setPrice("price");
		purchase.setPaid("paid");
		
		
		PurchaseService purchaseservice = new PurchaseServiceImpt();
		purchaseservice.addleaforder(purchase);

		request.setAttribute("purchase", purchase);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/Leaforderentry.jsp");
		dispatcher.forward(request, response);
		
	}

}
