package fms.Payroll.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.DBconnection.DBConnection;

/**
 * Servlet implementation class deleteSalary
 */
@WebServlet("/deleteSalary")
public class deleteSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteSalary() {
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
		PrintWriter out = response.getWriter();
		
		if (request.getParameter("salID") == null) {
            out.write("Failed : Invalid Request");
            return;
        }
		
		 try {

	            String sql = "DELETE from salary WHERE sal_id = '" +request.getParameter("salID")+"'";
	            DBConnection.getDBConnection().createStatement().execute(sql);
	            
	             out.write("Deleted Successfully!");
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            out.write("Failed to Save! " + e.getMessage());

	        }

	}

}
