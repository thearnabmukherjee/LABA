package helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;

public class FileHandler {
	
	final static String sysPath="D:\\eclipse-workspace\\Laba\\src\\main\\webapp\\Pictures\\";
	
	public static File labaCreateTempFile(String prefix, String suffix,String path) {       
	    File parent = new File(sysPath+path);   

	    File temp = new File(parent, prefix + suffix);

	    if (temp.exists()) {
	        temp.delete();
	    }

	    try {
	        temp.createNewFile();
	    } catch (IOException ex) {
	        ex.printStackTrace();
	    }

	    return temp;
	}
	
	
	public static boolean deleteProPic(String pr_name)
	{
		boolean bb=false;
		
		String path=sysPath+"ProfilePic"+"\\"+pr_name;
//		String path="/usr/java/apache-tomcat-9.0.53/webapps/Laba/Pictures/ProfilePic"+"/"+pr_name;
		try {
			File file=new File(path);
			file.delete();
			bb=true;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return bb;
	}
	
	public static String addprofile(Part part,String name)
	{
			String ss="";
			 String ext="";
			 int min = 1;  
			 int max = 10;  
			int re = (int)(Math.random()*(max-min+1)+min);  
			 
			 
			 String ty=part.getSubmittedFileName();
			int index = ty.lastIndexOf('.');
		    if(index > 0) {
		      ext = ty.substring(index);
		       }
		    
		 
//	File uploads=new File(sysPath+"ProfilePic");
//		File uploads=new File("/usr/java/apache-tomcat-9.0.53/webapps/Laba/Pictures/ProfilePic");
			
		String rename=name+"_"+ re;
		
		
		try {
			File file = labaCreateTempFile(rename,ext,"ProfilePic");
//			
		
		try(InputStream input=part.getInputStream()) {
			 Files.copy(input, file.toPath(),StandardCopyOption.REPLACE_EXISTING);
			 
			 String yyt=file.getName();
			 	ss=yyt;
			
			System.out.println(yyt);
		} catch (Exception e) {
			System.out.println(e);
		}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println(e1);
		}

		return ss;
	}
	
	
	
	
	
	public static String addfile(Part part,String name,String pathr)
	{
			String ss="";
			 String ext="";
			 int min = 1;  
			 int max = 10;  
			int re = (int)(Math.random()*(max-min+1)+min);  
			 
			 
			 String ty=part.getSubmittedFileName();
			int index = ty.lastIndexOf('.');
		    if(index > 0) {
		      ext = ty.substring(index);
		       }
		    
		   //System.out.println("context path "+pathr);
		   
		 String path=sysPath+"booksPic";
//		   String path="/usr/java/apache-tomcat-9.0.53/webapps/Laba/Pictures/booksPic";
		    File uploads=new File(path);
		

		String rename=name+"_"+ re;
		System.out.println(rename);
		
		
		
	   
		
		
		
		
		
		File file;
		try {
		file = labaCreateTempFile(rename,ext,"booksPic");

		
		try(InputStream input=part.getInputStream()) {
			 Files.copy(input, file.toPath(),StandardCopyOption.REPLACE_EXISTING);
			 
			 String yyt=file.getName();
			ss=yyt;
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		} catch (Exception e1) {
			
			e1.printStackTrace();
			System.out.println(e1);
		}
		System.out.println(ss);
		return ss;
	}
	public static boolean deletefile(String pr_name)
	{
		boolean bb=false;
		
		String path=sysPath+"booksPic"+"\\"+pr_name;

		try {
			File file=new File(path);
			file.delete();
			bb=true;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return bb;
	}
	
}
