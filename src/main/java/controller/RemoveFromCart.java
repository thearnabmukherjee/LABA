package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DbQuery;
import helper.Mess;

/**
 * Servlet implementation class RemoveFromCart
 */
@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		
		if(session.getAttribute("email")==null)
		{
			resp.sendRedirect("login.jsp");
		}
		else
		{
			
		String email=session.getAttribute("email").toString();
		int pr_id=Integer.parseInt(req.getParameter("id"));
		try {
			Connection con=DbQuery.connect();
			Statement st=con.createStatement();
			st.executeUpdate("delete from cart where email='"+email+"'and pr_id='"+pr_id+"' and address is NULL");
			Mess ms=new Mess("Book removed from cart" , "success","alert-warning",pr_id);
			session.setAttribute("msgr", ms);
			resp.sendRedirect("cart.jsp");
			
			
			
		} catch (Exception e) {
			System.out.print(e);
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
