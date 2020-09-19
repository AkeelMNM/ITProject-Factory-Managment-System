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

/**
 * Servlet implementation class UploadUserImageServlet
 */
@WebServlet("/UploadUserImageServlet")
@MultipartConfig
public class UploadUserImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadUserImageServlet() {
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
		
	    Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContent = filePart.getInputStream();
	    
	    File uploads = new File("F:\\SLIIT\\2nd Year\\2nd Semester\\IT Project\\Project File\\UserProfiles\\");
	    File file = new File(uploads, fileName);
	    
	    try (InputStream input = filePart.getInputStream()) {
	        Files.copy(input, file.toPath());
	    }
	    
	    String empid = request.getParameter("empid");
	    String accid = request.getParameter("Accid");
	    String saveDb = uploads+"\\"+fileName;
	    LoginServiceImpt logservice = new LoginServiceImpt();
	    logservice.uploadImage(saveDb, accid);
	    
	    
	    request.setAttribute("employeeid", empid);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Interfaces/Home/User_Profile.jsp");
		dispatcher.forward(request, response);
	}

}
