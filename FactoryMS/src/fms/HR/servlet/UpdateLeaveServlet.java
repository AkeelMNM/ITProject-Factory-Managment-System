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

import fms.HR.service.E_LeaveService;
import fms.HR.service.E_LeaveServiceImpt;
import fms.HR.service.EmployeeService;
import fms.HR.service.EmployeeServiceImpt;

/**
 * Servlet implementation class UpdateLeaveServlet
 */
@WebServlet("/UpdateLeaveServlet")
public class UpdateLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLeaveServlet() {
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
		
		String date = request.getParameter("date");
		String month = request.getParameter("month");
		String[] name= request.getParameterValues("name[]");
		String[] absent = request.getParameterValues("absent[]");
		
		
		String btnS = request.getParameter("sb");
		
		E_Leave leave = new E_Leave();
		
		E_LeaveService leaveservice = new E_LeaveServiceImpt();

		if("Remove".equals(request.getParameter("rb"))) {
			String delid= request.getParameter("did");
			
			leaveservice.removeLeave(delid);
			
			request.setAttribute("rmonth", month);
			request.setAttribute("ldate", date);
			request.setAttribute("jT", request.getParameter("jName"));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Update_Leave.jsp");
			dispatcher.forward(request, response);
			
		}
		else if(btnS.equals("Update Leave Details")) {
			
			for (int i = 0; i < name.length ; i++) { 
					  
					if(name[i] != null) {
						
						leave.setLeaveID(leaveservice.getLeaveIDByName(name[i]));
						leave.setDate(date);
						leave.setEmpName(name[i]);
						leave.setMonth(month);
						leave.setLeave_Status(absent[i]);
						
						leaveservice.updateLeave(leaveservice.getLeaveIDByName(name[i]), leave);;
					}
					
	        	}
			
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Leave.jsp");
				dispatcher.forward(request, response);
		
		}
		
	}

}
