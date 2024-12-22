package controller;

import java.io.IOException;
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
 * Servlet implementation class UpdateProfile
 */
@MultipartConfig
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
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

	
	private String uploadImage(int id,Part part,String fname)
	{
		Users ui=DbQuery.getDatabyId(id);
		
		if(ui.getPro_pic()!=null)
		{
			String al_pro_pic=ui.getPro_pic();
			boolean rt=FileHandler.deleteProPic(al_pro_pic);
		}
		
		
		
		String res=FileHandler.addprofile(part,fname);
		if(res!=null)
		{
			return res;
		}
		else
		{
			return null;
		}
		
		
	}
	private boolean uploadData(String fname, String lname, int id, String pass, String city,String pro_pic) {
		Users ue=new Users(id,fname,lname,pass,city,pro_pic);
		boolean re=DbQuery.updatedata(ue);
		return re;
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		HttpSession session=req.getSession();
		int pr_price;
		String fname,lname,pass,city,pic;
		int id;
		fname=req.getParameter("fname");
		lname=req.getParameter("lname");
		id=Integer.parseInt(req.getParameter("id"));
		
		pass=req.getParameter("pass");
		city=req.getParameter("city");
		String al_pro_pic="default.jpg";
		Users ui=DbQuery.getDatabyId(id);
		
		if(ui.getPro_pic()!=null)
		{
				al_pro_pic=ui.getPro_pic();
				System.out.println("thts"+al_pro_pic);
		}
		if(fname.equals("")&&lname.equals("")&&city.equals("")&&pass.equals(""))
		{

			Mess ms=new Mess("fields were empty", "success","alert-danger");
			session.setAttribute("msg", ms);
			resp.sendRedirect("profile.jsp");
		}
		else if(req.getPart("pro_pic").getSubmittedFileName()==null)
		{
			System.out.println("else if part");
		boolean tr=uploadData(fname,lname,id,pass,city,al_pro_pic);	
		if(tr)
		{
			
			Mess ms=new Mess("Profile Updated succesfully", "success","alert-success");
			session.setAttribute("msg", ms);
			try {
				Thread.sleep(3000);
				resp.sendRedirect("profile.jsp");
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
			
		}
		else
		{
			Mess ms=new Mess("Error Updating Profile", "error","alert-danger");
			session.setAttribute("msg", ms);
			try {
				Thread.sleep(3000);
				resp.sendRedirect("profile.jsp");
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
			
		}
		}
		
		else
		{
			Part part=req.getPart("pro_pic");
			String finalfilename=uploadImage(id,part,fname);
			if(finalfilename==null)
			{
				Mess ms=new Mess("Error uploading Profile Picture", "error","alert-danger");
				session.setAttribute("msg", ms);
				try {
					Thread.sleep(3000);
					resp.sendRedirect("profile.jsp");
				} catch (InterruptedException e) {
					
					e.printStackTrace();
				}
			}
			else
			{
				boolean er = uploadData(fname,lname,id,pass,city,finalfilename);
				if(er)
					{
						
						Mess ms=new Mess("Profile Updated succesfully", "success","alert-success");
						session.setAttribute("msg", ms);
						try {
							Thread.sleep(3000);
							resp.sendRedirect("profile.jsp");
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					else
					{
						Mess ms=new Mess("Error Updating Profile", "error","alert-danger");
						session.setAttribute("msg", ms);
						try {
							Thread.sleep(3000);
							resp.sendRedirect("profile.jsp");
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
			}
			
			
			
			
			
			
}

}


}
