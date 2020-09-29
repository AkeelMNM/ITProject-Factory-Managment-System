package fms.HR.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.E_Leave;
import com.fms.model.Employee;
import com.fms.model.PerformanceTracking;
import com.itextpdf.text.DocumentException;

import fms.HR.service.EPTReportGeneratingService;
import fms.HR.service.E_LeaveService;
import fms.HR.service.E_LeaveServiceImpt;
import fms.HR.service.EmpLeaveAndEmpDetailsReportGeneratingService;
import fms.HR.service.EmployeeService;
import fms.HR.service.EmployeeServiceImpt;
import fms.HR.service.PerformanceTrackingService;
import fms.HR.service.PerformanceTrackingServiceImpt;

/**
 * Servlet implementation class LeaveDetailsReportGenerateServlet
 */
@WebServlet("/LeaveDetailsReportGenerateServlet")
public class LeaveDetailsReportGenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveDetailsReportGenerateServlet() {
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
		
		String Name = request.getParameter("nameList");
		String month = request.getParameter("month");
		String JTitle = request.getParameter("jobList");
		
		ArrayList<E_Leave> LeaveList = new ArrayList<E_Leave>();
		E_LeaveService ELservice = new E_LeaveServiceImpt();

		if(Name.equals("--Select Name--")) {
			Name = null;
		}
		
		
		if("View".equals(request.getParameter("viewbutton"))) { 
			
			if(Name != null) {
				
				LeaveList =ELservice.getEmpLeaveByMonth(Name, month);
				request.setAttribute("EmpName", Name);
				
			}
			if(month != null && Name == null) {
				LeaveList=ELservice.getAllLeaveByMonth(month, JTitle);
				request.setAttribute("Key", request.getParameter("key"));
			}
			
			request.setAttribute("job", JTitle);
			request.setAttribute("EPMonth", month);
			request.setAttribute("ElList", LeaveList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Manager_Report_ELev_View.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) {
			
			EmpLeaveAndEmpDetailsReportGeneratingService EER = new EmpLeaveAndEmpDetailsReportGeneratingService();
			
			if(Name != null) {
				LeaveList =ELservice.getEmpLeaveByMonth(Name, month);
				try {
					EER.generateEmpLeaveDetailsInMonth(LeaveList, month, JTitle);
				} catch (DocumentException | IOException e) {
					e.printStackTrace();
				}
			}
			if(Name == null) {
				LeaveList=ELservice.getAllLeaveByMonth(month, JTitle);
				try {
				EER.generateMonthLeaveOfEmployees(LeaveList, month, JTitle);
				} catch (DocumentException | IOException e) {
					e.printStackTrace();
				}
				
			}
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Manager_Report_ELev_View.jsp");
			dispatcher.forward(request, response);
			
			
		}
	}

}
