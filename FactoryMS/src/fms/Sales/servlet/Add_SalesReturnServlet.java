package fms.Sales.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Sales_Return;

import fms.Sales.service.FactorySalesService;
import fms.Sales.service.FactorySalesServiceImpt;
import fms.Sales.service.Sales_ReturnService;
import fms.Sales.service.Sales_ReturnServiceImpt;

/**
 * Servlet implementation class Add_SalesReturnServlet
 */
/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */

@WebServlet("/Add_SalesReturnServlet")
public class Add_SalesReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_SalesReturnServlet() {
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

		response.setContentType("text/HTML");
		
		Sales_Return Return = new Sales_Return();
		
		String Date = request.getParameter("RtnDate");
		String SalesType = request.getParameter("SalesType");
		String[] Return_Qty = request.getParameterValues("Rtn_Qty[]");
		String[] FactorySalesID = request.getParameterValues("FactorySalesID[]");
		String[] TeaGrade = new String [FactorySalesID.length];
		
		//call back-end
		Sales_ReturnService AddReturn = new Sales_ReturnServiceImpt();
		FactorySalesService GetTeaGradeInFactorySales = new FactorySalesServiceImpt();
		
		//Get tea grade
		for(int i = 0 ; i < FactorySalesID.length ; i++)
		{
			String n = null;
			n = GetTeaGradeInFactorySales.getTeaGrade(FactorySalesID[i]);
			TeaGrade[i] = n ;
		}
		
		//Insert Sales Revenue
		for(int i = 0 ; i <FactorySalesID.length ; i++)
		{
			if(TeaGrade[i] != null) {
				Return.setDate(Date);
				Return.setSales_Type(SalesType);
				Return.setTea_Grade(TeaGrade[i]);
				Return.setReturn_Quantity(Return_Qty[i]);
				
				AddReturn.AddSalesReturn(Return);
			}
		}

		request.setAttribute("Sales_Return", Return);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Update_Sales_Return.jsp");
		dispatcher.forward(request, response);
	
	}

}
