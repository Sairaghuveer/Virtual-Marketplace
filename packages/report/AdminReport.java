package report;



/*
 * this class is to intialize all the parameters in the users_report table
 */
public class AdminReport {
	public String user_Name;
	public String prod_Name;
	public String reporter_Name;
	public String user_Msg;
	public int prod_ID;
	
	public String getUser_Name() {
		return user_Name;
	}
	public int getProd_ID() {
		return prod_ID;
	}
	public void setProd_ID(int prod_ID) {
		this.prod_ID = prod_ID;
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
	public String getReporter_Name() {
		return reporter_Name;
	}
	public void setReporter_Name(String reporter_Name) {
		this.reporter_Name = reporter_Name;
	}
	public String getUser_Msg() {
		return user_Msg;
	}
	public void setUser_Msg(String user_Msg) {
		this.user_Msg = user_Msg;
	}
	public AdminReport(String user_Name, String prod_Name, String reporter_Name, String user_Msg, int prod_ID) {
		super();
		this.user_Name = user_Name;
		this.prod_Name = prod_Name;
		this.reporter_Name = reporter_Name;
		this.user_Msg = user_Msg;
		this.prod_ID = prod_ID;
	}
	
	

}
