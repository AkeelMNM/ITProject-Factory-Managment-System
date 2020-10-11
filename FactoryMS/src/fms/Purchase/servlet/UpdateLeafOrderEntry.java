package fms.Purchase.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.TeaLeaf_Supplier;
import com.fms.model.TeaLeaves;

import fms.Purchase.service.LeaforderentryService;
import fms.Purchase.service.LeaforderentryServiceimpt;
import fms.Purchase.service.SupplierService;
import fms.Purchase.service.SupplierServiceImpt;






/**
 * Servlet implementation class UpdateLeafOrderEntry
 */
@WebServlet("/UpdateLeafOrderEntry")
public class UpdateLeafOrderEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLeafOrderEntry() {
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
	
		String TLID = request.getParameter("TLID");	
		
		TeaLeaves tealeaf = new TeaLeaves ();
		
		tealeaf.setTLID(TLID);
		//tealeaf.setSupID(id);
		//tealeaf.setSupplier_Name(name);
		//tealeaf.setSupplier_Name(request.getParameter("supname"));
		tealeaf.setQuantity(request.getParameter("quantity"));
		tealeaf.setUnit_Price(request.getParameter("price"));
		tealeaf.setPaid(request.getParameter("paid"));
		tealeaf.setPDate(request.getParameter("date"));
	
		
		LeaforderentryService leaforderentryService = new LeaforderentryServiceimpt();
		leaforderentryService.UpdateTeaLeaves(TLID, tealeaf);

		
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/Leaforderentry.jsp");
		dispatcher.forward(request, response);
		
	
		
		
		
		
		
	}

}
