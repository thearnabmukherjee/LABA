package entities;

public class AdminUser {
	

	private int id;
	private String fname,lname,email,pass,location,pro_pic,auth;
	
	
	
	
	
	
	public AdminUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminUser(String email, String pass) {
		super();
		this.email = email;
		this.pass = pass;
	}
	
	
	public AdminUser(int id, String fname, String lname, String location, String pass, String pro_pic) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.pass = pass;
		this.location = location;
		this.pro_pic = pro_pic;
	}
	public AdminUser(int id, String fname, String lname, String email, String pass, String location, String pro_pic) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.pass = pass;
		this.location = location;
		this.pro_pic = pro_pic;
	}
	public AdminUser(int id, String fname, String lname, String location, String pro_pic, String email, String pass,String auth) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.pass = pass;
		this.location = location;
		this.pro_pic = pro_pic;
		this.auth = auth;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPro_pic() {
		return pro_pic;
	}
	public void setPro_pic(String pro_pic) {
		this.pro_pic = pro_pic;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
	

}
