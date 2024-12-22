package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.net.URLDecoder;

import dao.DbQuery;
import entities.Books;
import entities.Users;
import helper.FileHandler;
import helper.Mess;

/**
 * Servlet implementation class AddBook
 */
@MultipartConfig
@WebServlet("/AddBook")
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBook() {
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
	private String uploadImage(Part part,String pr_name)
	{
		ServletContext servletContext = getServletContext();
		String path=servletContext.getRealPath(File.separator);
		
		String res=FileHandler.addfile(part,pr_name,path);
		if(res!=null)
		{
			return res;
		}
		else
		{
			return null;
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		HttpSession session=req.getSession();
		int pr_price;
		String pic,pr_name,pr_des,pr_avail,pr_author;	
		pr_name=req.getParameter("pr_name");
		pr_price=Integer.parseInt(req.getParameter("pr_price"));
		pr_des=req.getParameter("pr_des");
		pr_avail=req.getParameter("pr_avai");
		pr_author=req.getParameter("pr_author");
		if(pr_name.equals("")&&pr_price==0&&pr_des.equals("")&&pr_avail.equals(""))
		{
			System.out.println("feilds are empty");
		}
		else if(req.getPart("myfile").getSubmittedFileName()==null)
		{
			
		
			Mess ms=new Mess("Image was not found", "error","alert-danger");
			session.setAttribute("msg", ms);
			try {
				Thread.sleep(3000);
				
				resp.sendRedirect("Admin/addBook.jsp");
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
			
		}
				
		else
		{
			
			Part part=req.getPart("myfile");
			String finalfilename=uploadImage(part,pr_name);
			if(finalfilename==null)
			{
				Mess ms=new Mess("Error uploading Profile Picture", "error","alert-danger");
				session.setAttribute("msg", ms);
				try {
					Thread.sleep(3000);
					resp.sendRedirect("Admin/addBook.jsp");
				} catch (InterruptedException e) {
					
					e.printStackTrace();
				}
			}
			else
			{
				Books bb=new Books(pr_name,pr_price,pr_des,pr_avail,finalfilename,pr_author); 
				boolean re=DbQuery.addbook(bb);
				if(re)
				{

					Mess ms=new Mess("Book Added Successfully", "success","alert-success");
					session.setAttribute("msg", ms);
					try {
						Thread.sleep(3000);
						resp.sendRedirect("Admin/addBook.jsp");
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else
				{
					Mess ms=new Mess("Error Adding Book", "error","alert-danger");
					session.setAttribute("msg", ms);
					try {
						Thread.sleep(3000);
						resp.sendRedirect("Admin/addBook.jsp");
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			}
			
			
	}
}
		

	
	
