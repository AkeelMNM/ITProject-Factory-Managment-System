package fms.Purchase.servlet;
import java.io.IOException;
import java.util.ArrayList;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.PaymentToSuppliers;

import com.itextpdf.text.DocumentException;


import fms.Purchase.service.PaymenttoSuppliers;
import fms.Purchase.service.PaymenttoSuppliersimpt;
import fms.Purchase.service.TeaLeafReportGenaratingService;


/**
 * Servlet implementation class TeaLeafReportGenarateServlet
 */
@WebServlet("/TeaLeafReportGenarateServlet")
public class TeaLeafReportGenarateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeaLeafReportGenarateServlet() {
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
		
		doGet(request, response);
		
		String Name = request.getParameter("emp_name");
		String month = request.getParameter("month");
		String date = request.getParameter("r_date");
		
		ArrayList<PaymentToSuppliers> ptList = new ArrayList<PaymentToSuppliers>();
		PaymenttoSuppliers ptservice = new PaymenttoSuppliersimpt();
		
	

		if(date == "") {
			date = null;
		}
		
		if("View".equals(request.getParameter("viewbutton"))) {
			
			if(date != null) {
				
				ptList =ptservice.getpaymentBySupNameAndDay(Name, date);
				request.setAttribute("EPDate", date);
				request.setAttribute("Key", request.getParameter("key"));
			}
			if(month != null && date == null) {
				ptList = ptservice.getpaymentBySupNameAndMonth(Name, month);
				request.setAttribute("EPMonth", month);
			}
			
			request.setAttribute("PerTList", ptList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/LeafOrderReport.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) {
			
			TeaLeafReportGenaratingService rgs = new TeaLeafReportGenaratingService();
			
			if(date != ("")) {
				
				ptList =ptservice.getpaymentBySupNameAndDay(Name, date);
				rgs.generatePTReportDay(ptList, date);
			}
			if(date.equals("")) {
				ptList = ptservice.getpaymentBySupNameAndMonth(Name, month);
				try {
					rgs.generatePTReportMonth(ptList, month);
				} catch (DocumentException | IOException e) {
					e.printStackTrace();
				}
				
			}
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Purchase/leaforderreportnew.jsp");
			dispatcher.forward(request, response);
			
			
		}
		
	}

		
		


}
