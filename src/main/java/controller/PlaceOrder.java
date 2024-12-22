package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.DbQuery;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
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
		
		String fname,lname,email,phone,address;
		int id;
		
		fname=req.getParameter("fname");
		lname=req.getParameter("lname");
		id=Integer.parseInt(req.getParameter("id"));
		address=req.getParameter("location");
		phone=req.getParameter("phone");
		HttpSession session=req.getSession();
		String status="placed";
				
				try {
					if(session.getAttribute("email")==null)
				 	{
				 	resp.sendRedirect("AddDetailstoOrder.jsp");
				 	}
				 else
				 {
				 	 
					email=session.getAttribute("email").toString();
					
					Connection con=DbQuery.connect();
					PreparedStatement ps=con.prepareStatement("update users set fname=?,lname=?,phone=? where id=?");
					ps.setString(1, fname);
					ps.setString(2, lname);
					ps.setString(3, phone);
					ps.setInt(4, id);
					ps.executeUpdate();
					
					String iu="update cart  set address=?,status=?,mobile=?,orderdate=now() where email=? and address is null";
					PreparedStatement ps1=con.prepareStatement(iu);
					ps1.setString(1,address);
					ps1.setString(2,status);
					ps1.setString(3, phone);
					ps1.setString(4,email);
					ps1.executeUpdate();
					
					resp.sendRedirect("confirmOrder.jsp");
				 }
				} catch (Exception e) {
					System.out.println(e);
				}
		
	}

}
