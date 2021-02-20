package fms.HR.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fms.model.Account;

import fms.HR.service.AccountService;
import fms.HR.service.AccountServiceImpt;
import fms.HR.service.EmployeeService;
import fms.HR.service.EmployeeServiceImpt;

/**
 * Servlet implementation class AddAccountServlet
 */
@WebServlet("/AddAccountServlet")
public class AddAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAccountServlet() {
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
			
			request.setAttribute("jName", request.getParameter("acctype"));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Accounts.jsp");
			dispatcher.forward(request, response);
		}
		else if("Get Email".equals(request.getParameter("getemail"))) {
			
			request.setAttribute("jName", request.getParameter("acctype"));
			request.setAttribute("ename", request.getParameter("name"));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Accounts.jsp");
			dispatcher.forward(request, response);
			
		}
		else if("Create".equals(request.getParameter("CAccount"))) {
			
			EmployeeService empservice = new EmployeeServiceImpt();
			String empid = empservice.getEmployeeID(request.getParameter("name"));
			
			Account account = new Account();
			
			account.setAccType(request.getParameter("acctype"));
			account.setEmpID(empid);
			account.setEmpName(request.getParameter("name"));
			account.setUserName(request.getParameter("email"));
			account.setPassword(request.getParameter("password"));
			account.setStatus(request.getParameter("status"));
			
			AccountService accountservice = new AccountServiceImpt();
			accountservice.addAccount(account);
			
			request.setAttribute("account", account);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Accounts.jsp");
			dispatcher.forward(request, response);
		}
	}

}
