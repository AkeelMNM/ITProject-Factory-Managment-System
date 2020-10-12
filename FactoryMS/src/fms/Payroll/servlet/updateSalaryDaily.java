package fms.Payroll.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.DBconnection.DBConnection;


@WebServlet(name = "updateSalaryDaily", urlPatterns = {"/updateSalaryDaily"})
public class updateSalaryDaily extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

        if (request.getParameter("salID") == null) {
            out.write("Failed : Invalid Request");
            return;
        }

        String date = "0";
        String insurance = "0";
        String medical = "0";
        String bonus = "0" ;
        String ot = "0";
        String epf = "0";
        String tax = "0";
        String absent = "0";
        String totAllowance = "0";
        String totDeduction = "0";
        String netTotal = "0";

        date = request.getParameter("updatedDailyDate");
        insurance = request.getParameter("updateDailyInsurance");
        ot = request.getParameter("updateDailyHours");
        totAllowance = request.getParameter("updateTotalAllowance");
        netTotal = request.getParameter("updatedailyTotal2");
        

        if (totAllowance.equals("0") && totDeduction.equals("0")) {
            out.write("Failed : Invalid Amounts");
            return;
        }
        try {

            String sql = "UPDATE salary SET date = '" + date + "medical = '" + medical + "',bonus = '" + bonus + "',over_time_hours='"+ot+"',net_salary='"+netTotal
            		+"',tax='"+absent+"',"+ "absent='"+absent+"',total_allowance='"+totAllowance
            		+"',total_deduction='"+totDeduction+"' WHERE sal_id='"+request.getParameter("salID")+"'";
            DBConnection.getDBConnection().createStatement().execute(sql);
            
             out.write("Updated Successfully!");
            
        } catch (Exception e) {
            e.printStackTrace();
            out.write("Failed to Save! " + e.getMessage());

        }
	}

}
