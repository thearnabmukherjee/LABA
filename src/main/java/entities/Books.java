package entities;

public class Books {
	int id,price;
	String pr_name,pr_des,pr_avil,pr_pic,pr_author;
	
	
	
	public Books() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Books(String pr_name,int price,String pr_des, String pr_avil, String pr_pic,String pr_author) {
		super();
		this.price = price;
		this.pr_name = pr_name;
		this.pr_des = pr_des;
		this.pr_avil = pr_avil;
		this.pr_author = pr_author;
		this.pr_pic = pr_pic;
	}
	
	
	public Books(int id,String pr_name,int price, String pr_des, String pr_avil, String pr_pic, String pr_author) {
		super();
		this.id = id;
		this.price = price;
		this.pr_name = pr_name;
		this.pr_des = pr_des;
		this.pr_avil = pr_avil;
		this.pr_author = pr_author;
		this.pr_pic = pr_pic;
		
	}


	public String getPr_author() {
		return pr_author;
	}


	public void setPr_author(String pr_author) {
		this.pr_author = pr_author;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}
	public String getPr_des() {
		return pr_des;
	}
	public void setPr_des(String pr_des) {
		this.pr_des = pr_des;
	}
	public String getPr_avil() {
		return pr_avil;
	}
	public void setPr_avil(String pr_avil) {
		this.pr_avil = pr_avil;
	}
	public String getPr_pic() {
		return pr_pic;
	}
	public void setPr_pic(String pr_pic) {
		this.pr_pic = pr_pic;
	}
	
	

}
