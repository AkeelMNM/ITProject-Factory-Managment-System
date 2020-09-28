package fms.Sales.servlet;

import java.io.IOException;
import java.util.jar.Attributes.Name;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.FactorySales;
import com.fms.model.Tea_Grade_Price;

import fms.Sales.service.FactorySalesService;
import fms.Sales.service.FactorySalesServiceImpt;
import fms.Sales.service.Tea_Grade_PriceService;
import fms.Sales.service.Tea_Grade_PriceServiceImpt;

/**
 * Servlet implementation class Add_FactorySalesServlet
 */
/**
 * @author Zumry A.M 
 *IT NO:IT19175126
 *
 */

@WebServlet("/Add_FactorySalesServlet")
public class Add_FactorySalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_FactorySalesServlet() {
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
		
		FactorySales FactorySales = new FactorySales();
		
		String date = request.getParameter("fs-Date");
		String SalesType = request.getParameter("salesType");
		String[] Selling_Qty = request.getParameterValues("Selling_Qty[]");
		String[] TeaGardePriceID = request.getParameterValues("TeaGradeID[]");
		String[] TeaGrade = new String [TeaGardePriceID.length];
		
		//back end
		FactorySalesService AddFactorySales = new FactorySalesServiceImpt();
		Tea_Grade_PriceService GetTeaGrade = new Tea_Grade_PriceServiceImpt();
		
		//get Tea grade
		for(int i = 0 ; i < TeaGardePriceID.length ; i++)
		{
			String n = null;
			n = GetTeaGrade.getTeaGrade(TeaGardePriceID[i]);
			TeaGrade[i] = n ;
		}
		
		//Insert Factory Sales
		for(int i = 0 ; i < TeaGardePriceID.length ; i++)
		{
			if(TeaGrade[i] != null) {
				FactorySales.setDate(date);
				FactorySales.setSales_Type(SalesType);
				FactorySales.setTea_Grade_PriceID(TeaGardePriceID[i]);
				FactorySales.setTea_Grade(TeaGrade[i]);
				FactorySales.setSelling_Quantity(Selling_Qty[i]);
				
				AddFactorySales.AddFactorySales(FactorySales);
			}
			
		}
		
		request.setAttribute("FactorySales", FactorySales);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Sales/Sales_Add_Factory_Sales.jsp");
		dispatcher.forward(request, response);
		
	}

}
