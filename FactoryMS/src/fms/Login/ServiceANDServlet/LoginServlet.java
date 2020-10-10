package fms.Login.ServiceANDServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fms.model.Account;

import fms.HR.service.AccountService;
import fms.HR.service.AccountServiceImpt;

/**
   @author Akeel M.N.M
   IT NO:IT19153414
 **/


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		response.setContentType("text/html");
		
		
		
		LoginServiceImpt loginservie = new LoginServiceImpt();
		boolean b = loginservie.checkUser(request.getParameter("username"), request.getParameter("password"));
		
		if(b == true)
		{
			ArrayList<String> arrayList = loginservie.checkLogin(request.getParameter("username"), request.getParameter("password"));
		
			String empName = arrayList.get(2);
			String role = arrayList.get(3);
			String empid = arrayList.get(4);
			
			AccountService ac = new AccountServiceImpt();
			Account a = ac.getAccountByID(ac.getAccountID(empid));
			String st = a.getStatus();
			
			HttpSession session = request.getSession();
			session.setAttribute("uname", empName);
			session.setAttribute("uid", empid);
			session.setAttribute("type", role);
			session.setAttribute("img", a.getProfileImage());
		
			if(empid != null && role != null && st.equals("active"))
			{
				if(role.equals("Manager"))
				{
					request.setAttribute("employeeid", empid);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Home/Manager_Home.jsp");
					dispatcher.forward(request, response);
				}
				else if(role.equals("Administrator"))
				{
					request.setAttribute("employeeid", empid);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Home/Admin_Home.jsp");
					dispatcher.forward(request, response);
				}
				else if(role.equals("Accountant"))
				{
					request.setAttribute("employeeid", empid);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Home/Accountant_Home.jsp");
					dispatcher.forward(request, response);
				}
			}
			else
			{
				request.setAttribute("accSup", "Suspend");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}
		}
		else
		{
			request.setAttribute("result", "NoResult");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
	}

}
