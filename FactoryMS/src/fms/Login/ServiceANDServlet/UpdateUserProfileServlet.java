package fms.Login.ServiceANDServlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fms.model.Account;

import fms.HR.service.AccountService;
import fms.HR.service.AccountServiceImpt;

/**
 * Servlet implementation class UploadUserImageServlet
 */
@WebServlet("/UpdateUserProfileServlet")
@MultipartConfig
public class UpdateUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserProfileServlet() {
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
		
		String empid = request.getParameter("empid");
		String accid = null;
		
		AccountService ac = new AccountServiceImpt();
		accid = ac.getAccountID(empid);
		Account acc = ac.getAccountByID(accid);
		
		LoginServiceImpt logservice = new LoginServiceImpt();
		
	    if("Change Password".equals(request.getParameter("pass"))) {
	    	
	    	String old =request.getParameter("oldpassword");
	    	String newp =request.getParameter("password");
	    	
	    	if(acc.getPassword().equals(old)) {
	    		
	    		logservice.changePassword(newp, accid);
	    		request.setAttribute("Passmsg", "PT");
	    	}
	    	else {
	    		request.setAttribute("Perrmsg", "PF");
	    	}
	    	
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Home/Edit_User_Profile.jsp");
	    	dispatcher.forward(request, response);
	    	
	    }
	    else if("Change Email".equals(request.getParameter("getemail"))) {
	    	
	    	String olde =request.getParameter("oldemail");
	    	String newe =request.getParameter("email");
	    	
	    	if(acc.getUserName().equals(olde)) {
	    		
	    		logservice.changeEmail(newe, accid);
	    		request.setAttribute("Epassmsg", "ET");
	    	}
	    	else {
	    		request.setAttribute("Efailmsg", "EF");
	    	}
	    	
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Home/Edit_User_Profile.jsp");
	    	dispatcher.forward(request, response);
	    	
	    }
	    else if("Uplaod".equals(request.getParameter("img"))) {
	    	
	    	Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
	    	String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    	InputStream fileContent = filePart.getInputStream();
	    	
	    	File uploads = new File("F:\\SLIIT\\2nd Year\\2nd Semester\\IT Project\\Project File\\Local Repository\\ITProject\\FactoryMS\\WebContent\\Images_UserProfile");
	    	File file = new File(uploads, fileName);
	    	
	    	try (InputStream input = filePart.getInputStream()) {
	    		Files.copy(input, file.toPath());
	    	}
	    	
	    	String saveDb = uploads+"\\"+fileName;
	    	logservice.uploadImage(saveDb, accid);
	    	
	    	
	    	request.setAttribute("upmsg", "IM");
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Home/User_Profile.jsp");
	    	dispatcher.forward(request, response);
	    }
		
	}

}
