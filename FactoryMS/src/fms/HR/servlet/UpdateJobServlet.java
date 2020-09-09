package fms.HR.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Job;

import fms.HR.service.JobService;
import fms.HR.service.JobServiceImpt;

/**
 * Servlet implementation class UpdateJobServlet
 */
@WebServlet("/UpdateJobServlet")
public class UpdateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateJobServlet() {
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
		
		String id = request.getParameter("jobID");
		Job job = new Job();
		
		job.setJobTitle(request.getParameter("jobtitle"));
		job.setCreatingDate(request.getParameter("date"));
		job.setBasicSalary(request.getParameter("salary"));
		job.setSalPayMethod(request.getParameter("salmethod"));
		job.setEtfRate(request.getParameter("etf"));
		job.setEpfRate(request.getParameter("epf"));
		job.setOtRate(request.getParameter("ot"));
		
		JobService jobservice = new JobServiceImpt();
		jobservice.updateJob(id, job);
		
		request.setAttribute("job", job);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Jobs.jsp");
		dispatcher.forward(request, response);
	}

}
