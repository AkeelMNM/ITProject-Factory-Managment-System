package fms.Payroll.serviceANDservlet;

/*package fms.Payroll.servlet;

import com.fms.DBconnection.DBConnection;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "getSalary", urlPatterns = {"/getSalary"})
public class getSalary extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        try {

            ResultSet rs = DBConnection.getDBConnection().createStatement().executeQuery("SELECT * FROM salary INNER JOIN employee "
                    + " ON employee.empid = salary.empid "
                    + "INNER JOIN jobs ON jobs.jobsid=employee.jobsid WHERE salary.sal_id='" + request.getParameter("salId") + "'");

           JsonObject data = new JsonObject();

            if (rs.next()) {
                data.addProperty("salId", rs.getString("sal_id"));
                data.addProperty("employee_name", rs.getString("employee_name"));
                data.addProperty("date", rs.getDate("date").toString());
                data.addProperty("dob", rs.getString("dob"));
                data.addProperty("job_title", rs.getString("jobs.job_title"));
                data.addProperty("basic_salary", rs.getString("Basic_Salary"));
                data.addProperty("etf_rate", rs.getString("etf_rate"));
                data.addProperty("over_time_rate", rs.getString("over_time_rate"));
                data.addProperty("over_time_hours", rs.getString("over_time_hours").split(":")[2]);
                data.addProperty("salary_payment_methoed", rs.getString("salary_payment_methoed"));
                data.addProperty("Medical", rs.getString("medical"));
                data.addProperty("Bonus", rs.getString("Bonus"));
                data.addProperty("etf_rate", rs.getString("etf_rate"));
                data.addProperty("insurance", rs.getString("Insurance"));
                data.addProperty("net", rs.getString("net_salary"));
                data.addProperty("tax", rs.getString("tax"));
                data.addProperty("absent", rs.getString("absent"));
                data.addProperty("total_allowance",(rs.getDouble("total_allowance")-rs.getDouble("Basic_Salary"))-(rs.getDouble("tax")+rs.getDouble("absent")+(rs.getDouble("Basic_Salary")/100*rs.getDouble("etf_rate"))));
                data.addProperty("gross_salary",rs.getString("total_allowance"));
                data.addProperty("total_deduction", rs.getString("total_deduction"));
                data.addProperty("net_salary", rs.getDouble("net_salary"));
                data.addProperty("bonus_medical", (rs.getDouble("total_allowance")-rs.getDouble("Basic_Salary"))-(rs.getDouble("over_time_rate")*Double.parseDouble(rs.getString("over_time_hours").split(":")[2])));
            }

            out.print(data.toString());

        } catch (Exception ex1) {
            ex1.printStackTrace();
            out.print("Fail to Load : " + ex1.getMessage());
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}*/
