package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class AddtoCart
 */
@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddtoCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		int pr_id=Integer.parseInt(req.getParameter("pr_id"));
		if(session.getAttribute("email")==null)
		{
			resp.sendRedirect("login.jsp?link=adcart&id="+pr_id);
		}
		else
		{
			
		
		String email=session.getAttribute("email").toString();
		
		int quan=1;
		int pro_price=0;
		int pro_total=0;
		int cart_total=0;
		
		int z=0;
		try {
			Connection con=DbQuery.connect();
			Statement stm=con.createStatement();
			String in="select * from books where id="+pr_id;
			ResultSet rs=stm.executeQuery(in);
			while(rs.next())
			{
				pro_price=rs.getInt(3);
				pro_total=pro_price;
			}
			String in1="select * from cart where pr_id='"+pr_id+"' and email='"+email+"' and address is NULL";
			ResultSet rs1=stm.executeQuery(in1);
			while(rs1.next())
			{
				cart_total=rs1.getInt(5);
				cart_total=cart_total+pro_total;
				quan=rs1.getInt(3);
				quan=quan+1;
				z=1;
			}
			
			if(z==1)
			{
				stm.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quan+"' where pr_id='"+pr_id+"' and email='"+email+"' and address is NULL");
				
				Mess ms=new Mess(""+quan+" Book added to cart" , "success","alert-success",pr_id);
				session.setAttribute("msg", ms);
				
				resp.sendRedirect("BooksIndex.jsp");
			}
			else
			{
				PreparedStatement ps=con.prepareStatement("insert into cart(email,pr_id,quantity,price,total) values(?,?,?,?,?)");
				ps.setString(1, email);
				ps.setInt(2, pr_id);
				ps.setInt(3, quan);
				ps.setInt(4, pro_price);
				ps.setInt(5, pro_total );
				ps.executeUpdate();
				Mess ms=new Mess("Book added to cart" , "success","alert-success",pr_id);
				session.setAttribute("msg", ms);
				resp.sendRedirect("BooksIndex.jsp");
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
			Mess ms=new Mess("error adding to cart" , "invalid","alert-danger",pr_id);
			session.setAttribute("msg", ms);
			resp.sendRedirect("BooksIndex.jsp");
		}
		}
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

}
}