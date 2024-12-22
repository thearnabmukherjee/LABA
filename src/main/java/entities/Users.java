package entities;

public class Users {
	private int id;
	private String fname,lname,email,pass,city,pro_pic;
	
	
	
	
	public Users() {
		super();
	}
	public Users(String email, String pass) {
		super();
		this.email = email;
		this.pass = pass;
	}
	public Users(String fname, String lname, String email, String pass, String city) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.pass = pass;
		this.city = city;
	}
	
	
	public Users(int id, String fname, String lname, String pass, String city, String pro_pic) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		
		this.pass = pass;
		this.city = city;
		this.pro_pic = pro_pic;
	}
	
	public Users(int id, String fname, String lname, String email, String pass, String city, String pro_pic) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.pass = pass;
		this.city = city;
		this.pro_pic = pro_pic;
	}
	public String getPro_pic() {
		return pro_pic;
	}
	public void setPro_pic(String pro_pic) {
		this.pro_pic = pro_pic;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	

}
