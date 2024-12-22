package helper;

public class Mess {

	String msg,type,cl;
	int id;

	public Mess(String msg, String type,String cl) {
		super();
		this.msg = msg;
		this.type = type;
		this.cl = cl;
	
	}
	

	public Mess(String msg, String type, String cl, int id) {
		super();
		this.msg = msg;
		this.type = type;
		this.cl = cl;
		this.id = id;
	}




	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getCl() {
		return cl;
	}

	public void setCl(String cl) {
		this.cl = cl;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
