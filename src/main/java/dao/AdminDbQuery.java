package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entities.AdminUser;
import entities.Books;
import entities.Users;

public class AdminDbQuery {

	
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

		public static AdminUser userLogin(AdminUser lu)
		{
			AdminUser ti=new AdminUser();
			boolean rt=false;
			try
			{
				con=DbQuery.connect();
				Statement stmt = con.createStatement(); 
				String in="select * from adminUsers where email='"+lu.getEmail()+"' and password='"+lu.getPass()+"'";
				ResultSet rs=stmt.executeQuery(in);
				while(rs.next())
				{
					
					ti=new AdminUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
				}
				
				
			}
			catch(Exception e)
			{
				
				System.out.println("error in login ");
			}
			
		return ti;
		}
		
		
		public static boolean updatedata(AdminUser iu)
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
				String up="update adminUsers set fname=?,lname=?,password=?,location=?,profile_pic=? where id=?";
				ps=con.prepareStatement(up);
				ps.setString(1,iu.getFname());
				ps.setString(2,iu.getLname());
				ps.setString(3,iu.getPass());
				ps.setString(4,iu.getLocation());
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
		public static AdminUser getDatabyId(int id)
		{
			AdminUser uue=new AdminUser();
			try
			{
				con=DbQuery.connect();
				Statement stmt = con.createStatement(); 
				String in="select * from adminUsers where id='"+id+"'";
				ResultSet rs=stmt.executeQuery(in);
				if(rs.next())
				{
					
					 uue=new AdminUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
					return uue;
				}
	
			}
			catch(Exception e)
			{
				
				System.out.println(e);
			}
			return uue;
		
		}
}
