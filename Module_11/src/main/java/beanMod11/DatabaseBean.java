//CSD 430 Module 11 Final Project
//Tyler O'Riley
//Java bean to establish DB connection

package beanMod11;

public class DatabaseBean implements java.io.Serializable {
	java.sql.Connection con = null;
	java.sql.Statement stmt = null;
	java.sql.ResultSet resultSet = null;
	public DatabaseBean() {
	}
	
	public java.sql.ResultSet getResults(String SQL) throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/FFC";
			con = java.sql.DriverManager.getConnection(url, "student1", "pass");
			stmt = con.createStatement();
		}
		catch(java.sql.SQLException e) {
		}

		try {
			resultSet = stmt.executeQuery(SQL);
		}
		catch(java.sql.SQLException e) {
		}
		return resultSet;
	}
	
	public void closeConnection() {
		try {
			stmt.close();
			con.close();
		}
		catch(java.sql.SQLException e) {
		}
	}
}