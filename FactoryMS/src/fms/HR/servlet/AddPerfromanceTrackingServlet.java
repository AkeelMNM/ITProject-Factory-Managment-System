package fms.HR.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.PerformanceTracking;

import fms.HR.service.EmployeeService;
import fms.HR.service.EmployeeServiceImpt;
import fms.HR.service.PerformanceTrackingService;
import fms.HR.service.PerformanceTrackingServiceImpt;

/**
 * Servlet implementation class AddPerfromanceTrackingServlet
 */
@WebServlet("/AddPerfromanceTrackingServlet")
public class AddPerfromanceTrackingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPerfromanceTrackingServlet() {
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
		
		
		String name = request.getParameter("name");
		
		EmployeeService emp = new EmployeeServiceImpt();
		String id = emp.getEmployeeID(name);
		
		PerformanceTracking pr = new PerformanceTracking();
		
		pr.setEmpID(id);
		pr.setJobTitle(request.getParameter("job"));
		pr.setEmpName(name);
		pr.setTimeIn(request.getParameter("timein"));
		pr.setLunchIn(request.getParameter("lunchin"));
		pr.setLunchOut(request.getParameter("lunchout"));
		pr.setTimeOut(request.getParameter("timeout"));
		pr.setOvetTime(request.getParameter("overtime"));
		pr.setPerformace(request.getParameter("performance"));
		pr.setDescription(request.getParameter("description"));
		
		PerformanceTrackingService ptservice = new PerformanceTrackingServiceImpt();
		ptservice.addPerformanceTracking(pr);
		
		request.setAttribute("pr", pr);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Performance_Tracking.jsp");
		dispatcher.forward(request, response);
		
	}

}
