package fms.Sales.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Sales_Return;

import fms.Sales.service.Sales_ReturnService;
import fms.Sales.service.Sales_ReturnServiceImpt;

/**
 * Servlet implementation class Update_SalesReturnServlet
 */
/**
 * @author Zumry
 *IT NO:IT19175126
 *
 */

@WebServlet("/Update_SalesReturnServlet")
public class Update_SalesReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_SalesReturnServlet() {
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
		
		Sales_Return Return = new Sales_Return();
		
		String ReturnID = request.getParameter("RtnID");
		
		Return.setFactory_SalesID(request.getParameter("SalesID"));
		Return.setDate(request.getParameter("RtnDate"));
		Return.setTea_Grade(request.getParameter("TeaGarde"));
		Return.setReturn_Quantity(request.getParameter("RtnQty"));
		Return.setSales_Type(request.getParameter("SalesID"));
		Return.setSales_ReturnID(ReturnID);
		
		//Call back End
		Sales_ReturnService UpdateReturn = new Sales_ReturnServiceImpt();
		UpdateReturn.UpdateSalesReturn(ReturnID, Return);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Update_Sales_Return.jsp");
		dispatcher.forward(request, response);
		
	}

}
