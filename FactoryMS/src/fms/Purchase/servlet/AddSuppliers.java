package fms.Purchase.servlet;

import java.io.IOException;
import java.util.function.Supplier;

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
 * Servlet implementation class AddSuppliers
 */
@WebServlet("/AddSuppliers")
public class AddSuppliers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSuppliers() {
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
		
		
		Purchase supplier=new Purchase();
		
		
		
		supplier.setSupplierId(request.getParameter("suppid"));
		supplier.setSupplier(request.getParameter("supname"));
		supplier.setNic(request.getParameter("nic"));
		supplier.setContact_no(request.getParameter("contactno"));
		supplier.setAddress(request.getParameter("address "));
		supplier.setLicence_no(request.getParameter("licenseno"));
		supplier.setEstate(request.getParameter("estate"));
		
		//leave.setEmployee(request.getParameter("employee"));
		
		
		PurchaseService purchaseservice = new PurchaseServiceImpt();
		purchaseservice.addsupplier(supplier);
		
		
		request.setAttribute("supplier", supplier);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/Suppliers.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

}
