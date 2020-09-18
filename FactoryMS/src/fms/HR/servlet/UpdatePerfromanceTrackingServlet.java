package fms.HR.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.PerformanceTracking;

import fms.HR.service.PerformanceTrackingService;
import fms.HR.service.PerformanceTrackingServiceImpt;

/**
 * Servlet implementation class UpdatePerfromanceTrackingServlet
 */
@WebServlet("/UpdatePerfromanceTrackingServlet")
public class UpdatePerfromanceTrackingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePerfromanceTrackingServlet() {
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
		
		String id = request.getParameter("PTID");
		PerformanceTracking pr = new PerformanceTracking();
		
		pr.setEmpID(request.getParameter("empID"));
		pr.setJobTitle(request.getParameter("job"));
		pr.setEmpName(request.getParameter("name"));
		pr.setMonth(request.getParameter("month"));
		pr.setDate(request.getParameter("date"));
		pr.setTimeIn(request.getParameter("timein"));
		pr.setLunchIn(request.getParameter("lunchin"));
		pr.setLunchOut(request.getParameter("lunchout"));
		pr.setTimeOut(request.getParameter("timeout"));
		pr.setOvetTime(request.getParameter("overtime"));
		pr.setPerformace(request.getParameter("performance"));
		pr.setDescription(request.getParameter("description"));
		
		PerformanceTrackingService ptservice = new PerformanceTrackingServiceImpt();
		ptservice.updatePerformanceTracking(id, pr);
		
		request.setAttribute("pr", pr);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Performance_Tracking.jsp");
		dispatcher.forward(request, response);
	}

}
