package fms.Payroll.serviceANDservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.DBconnection.DBConnection;

/**
 * Servlet implementation class AddSalary
 */
@WebServlet("/AddSalary")
public class AddSalary extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSalary() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		if (request.getParameter("empId2") == null || request.getParameter("paymentType") == null
				|| request.getParameter("paymentType").contains("-")) {
			out.write("Failed : Invalid Request");
			return;
		}

		try {

			String salId = "1";

			ResultSet rs = DBConnection.getDBConnection().createStatement()
					.executeQuery("SELECT COUNT(sal_id) AS counts FROM salary");

			if (rs.next()) {
				salId = rs.getInt("counts") + 1 + "";
			}

			String empId = request.getParameter("empId2");
			String date = "0";
			String insurance = "0";
			String ot = "0";
			String epf = "0";
			String tax = "0";
			String absent = "0";
			String totAllowance = "0";
			String totDeduction = "0";
			String netTotal = "0";
			String medical = "0";
	        String bonus = "0" ;
	        
	        if (request.getParameter("paymentType").equalsIgnoreCase("daily")) {

                insurance = request.getParameter("dailyInsurance");
                ot = request.getParameter("dailyHours");
                totAllowance = request.getParameter("dailyTotal2");
                netTotal = request.getParameter("netSalDay");

            } else if (request.getParameter("paymentType").equalsIgnoreCase("monthly")) {
            	
            	date = request.getParameter("monthlyDate");
				absent = request.getParameter("monthlyAbsent");
				tax = request.getParameter("monthlyTax");
				epf = request.getParameter("monthlyEpf"); 
				ot = request.getParameter("monthlyHours");
				medical = request.getParameter("monthlyMedical");
	            bonus = request.getParameter("monthlyBonus");
				totAllowance = request.getParameter("totalAllowance");
				totDeduction = request.getParameter("totalDeductions");
				netTotal = request.getParameter("netSal");
            }

			if (totAllowance.equals("0") && totDeduction.equals("0")) {
				out.write("Failed : Invalid Request");
				return;
			}

			DBConnection.getDBConnection().createStatement()
					.execute("INSERT INTO salary VALUES('" + salId + "','" + empId + "','" + date + "','"+ insurance + "','" + medical + "','" + bonus + "','" + ot
							+ "'," + "'" + netTotal + "','" + tax + "','" + absent + "','" + totAllowance + "','"
							+ totDeduction + "')");

			out.write("Saved Successfully!");
		} catch (Exception e) {
			e.printStackTrace();
			out.write("Failed to Save! " + e.getMessage());

		}
	}

}
