package fms.Inventory.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.TeaStock;
import com.itextpdf.text.DocumentException;

import fms.Inventory.service.StockReportGeneratingService;
import fms.Inventory.service.stockService;
import fms.Inventory.service.stockServiceImp;


/**
 * Servlet implementation class ReportGenerateServlet
 */
@WebServlet("/TeaStockReportGenerateServlet")
public class TeaStockReportGenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeaStockReportGenerateServlet() {
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
		
		String month = request.getParameter("month");
		String date = request.getParameter("r_date");
		
		stockService st = new stockServiceImp();
		ArrayList<TeaStock> ptList = new ArrayList<TeaStock>();

		if(date == "") {
			date = null;
		}
		
		
		if("View".equals(request.getParameter("viewbutton"))) { 
			
			if(date != null) {
				
				ptList =st.getStockDetailsDate(date);
				
				if(ptList.isEmpty()) {
					request.setAttribute("erMsg", "F");
				}
				else {
					request.setAttribute("EPDate", date);
					request.setAttribute("Key", request.getParameter("key"));
					request.setAttribute("TSList", ptList);
				}
			}
			if(month != null && date == null) {
				
				ptList = st.getStockDetailsMonth(month);
				
				if(ptList.isEmpty()) {
					request.setAttribute("erMsg", "F");
				}
				else {
					request.setAttribute("EPMonth", month);
					request.setAttribute("TSList", ptList);
				}
			}
			
		/*++*/RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) {
			
			StockReportGeneratingService rgs = new StockReportGeneratingService();
			
			if(date != null) {
				
				ptList =st.getStockDetailsDate(date);
				rgs.generateTeaStockReportDay(ptList, date);
			}
			if(date == null) {
				ptList = st.getStockDetailsMonth(month);
				try {
				rgs.generateTeaStockReportMonth(ptList, month);
				} catch (DocumentException | IOException e) {
					e.printStackTrace();
				}
				
			}
			
			request.setAttribute("message", "Success");
		/*++*/RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/.jsp");
			dispatcher.forward(request, response);
			
			
		}
		
	}

}
