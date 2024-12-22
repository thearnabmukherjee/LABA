package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import entities.Books;
import entities.Users;

public class DbQuery {

	
		static Connection con;
		static String url="jdbc:mysql://localhost:3306/Laba";
		static String user="root";
		static String pass="root";
		
		public static Connection connect()
		{
			try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,user,pass);
			}
			catch(Exception e)
			{
				System.out.println("error in connecting to server "+e);
			}
			return con;
		}
		public static boolean userSignup(Users uu) {
			
			try
			{
				con=DbQuery.connect();
				PreparedStatement ps;
				String in="insert into users(fname,lname,email,password,city)values(?,?,?,?,?)";
				ps=con.prepareStatement(in);
				ps.setString(1,uu.getFname());
				ps.setString(2,uu.getLname());
				ps.setString(3,uu.getEmail());
				ps.setString(4,uu.getPass());
				ps.setString(5,uu.getCity());
				ps.executeUpdate();
				
				return true;
				
			}catch(Exception e)
			{
				return false;
			}
		}
		public static boolean updatedata(Users iu)
		{
			boolean ytu=false;
			try
			{
				con=DbQuery.connect();
//				Statement stm=con.createStatement();
//				String in="update users set fname='"+iu.getFname()+"',lname='"+iu.getLname()+"',password='"+iu.getPass()+"',city='"+iu.getCity()+"',profile_pic='"+iu.getPro_pic()+"'  where id='"+iu.getId()+"'";
//				stm.executeUpdate(in);
//				ytu=true;
				PreparedStatement ps;
				String up="update users set fname=?,lname=?,password=?,city=?,profile_pic=? where id=?";
				ps=con.prepareStatement(up);
				ps.setString(1,iu.getFname());
				ps.setString(2,iu.getLname());
				ps.setString(3,iu.getPass());
				ps.setString(4,iu.getCity());
				ps.setString(5,iu.getPro_pic());
				ps.setInt(6,iu.getId());
				ps.executeUpdate();
				ytu=true;
				
				
			}
			catch(Exception e)
			{
				
				System.out.println(e);
			}
			return ytu;

		}
		public static boolean userLogin(Users lu)
		{
			try
			{
				con=DbQuery.connect();
				Statement stmt = con.createStatement(); 
				String in="select * from users where email='"+lu.getEmail()+"' and password='"+lu.getPass()+"'";
				ResultSet rs=stmt.executeQuery(in);
				if(rs.next())
				{
					return true;
				}
				else
				{
					return false;
				}
				
			}
			catch(Exception e)
			{
				
				return false;
			}
			
		
		}
		public static Users getData(Users lu)
		{
			Users uue=new Users();
			try
			{
				con=DbQuery.connect();
				Statement stmt = con.createStatement(); 
				String in="select * from users where email='"+lu.getEmail()+"' and password='"+lu.getPass()+"'";
				ResultSet rs=stmt.executeQuery(in);
				if(rs.next())
				{
					
					 uue=new Users(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
					return uue;
				}
				else
				{
					return uue;
				}
				
				
			}
			catch(Exception e)
			{
				
				return uue;
			}
			
		
		}
		public static Users getDatabyId(int id)
		{
			Users uue=new Users();
			try
			{
				con=DbQuery.connect();
				Statement stmt = con.createStatement(); 
				String in="select * from users where id='"+id+"'";
				ResultSet rs=stmt.executeQuery(in);
				if(rs.next())
				{
					
					 uue=new Users(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
					return uue;
				}
				else
				{
					return uue;
				}
				
				
			}
			catch(Exception e)
			{
				
				return uue;
			}
			
		
		}
		
		public static boolean addbook(Books bk)
		{
			boolean f=false;
			try {
				con=DbQuery.connect();
				PreparedStatement ps;
				String in="insert into books(pr_name,pr_price,pr_des,pr_avil,pr_pic,pr_author)values(?,?,?,?,?,?)";
				ps=con.prepareStatement(in);
				ps.setString(1, bk.getPr_name());
				ps.setInt(2, bk.getPrice());
				ps.setString(3, bk.getPr_des());
				ps.setString(4, bk.getPr_avil());
				ps.setString(5, bk.getPr_pic());
				ps.setString(6, bk.getPr_author());
				ps.executeUpdate();
				
				f=true;
			} catch (Exception e) {
				// TODO: handle exception
			}
			return f;
		}
		
		public static Books getBookbyId(int id)
		{
			
			Books ye=new Books();
				try
				{
					con=DbQuery.connect();
					Statement stmt = con.createStatement(); 
					String in="select * from books where id='"+id+"'";
					ResultSet rs=stmt.executeQuery(in);
					if(rs.next())
					{
						
						 ye=new Books(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
						
					}
										
					
				}
				catch(Exception e)
				{
					
					System.out.println("error in getting book by id ");
				}
			return ye;
				
		}
		
		
		public static boolean updateBooks(Books ui)
		{
			boolean iu=false;
			try
			{
				con=DbQuery.connect();
				PreparedStatement ps;
				String up="update books set pr_name=?,pr_price=?,pr_des=?,pr_avil=?,pr_pic=?,pr_author=? where id=?";
				ps=con.prepareStatement(up);
				ps.setString(1,ui.getPr_name());
				ps.setInt(2,ui.getPrice());
				ps.setString(3,ui.getPr_des());
				ps.setString(4,ui.getPr_avil());
				ps.setString(5,ui.getPr_pic());
				ps.setString(6,ui.getPr_author());
				ps.setInt(7,ui.getId());
				
				ps.executeUpdate();
				iu=true;
				
				
			}
			catch(Exception e)
			{
				
				System.out.println(e);
			}
			
			return iu;
		}
		
		
		public static List<Books> getbooks() {
			List<Books> list=new ArrayList<Books>();
			try
			{
				con=DbQuery.connect();
				Statement stmt = con.createStatement(); 
				String in="select * from books";
				ResultSet rs=stmt.executeQuery(in);
				while(rs.next())
				{
					Books ee=new Books(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
					list.add(ee);
					
				}
				
				
			}
			catch(Exception e)
			{
				
				System.out.println("error getting data in list");
			}
			return list;
			}
		}

