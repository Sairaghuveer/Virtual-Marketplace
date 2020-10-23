import java.sql.*;

public class UserData {
	public void data_in(String u_name, String u_pass, String f_name, String l_name, String email, String phone) throws Exception {
		String query = "insert into users(User_Name, User_Pass, First_Name, Last_Name, Gender,Email, Phone_Number) values (?,?,?,?,?,?,?)";
		
		String url = "jdbc:mysql://localhost:3306/virtualmart";
		String uname = "root";
		String pwd = "password";

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,uname,pwd);
		PreparedStatement st = con.prepareStatement(query);
		
		st.setString(1, u_name);
		st.setString(2, u_pass);
		st.setString(3, f_name);
		st.setString(4, l_name);
		st.setString(5, "M");
		st.setString(6, email);
		st.setString(7, phone);
		
		int count = st.executeUpdate();
		
		System.out.println(count+ "row/s affected");
		
		st.close();
		con.close();
	}
	
}
