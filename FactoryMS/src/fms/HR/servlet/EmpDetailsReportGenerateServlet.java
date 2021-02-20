package fms.HR.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Employee;
import com.itextpdf.text.DocumentException;

import fms.HR.service.EPTReportGeneratingService;
import fms.HR.service.EmpLeaveAndEmpDetailsReportGeneratingService;
import fms.HR.service.EmployeeService;
import fms.HR.service.EmployeeServiceImpt;

/**
 * Servlet implementation class EmpDetailsReportGenerateServlet
 */
@WebServlet("/EmpDetailsReportGenerateServlet")
public class EmpDetailsReportGenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpDetailsReportGenerateServlet() {
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
	
		String Name = request.getParameter("empName");
		String id = null;
		
		EmployeeService empService = new EmployeeServiceImpt();
		id = empService.getEmployeeID(Name);
		Employee employee = empService.getEmployeeByID(id);
		
		if("Get Employee Names".equals(request.getParameter("getjob"))) {
			
			request.setAttribute("jName", request.getParameter("jobList"));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Manager_Report_Emp_View.jsp");
			dispatcher.forward(request, response);
		}
		
		if("View".equals(request.getParameter("viewbutton"))) { 

			request.setAttribute("Key", "True");
			request.setAttribute("employee", employee);
			request.setAttribute("name", Name);
			request.setAttribute("jName", request.getParameter("jobList"));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Manager_Report_Emp_View.jsp");
			dispatcher.forward(request, response);
			
		}
		if("Generate".equals(request.getParameter("genbutton"))) {
	
			EmpLeaveAndEmpDetailsReportGeneratingService EER = new EmpLeaveAndEmpDetailsReportGeneratingService();
			EER.generatePTReportDay(employee);
			
			request.setAttribute("message", "Success");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Manager_Report_Emp_View.jsp");
			dispatcher.forward(request, response);
			
			
		}
	}

}
