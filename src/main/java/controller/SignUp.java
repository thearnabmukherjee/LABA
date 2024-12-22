package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DbQuery;
import entities.Users;

/**
 * Servlet implementation class SignUp
 */
	@MultipartConfig
 @WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String fname,lname,email,pass,city;
		fname=req.getParameter("fname");
		lname=req.getParameter("lname");
		email=req.getParameter("email");
		pass=req.getParameter("pass");
		city=req.getParameter("city");
		
		if(fname.equals("")&&lname.equals("")&&email.equals("")&&pass.equals("")&&city.equals(""))
		{
			System.out.println("feilds are empty");
		}
		else
		{
			Users ue=new Users(fname,lname,email,pass,city);
		
			boolean re=DbQuery.userSignup(ue);
			if(re==true)
			{
				out.print("data added succefully");
				
			}else
			{
				out.print("error in adding data");
				
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
