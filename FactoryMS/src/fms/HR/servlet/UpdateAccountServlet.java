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

/**
 * Servlet implementation class UpdateAccountServlet
 */
@WebServlet("/UpdateAccountServlet")
public class UpdateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAccountServlet() {
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
	
		String id = request.getParameter("AccID");
		
		if("Get Email".equals(request.getParameter("getemail"))) {
			
			request.setAttribute("ename", request.getParameter("empName"));
			request.setAttribute("id", id);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Update_Accounts.jsp");
			dispatcher.forward(request, response);
		}
		else if ("Update Account".equals(request.getParameter("Update"))) {
		
			Account account = new Account();
			account.setEmpID(request.getParameter("empID"));
			account.setUserName(request.getParameter("email"));
			account.setPassword(request.getParameter("password"));
			account.setStatus(request.getParameter("status"));
			
			AccountService accountservice = new AccountServiceImpt();
			accountservice.updateAccount(id, account);
			
			request.setAttribute("account", account);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/HR/HR_Add_Accounts.jsp");
			dispatcher.forward(request, response);
		}
	}

}
