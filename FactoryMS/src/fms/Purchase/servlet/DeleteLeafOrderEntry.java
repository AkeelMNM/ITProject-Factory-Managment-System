package fms.Purchase.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fms.Purchase.service.PurchaseService;
import fms.Purchase.service.PurchaseServiceImpt;

/**
 * Servlet implementation class DeleteLeafOrderEntry
 */
@WebServlet("/DeleteLeafOrderEntry")
public class DeleteLeafOrderEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLeafOrderEntry() {
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

		String TealeafId= request.getParameter("TealeafId");
		
		
		PurchaseService purchaseservice = new PurchaseServiceImpt();
		purchaseservice.removeleaforder(TealeafId);
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Purchase/Leaforderentry.jsp");
		doGet(request, response);
	}

}
