package adminController;

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

import dao.DbQuery;
import entities.Books;
import entities.Users;
import helper.FileHandler;
import helper.Mess;

/**
 * Servlet implementation class AdminEditBooks
 */
@MultipartConfig
@WebServlet("/AdminEditBooks")
public class AdminEditBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditBooks() {
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
	private String uploadImage(Part part,String pr_name,int id)
	{
		
			Books ui=DbQuery.getBookbyId(id);
			String al_pro_pic;
			ServletContext servletContext = getServletContext();
			String path=servletContext.getRealPath(File.separator);
		if(ui.getPr_pic()!=null)
		{
			al_pro_pic=ui.getPr_pic();
			boolean rt=FileHandler.deletefile(al_pro_pic);
		}
		
		
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		HttpSession session=req.getSession();
		int pr_price,pr_id;
		String pic,pr_name,pr_des,pr_avail,pr_author;	
		pr_id=Integer.parseInt(req.getParameter("pr_id"));
		pr_name=req.getParameter("pr_name");
		pr_price=Integer.parseInt(req.getParameter("pr_price"));
		pr_des=req.getParameter("pr_des");
		pr_avail=req.getParameter("pr_avai");
		pr_author=req.getParameter("pr_author");
		
		String al_pr_pic="default.jpg";
		Books ui=DbQuery.getBookbyId(pr_id);
		
		if(ui.getPr_pic()!=null)
		{
			al_pr_pic=ui.getPr_pic();
				
		}
		if(pr_name.equals("")&&pr_price==0&&pr_des.equals("")&&pr_avail.equals(""))
		{
			System.out.println("feilds are empty");
		}
		else if(req.getPart("myfile").getSubmittedFileName()==null)
		{
			System.out.println("else if part");
			Books yu=new Books(pr_id,pr_name,pr_price,pr_des,pr_avail,al_pr_pic,pr_author);
			boolean tr=DbQuery.updateBooks(yu);
			if(tr)
			{
				Mess ms=new Mess("Book Updated Successfully", "success","alert-success");
				session.setAttribute("msg", ms);
				try {
					Thread.sleep(3000);
					resp.sendRedirect("Admin/EditBook.jsp?pr_id="+pr_id);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
			Mess ms=new Mess("Image was not found", "error","alert-danger");
			session.setAttribute("msg", ms);
			try {
				Thread.sleep(3000);
				resp.sendRedirect("Admin/EditBook.jsp?pr_id="+pr_id);
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
			
		}
				
		else
		{
			Part part=req.getPart("myfile");
			String finalfilename=uploadImage(part,pr_name,pr_id);
			if(finalfilename==null)
			{
				Mess ms=new Mess("Error uploading Book Picture", "error","alert-danger");
				session.setAttribute("msg", ms);
				try {
					Thread.sleep(3000);
					resp.sendRedirect("Admin/EditBook.jsp?pr_id="+pr_id);
				} catch (InterruptedException e) {
					
					e.printStackTrace();
				}
			}
			else
			{
				Books bb=new Books(pr_id,pr_name,pr_price,pr_des,pr_avail,finalfilename,pr_author); 
				boolean re=DbQuery.updateBooks(bb);
				if(re)
				{

					Mess ms=new Mess("Book Updated  Successfully", "success","alert-success");
					session.setAttribute("msg", ms);
					try {
						Thread.sleep(3000);
						resp.sendRedirect("Admin/EditBook.jsp?pr_id="+pr_id);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else
				{
					Mess ms=new Mess("Error Updating Book", "error","alert-danger");
					session.setAttribute("msg", ms);
					try {
						Thread.sleep(3000);
						resp.sendRedirect("Admin/EditBook.jsp?pr_id="+pr_id);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			}
			
			
	}
	}


