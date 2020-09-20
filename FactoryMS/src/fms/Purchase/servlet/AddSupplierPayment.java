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
 * Servlet implementation class AddSupplierPayment
 */
@WebServlet("/AddSupplierPayment")
public class AddSupplierPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSupplierPayment() {
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
		
		Purchase payment = new Purchase();

		payment.setDate("date");
		payment.setSupplier("supname");
		payment.setQuantity("quantity");
		payment.setRate("rate");
		payment.setValue("value");
		payment.setFinalPayment("finalPayment");
		
		
		
		PurchaseService purchaseservice = new PurchaseServiceImpt();
		purchaseservice.addsupplier(payment);
		
		
		request.setAttribute("payment",payment);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/Paymenttosuppliers.jsp");
		dispatcher.forward(request, response);

		
	}

}
