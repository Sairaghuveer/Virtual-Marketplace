package adminMessage;

//This class is used to intialize the message and message Id which will be retrieved from the database 

public class AdminUser {
	
	public String user_Name;
	public int user_ID;
	
	public String getuser_Name() {
		return user_Name;
	}

	public void setuser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	
	public void setuser_ID(int user_ID) {
		this.user_ID = user_ID;
	}
	
	public int getuser_ID() {
		return user_ID;
	}
	
	public AdminUser(String user_Name, int user_ID) {
 		super();
 		this.user_Name = user_Name;
 		this.user_ID = user_ID;
	}

}
