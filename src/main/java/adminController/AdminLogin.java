package adminController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDbQuery;
import dao.DbQuery;
import entities.AdminUser;
import entities.Users;
import helper.Mess;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String email,pass,link,iyt;
		email=req.getParameter("email");
		pass=req.getParameter("pass");
		link=req.getParameter("link");
	
		if(email.equals("")&&pass.equals(""))
		{
			Mess ms=new Mess("fields are Empty" , "danger","alert-danger");
			session.setAttribute("msg", ms);
			resp.sendRedirect("/Laba/Admin/Adminlogin.jsp");
		}
		else
		{
			AdminUser ue=new AdminUser(email,pass);
			AdminUser re=AdminDbQuery.userLogin(ue);
			if(re.getEmail()!=null&&re.getPass()!=null)
			{
				
				session.setAttribute("aduser", re);
				if(link.equals("log"))
				{
					resp.sendRedirect("/Laba/Admin/index.jsp");
				}
				else if(link.equals("pro"))
				{
					resp.sendRedirect("/Laba/Admin/AdminProfile.jsp");
				}
				
				else if(link.equals("order"))
				{
					resp.sendRedirect("/Laba/Admin/IncommingOrders.jsp");
					
				}
				else
				{
					resp.sendRedirect("/Laba/Admin/index.jsp");
				}
				
			}else
			{
				Mess ms=new Mess("No User With That Email Password" , "danger","alert-danger");
				session.setAttribute("msg", ms);
				resp.sendRedirect("/Laba/Admin/AdminLogin.jsp");
			}
			
		}
	}

}
