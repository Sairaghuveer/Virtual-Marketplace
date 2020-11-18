package message;


public class MessageInterfaceBean {
	public String user_Name;
	public String prod_Name;
	public int user_ID;
	public int prod_ID;

	public MessageInterfaceBean(String user_Name, String prod_Name, int user_ID, int prod_ID) {
		super();
		this.user_Name = user_Name;
		this.prod_Name = prod_Name;
		this.user_ID = user_ID;
		this.prod_ID = prod_ID;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getProd_Name() {
		return prod_Name;
	}

	public void setProd_Name(String prod_Name) {
		this.prod_Name = prod_Name;
	}

	public int getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(int user_ID) {
		this.user_ID = user_ID;
	}

	public int getProd_ID() {
		return prod_ID;
	}

	public void setProd_ID(int prod_ID) {
		this.prod_ID = prod_ID;
	}

	
}