package helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connections {
	private static Connection con;
public static Connection getcon() {
	try {
		if(con==null) {
			Class.forName("com.mysql.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qmsproject","root", "");
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return con;
	
}

}
