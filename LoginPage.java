import java.util.*;
//import java.sql.*;

public class LoginPage {

	public static void main(String[] args) throws Exception {
		String u_name, u_pass, f_name, l_name, email, phone;
		Boolean submit=false;
		System.out.println("Enter inputs");
		Scanner input = new Scanner(System.in);
		again: while(submit==false) {
		u_name = input.next();
		u_pass = input.next();
		f_name = input.next();
		l_name = input.next();
		email = input.next();
		phone = input.next();
		
		for(int i=0; i < phone.length(); i++) {
	         Boolean flag = Character.isDigit(phone.charAt(i));
	         if((flag==false) || (phone.length()!=10)) {
	        	 	System.out.println("Enter a valid number");
	        	 	continue again;
	         }
	         else continue;

	         
		}
		
	 	UserData obj = new UserData(); 
	 	obj.data_in(u_name, u_pass, f_name, l_name, email, phone);
	 	submit=true;
		input.close();
		
		System.out.println(u_name);

	}

}}
