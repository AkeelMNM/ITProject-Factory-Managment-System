package fms.Purchase.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.TeaLeaves;

import fms.Purchase.service.LeaforderentryService;
import fms.Purchase.service.LeaforderentryServiceimpt;
import fms.Purchase.service.SupplierService;
import fms.Purchase.service.SupplierServiceImpt;

/**
 * Servlet implementation class ViewSupplierPayment
 */
@WebServlet("/ViewSupplierPayment")
public class ViewSupplierPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewSupplierPayment() {
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
		
		String name = request.getParameter("supname");
		
		SupplierService se = new SupplierServiceImpt();
		String id = se.getSupplierIdByName(name);
		
		
		TeaLeaves tealeaves = new TeaLeaves();
		tealeaves.setSupID(id);
		tealeaves.setSupplier_Name(name);
		tealeaves.setQuantity(request.getParameter("quantity"));
		tealeaves.setUnit_Price(request.getParameter("price"));
		tealeaves.setPaid(request.getParameter("paid"));
		tealeaves.setPDate(request.getParameter("date"));

		
		LeaforderentryService  leaforderentryservice = new LeaforderentryServiceimpt();
		leaforderentryservice.addTeaLeaves(tealeaves);

		request.setAttribute("tealeaves", tealeaves);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/leaforderreportnew.jsp");
		dispatcher.forward(request, response);
		
		
		
		
		
	}

}
