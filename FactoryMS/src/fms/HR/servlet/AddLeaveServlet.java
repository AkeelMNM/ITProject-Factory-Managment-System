package fms.HR.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.E_Leave;

import fms.HR.service.E_LeaveService;
import fms.HR.service.E_LeaveServiceImpt;
import fms.HR.service.EmployeeService;
import fms.HR.service.EmployeeServiceImpt;

/**
 * Servlet implementation class AddLeaveServlet
 */
@WebServlet("/AddLeaveServlet")
public class AddLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLeaveServlet() {
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
		

		
		
		if("Get Employees".equals(request.getParameter("getJob"))) {
			
			request.setAttribute("jName", request.getParameter("jobList"));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Leave.jsp");
			dispatcher.forward(request, response);
		}
		else if("Submit".equals(request.getParameter("CL"))) {
			
			String date = request.getParameter("date");
			String month = request.getParameter("month");
			String job = request.getParameter("jobList");
			String[] name= request.getParameterValues("name[]");
			String[] absent = request.getParameterValues("absent[]");
			String[] empID = new String[name.length];
			
			E_Leave leave = new E_Leave();
			
			E_LeaveService leaveservice = new E_LeaveServiceImpt();
			EmployeeService employeeservice = new EmployeeServiceImpt();
			
			for (int i = 0; i < name.length ; i++) { 
				
				String n = null;
				n = employeeservice.getEmployeeID(name[i]);
				empID[i] =n;
				
			} 
			
			
			for (int i = 0; i < name.length ; i++) { 
				
				if(empID[i] != null) {
					leave.setDate(date);
					leave.setEmpID(empID[i]);
					leave.setEmpName(name[i]);
					leave.setJobTitle(job);
					leave.setMonth(month);
					leave.setLeave_Status(absent[i]);
					
					leaveservice.addLeave(leave);
				}
				
			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Leave.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
