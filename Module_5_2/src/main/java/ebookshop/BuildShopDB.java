//CSD430 Tyler O'Riley 11/21/2023 Assignments 5
//Ebookshop project
//
//Primary structure of this code is used from GITHUB repository owned by user bkncl, URL provided below
//https://github.com/bkyncl/csd-430/tree/main/ebookshop

package ebookshop;

import java.sql.*;

public class BuildShopDB {
    Connection conn = null;		// DB connection variables
    Statement stmt = null;
    
    String url = null;				// DB Credential variables
    String username = "student1";
    String password = "pass";
    
    StringBuilder output = new StringBuilder(); 	// StringBuilder for output variable, which will hold connection status reports
    

    public String getOutput() {
    	return output.toString();
    }
    
    public void createShop() throws SQLException {		//createShop method to create DB in MySQL
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");		//	try statement to attempt connection with DB
        	url = "jdbc:mysql://localhost:3306";
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();
            output.append("Connection Established: " + url).append("<br>");
            
            try {
                output.append("&emsp;").append("Creating Database...").append("<br>");             
                String dropShopDB = "DROP DATABASE IF EXISTS shop";						// variables to store SQL statements
                String createShopDB = "CREATE DATABASE shop";
                
                stmt.executeUpdate(dropShopDB);			//execution methods to apply SQL statements to DB
                stmt.executeUpdate(createShopDB);
                output.append("&emsp;&emsp;").append("Database created: shop").append("<br>");
            } catch (Exception e) {
            	output.append("Error Creating Database").append("<br>");				//catch statements to report if error occurs
            	output.append("Stack Trace: ").append(e.toString()).append("<br>");
            }
                      
        } catch (Exception e) {
            output.append("Connection Failed: ").append(url).append("<br>");
            output.append("Stack Trace: ").append(e.toString()).append("<br>");
            
        } finally {
            try {
                if (stmt != null)				//try and catch statements to close DB and report any errors that occur
                    stmt.close();
                if (conn != null)
                    conn.close();
                output.append("Connection Closed: ").append(url).append("<br><br>");
                
            } catch (Exception e) {
                e.printStackTrace();
                output.append("Error on close").append("<br>");
                output.append("Stack Trace: ").append(e.toString()).append("<br>");
            }
        }
    }
      
    public void populateShop() throws SQLException {		//populateShop method is similar to the above code for DB connection and disconnection
    	try {												//more SQL statements are found here as it creates the table data in MySQL
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		url = "jdbc:mysql://localhost:3306/shop";
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();
            output.append("Connection Established: ").append(url).append("<br>");
            
            try {
                output.append("&emsp;").append("Creating Tables in shop database...").append("<br>");
                
                String createTableCategories = "CREATE TABLE IF NOT EXISTS shop.categories ("
    					+ "category_id int NOT NULL AUTO_INCREMENT,"
    					+ "category_name varchar(70) NOT NULL,"
    					+ "PRIMARY KEY (category_id),"
    					+ "KEY category_id_key (category_id))";
                stmt.executeUpdate(createTableCategories);
                output.append("&emsp;&emsp;").append("Table created: categories").append("<br>");
                
                String createTableBooks = "CREATE TABLE IF NOT EXISTS shop.books ("
    					+ "book_id int NOT NULL AUTO_INCREMENT,"
    					+ "title varchar(70) NOT NULL,"
    					+ "author varchar(70) DEFAULT NULL,"
    					+ "price double NOT NULL,"
    					+ "category_id int NOT NULL,"
    					+ "PRIMARY KEY (book_id),"
    					+ "KEY book_id_key (book_id),"
    					+ "CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES categories (category_id))";
    			stmt.executeUpdate(createTableBooks);
    			output.append("&emsp;&emsp;").append("Table created: books").append("<br>");
    			
                String createTableOrders = "CREATE TABLE IF NOT EXISTS shop.orders ("
    					+ "order_id bigint NOT NULL AUTO_INCREMENT,"
    					+ "delivery_name varchar(70) NOT NULL,"
    					+ "delivery_address varchar(70) NOT NULL,"
    					+ "cc_name varchar(70) NOT NULL,"
    					+ "cc_number varchar(32) NOT NULL,"
    					+ "cc_expiry varchar(20) NOT NULL,"
    					+ "PRIMARY KEY (order_id),"
    					+ "KEY order_id_key (order_id))";
    			stmt.executeUpdate(createTableOrders);
    			output.append("&emsp;&emsp;").append("Table created: orders").append("<br>");
    			
                String createTableOrder_Details = "CREATE TABLE IF NOT EXISTS shop.order_details ("
    					+ "id bigint NOT NULL AUTO_INCREMENT,"
    					+ "book_id int NOT NULL,"
    					+ "title varchar(70) NOT NULL,"
    					+ "author varchar(70) DEFAULT NULL,"
    					+ "quantity int NOT NULL,"
    					+ "price double NOT NULL,"
    					+ "order_id bigint NOT NULL,"
    					+ "PRIMARY KEY (id),"
    					+ "KEY order_details_id_key (id),"
    					+ "CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES books (book_id),"
    					+ "CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES orders (order_id))";
    			stmt.executeUpdate(createTableOrder_Details);
    			output.append("&emsp;&emsp;").append("Table created: order_details").append("<br>");
                
            } catch (Exception e) {
            	output.append("Error Creating Tables").append("<br>");
            	output.append("Stack Trace: ").append(e.toString()).append("<br>");
            }
            
            try {
            	output.append("&emsp;").append("Populating records into shop database...").append("<br>");
                
                String insertCategories = "INSERT INTO categories (category_id, category_name) VALUES "
                	    + "(1, 'Science Fiction'),"
                	    + "(2, 'Fantasy'),"
                	    + "(3, 'Classic')";
                stmt.executeUpdate(insertCategories);
                output.append("&emsp;&emsp;").append("Records inserted into: categories").append("<br>");
                                
                String insertBooks = "INSERT INTO books (book_id, title, author, price, category_id) VALUES "
                	    + "(1, 'War of the Worlds', 'H.G. Wells', '19.99', '1'),"
                	    + "(2, 'Harry Potter and the Half Blood Prince', 'J.K. Rowling', '35.99', '2'),"
                	    + "(3, 'Odyssey', 'Homer', '46.99', '3'),"
                	    + "(4, 'Magyk', 'Angie Sage', '12.99', '2'),"
                	    + "(5, 'Leviathan', 'Scott Westebfield', '13.99', '1'),"
                	    + "(6, 'Iliad', 'Homer', '40.99', '3')";
                stmt.executeUpdate(insertBooks);
                output.append("&emsp;&emsp;").append("Records inserted into: books").append("<br>");
                
            } catch (Exception e) {
            	output.append("Error Populating Records").append("<br>");
            	output.append("Stack Trace: ").append(e.toString()).append("<br>");
            }
 
        } catch (Exception e) {
            e.printStackTrace();
            output.append("Connection Failed: ").append(url).append("<br>");
            output.append("Stack Trace: ").append(e.toString()).append("<br>");
            
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
                output.append("Connection Closed: ").append(url).append("<br>");
                
            } catch (Exception e) {
                e.printStackTrace();
                output.append("Error on close").append("<br>");
                output.append("Stack Trace: ").append(e.toString()).append("<br>");
            }
        }
    }
    
}