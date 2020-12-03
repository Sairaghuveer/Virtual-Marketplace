package adminMessage;


//The parameters which have to be fetched from the database are intialised
//This class represents the functionality Admin and User messaging 
public class AdminMessageBean {
	public String user_MSG;
	public String admin_MSG;
	public int message_ID;
	public int user_ID;
	public String getUser_MSG() {
		return user_MSG;
	}
	public void setUser_MSG(String user_MSG) {
		this.user_MSG = user_MSG;
	}
	public String getAdmin_MSG() {
		return admin_MSG;
	}
	public void setAdmin_MSG(String admin_MSG) {
		this.admin_MSG = admin_MSG;
	}
	public int getMessage_ID() {
		return message_ID;
	}
	public void setMessage_ID(int message_ID) {
		this.message_ID = message_ID;
	}
	public int getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(int user_ID) {
		this.user_ID = user_ID;
	}

//This java class is developed to intialize the objects in the class
	public AdminMessageBean(String user_MSG, String admin_MSG, int message_ID, int user_ID) {
		super();
		this.user_MSG = user_MSG;
		this.admin_MSG = admin_MSG;
		this.message_ID = message_ID;
		this.user_ID = user_ID;
	}
	
}
