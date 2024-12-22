package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DbQuery;
import entities.Users;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String email,pass,link,iyt;
		email=req.getParameter("email");
		pass=req.getParameter("pass");
		link=req.getParameter("link");
	
		if(email.equals("")&&pass.equals(""))
		{
			System.out.println("feilds are empty");
		}
		else
		{
			Users ue=new Users(email,pass);
			boolean re=DbQuery.userLogin(ue);
			if(re==true)
			{
				HttpSession session=req.getSession();
				session.setAttribute("email", email);
				session.setAttribute("pass", pass);
				if(link.equals("log"))
				{
					resp.sendRedirect("index.jsp");
				}
				else if(link.equals("pro"))
				{
					resp.sendRedirect("profile.jsp");
				}
				else if(link.equals("adcart"))
				{
					iyt=req.getParameter("id");
					resp.sendRedirect("AddtoCart?pr_id="+iyt);
					
				}
				else if(link.equals("cart"))
				{
					resp.sendRedirect("cart.jsp");
					
				}
				else if(link.equals("order"))
				{
					resp.sendRedirect("Orders.jsp");
					
				}
				else
				{
					resp.sendRedirect("index.jsp");
				}
				
			}else
			{
				out.print("<h2>No user found Signup</h2>");
				resp.sendRedirect("signup.jsp");
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
