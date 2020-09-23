package fms.HR.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.PerformanceTracking;
import com.itextpdf.text.DocumentException;

import fms.HR.service.PerformanceTrackingService;
import fms.HR.service.PerformanceTrackingServiceImpt;
import fms.HR.service.ReportGeneratingService;

/**
 * Servlet implementation class ReportGenerateServlet
 */
@WebServlet("/ReportGenerateServlet")
public class ReportGenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportGenerateServlet() {
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
		
		String Name = request.getParameter("emp_name");
		String month = request.getParameter("month");
		String date = request.getParameter("r_date");
		
		ArrayList<PerformanceTracking> ptList = new ArrayList<PerformanceTracking>();
		PerformanceTrackingService ptservice = new PerformanceTrackingServiceImpt();
		
		if("View".equals(request.getParameter("viewbutton"))) {
			
			if(month.equals(null)) {
				
				ptList =ptservice.getPerformacneTrackingByEmpNameAndDay(Name, date);
			}
			if(month != null) {
				ptList = ptservice.getPerformacneTrackingByEmpNameAndMonth(Name, month);
			}
			
			request.setAttribute("PerTList", ptList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Manager_Report_EPT_View.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) {
			
			ReportGeneratingService rgs = new ReportGeneratingService();
			
			if(month.equals(null)) {
				
				ptList =ptservice.getPerformacneTrackingByEmpNameAndDay(Name, date);
				rgs.generatePTReportDay(ptList, date);
			}
			if(month != null) {
				ptList = ptservice.getPerformacneTrackingByEmpNameAndMonth(Name, month);
				try {
					rgs.generatePTReportMonth(ptList, month);
				} catch (DocumentException | IOException e) {
					e.printStackTrace();
				}
				
			}
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Manager_Report_EPT_View.jsp");
			dispatcher.forward(request, response);
			
			
		}
		
	}

}
