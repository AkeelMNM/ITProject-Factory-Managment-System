package fms.Purchase.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.PaymentToSuppliers;

import fms.Purchase.service.LeaforderentryService;
import fms.Purchase.service.LeaforderentryServiceimpt;
import fms.Purchase.service.PaymenttoSuppliersimpt;
import fms.Purchase.service.PaymenttoSuppliers;

/**
 * Servlet implementation class DeleteSupplierPayment
 */
@WebServlet("/DeleteSupplierPayment")
public class DeleteSupplierPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSupplierPayment() {
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

		String PaymentID= request.getParameter("PaymentId");
		
		
	PaymenttoSuppliers paymenttosup=new PaymenttoSuppliersimpt();
	paymenttosup.removeSupplierPayment(PaymentID);
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/AddPaymentToSuppliers.jsp");
		dispatcher.forward(request, response);
		
		
		
		
		
		
		
		
	}

}
