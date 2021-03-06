package fms.HR.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Employee;

import fms.HR.service.EmployeeService;
import fms.HR.service.EmployeeServiceImpt;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
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
		
		
		String jobname = request.getParameter("job");
		EmployeeService employeeservice = new EmployeeServiceImpt();
		String jobid =employeeservice.getJobID(jobname);
		
		
		/** ---------------------------- Creating New Employee  --------------------------**/
		
		Employee employee = new Employee();
		
		employee.setJobID(jobid);
		employee.setName(request.getParameter("name"));
		employee.setDOB(request.getParameter("DOB"));
		employee.setNIC(request.getParameter("NIC"));
		employee.setGender(request.getParameter("gender"));
		employee.setMaritalStatus(request.getParameter("MaritalStatus"));
		employee.setContactNo(request.getParameter("PhoneNo"));
		employee.setEmail(request.getParameter("email"));
		employee.setAddress(request.getParameter("Address"));
		employee.setJobTitle(request.getParameter("job"));
		employee.setJointDate(request.getParameter("Joint_date"));
		employee.setQualification(request.getParameter("qualification"));
		
		employeeservice.addEmployee(employee);
		

		request.setAttribute("employee", employee);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Employee.jsp");
		dispatcher.forward(request, response);
		
	}

}
