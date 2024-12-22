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
 * Servlet implementation class IncDec
 */
@WebServlet("/IncDec")
public class IncDec extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncDec() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		if(session.getAttribute("email")==null)
		{
			resp.sendRedirect("login.jsp");
		}
		else
		{
			
		
		String email=session.getAttribute("email").toString();
		int pr_id=Integer.parseInt(req.getParameter("id"));
		String inde=req.getParameter("qun");
		int price=0;
		int total=0;
		int quan=0;
		int f_total=0;
		try {
			Connection con=DbQuery.connect();
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' and pr_id='"+pr_id+"' and address is NULL");
			while(rs.next())
			{
				price=rs.getInt(4);
				total=rs.getInt(5);
				quan=rs.getInt(3);
			}
			
			if(quan==1 && inde.equals("dec"))
			{
				Mess ms=new Mess("quantity is 1 can't be decresses" , "danger","alert-danger",pr_id);
				session.setAttribute("msg", ms);
				resp.sendRedirect("cart.jsp");
			}
			else if(quan!=1 && inde.equals("dec"))
			{
				total=total-price;
				quan=quan-1;
				st.executeUpdate("update cart set total='"+total+"', quantity='"+quan+"' where email='"+email+"' and pr_id='"+pr_id+"' and address is NULL");
				Mess ms=new Mess("quantity decreased" , "success","alert-warning",pr_id);
				session.setAttribute("msg", ms);
				resp.sendRedirect("cart.jsp");
			}
			else
			{
				total=total+price;
				quan=quan+1;
				st.executeUpdate("update cart set total='"+total+"', quantity='"+quan+"' where email='"+email+"' and pr_id='"+pr_id+"' and address is NULL");
				Mess ms=new Mess("quantity increased" , "success","alert-success",pr_id);
				session.setAttribute("msg", ms);
				resp.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
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
