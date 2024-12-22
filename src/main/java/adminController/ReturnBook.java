package adminController;

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
 * Servlet implementation class IssueBook
 */
@WebServlet("/ReturnBook")
public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		if(req.getParameter("cart_id").equals(null))
		{
		resp.sendRedirect("/laba/Admin/IssuedBooks.jsp");
		}
		else
		{
			String cart_id=req.getParameter("cart_id");
			
			try {
				Connection con=DbQuery.connect();
			  	Statement stm=con.createStatement();
			  	int res =stm.executeUpdate("update cart set status='Returned',returndate=now() where cart_id='"+cart_id+"'");
			  	if(res==-1)
			  	{
			  		Mess ms=new Mess("error issueing book " , "danger","alert-warning");
					session.setAttribute("msg", ms);
					
					resp.sendRedirect("/Laba/Admin/ReturnOrder.jsp?cart_id="+cart_id);
			  	}
			  	else
			  	{
			  		resp.sendRedirect("/Laba/Admin/ConfirmReturnBook.jsp");
			  	}
			  	
			}catch (Exception e) {
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
