package fms.Purchase.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.PaymentToSuppliers;

import fms.Purchase.service.PaymenttoSuppliers;
import fms.Purchase.service.PaymenttoSuppliersimpt;
import fms.Purchase.service.SupplierService;
import fms.Purchase.service.SupplierServiceImpt;


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
		
	response.setContentType("text/html");
		
		String name = request.getParameter("supname");
		
		SupplierService se = new SupplierServiceImpt();
		String id = se.getSupplierIdByName(name);
	
	
  		PaymentToSuppliers payment = new PaymentToSuppliers();

  		payment.setSupID(id);
  		payment.setName(name);
		payment.setDate(request.getParameter("Date"));
		payment.setMonth(request.getParameter("month"));
		payment.setRate(request.getParameter("rate"));
		payment.setValue(request.getParameter("value"));
		payment.setFinal_Amount(request.getParameter("finalamount"));
		payment.setIspaid(request.getParameter("paid"));
		payment.setPayment_Type(request.getParameter("paymenttype"));
		
	
		PaymenttoSuppliers Addpayment =new PaymenttoSuppliersimpt();
		Addpayment.addSupplierPayment(payment);
		
		
		request.setAttribute("payment",payment);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/AddPaymentToSuppliers.jsp");
		dispatcher.forward(request, response);

		
	}

}
