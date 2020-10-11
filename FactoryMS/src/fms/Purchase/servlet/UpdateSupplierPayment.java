package fms.Purchase.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.PaymentToSuppliers;
import com.fms.model.TeaLeaves;

import fms.Purchase.service.LeaforderentryService;
import fms.Purchase.service.LeaforderentryServiceimpt;
import fms.Purchase.service.PaymenttoSuppliers;
import fms.Purchase.service.PaymenttoSuppliersimpt;

/**
 * Servlet implementation class UpdateSupplierPayment
 */
@WebServlet("/UpdateSupplierPayment")
public class UpdateSupplierPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSupplierPayment() {
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
	String PaymentID = request.getParameter("PaymentID");	
		
		PaymentToSuppliers payment = new PaymentToSuppliers ();
		
		payment.setPaymenID(PaymentID);
		//tealeaf.setSupID(id);
		//tealeaf.setSupplier_Name(name);
		
		payment.setDate(request.getParameter("Date"));
		payment.setMonth(request.getParameter("month"));
		//payment.setName(request.getParameter("name"));
		payment.setRate(request.getParameter("rate"));
		payment.setValue(request.getParameter("value"));
		payment.setFinal_Amount(request.getParameter("finalamount"));
		payment.setIspaid(request.getParameter("paid"));
		payment.setPayment_Type(request.getParameter("paymenttype"));
		
	
		
		PaymenttoSuppliers paymenttosuppliersService = new PaymenttoSuppliersimpt();
		paymenttosuppliersService.UpdateSupplierPayment(PaymentID, payment);

		
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/AddPaymentToSuppliers.jsp");
		dispatcher.forward(request, response);
		
	}

}
