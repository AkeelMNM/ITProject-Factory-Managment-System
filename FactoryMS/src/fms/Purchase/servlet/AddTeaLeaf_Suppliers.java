package fms.Purchase.servlet;

import java.io.IOException;
import java.util.function.Supplier;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.TeaLeaf_Supplier;

import fms.Purchase.service.SupplierService;
import fms.Purchase.service.SupplierServiceImpt;

/**
 * Servlet implementation class AddSuppliers
 */
@WebServlet("/AddTeaLeaf_Suppliers")
public class AddTeaLeaf_Suppliers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeaLeaf_Suppliers() {
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
	
		TeaLeaf_Supplier supplier = new TeaLeaf_Supplier();
		
		
		supplier.setSupID(request.getParameter("suppid"));
		supplier.setName(request.getParameter("supname"));
		supplier.setNIC(request.getParameter("nic"));
		supplier.setContact_No(request.getParameter("contactno"));
		supplier.setAddress(request.getParameter("address "));
		supplier.setLicense_No(request.getParameter("licenseno"));
		supplier.setEstate(request.getParameter("estate"));
		
		//leave.setEmployee(request.getParameter("employee"));
		
		SupplierService AddSupplier = new SupplierServiceImpt();
		AddSupplier.addSupplier(supplier);
		
		
		request.setAttribute("supplier", supplier);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/Add_TeaLeaf_Suppliers.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

}
