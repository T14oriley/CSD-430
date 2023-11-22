package mod5;

/*
 * Module 6 Assignment
 * Tyler O'Riley
 * 11/19/2023
 * CSD430
 * DB connection and creation file for bookstore web page
 */

import java.sql.*;

public class sqlDB {
    Connection conn = null;		//variable assignment for SQL DB connection "conn"
    Statement stmt = null;		//variable for SQL statement holder "stmt"
    
    String url = null;				//DB credentials, you have user = student1 as your current DB and password = pass
    String username = "student1";
    String password = "pass";
    
    StringBuilder dbUpdate = new StringBuilder(); //StringBuilder is a method to assist in storing generated outputs
    public String getOutput() {
    	return dbUpdate.toString();
    }
    
    public void createShop() throws SQLException {		//createShop is our primary method to create the DB and its contents
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");	//calls built in function for JDBC connector
        	url = "jdbc:mysql://localhost:3306";		//sets url to your local host code of 3306
            conn = DriverManager.getConnection(url, username, password);	//attempts database connection
            stmt = conn.createStatement();				//once connection is created, stmt is set to be able to send SQL command to the DB
            dbUpdate.append("Connection Successful With Root: " + url + "<br>");
            
            try {
            	dbUpdate.append("Creating Database");             
                String dropDB = "DROP DATABASE IF EXISTS shop";		//sql statements to drop and create DB
                String creatDB = "CREATE DATABASE shop";
                
                stmt.executeUpdate(dropDB);
                stmt.executeUpdate(creatDB);
                
                dbUpdate.append("Database Creation Successful");	//success response if above two sql statements run
            } catch (Exception e) {
            	dbUpdate.append("Error Creating Database");
            	dbUpdate.append("Stack Trace: ").append(e.toString());	//e is the exception string to be displayed for the error
            }
                      
        } catch (Exception e) {
        	dbUpdate.append("Connection Failed: ").append(url);		//error statement if DB fails to establish connection with JDBC
        	dbUpdate.append("Stack Trace: ").append(e.toString());
            
        } finally {
            try {
                if (stmt != null)	//attempts to close connections to DB and JDBC after tables create successfully
                    stmt.close();
                if (conn != null)
                    conn.close();
                dbUpdate.append("Connection Successfully Closed").append(url);
                
            } catch (Exception e) {
                e.printStackTrace();
                dbUpdate.append("Error Detected During Close");
                dbUpdate.append("Stack Trace: ").append(e.toString());
            }
        }
    }
    
    
    
    public void populateShop() throws SQLException {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");		//DB and JDBC connection re-established
    		url = "jdbc:mysql://localhost:3306/shop";
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();
            dbUpdate.append("Connection Successful With Root: ").append(url);
            
            try {
            	dbUpdate.append("Creating Table Data In New DB");		//display message that table data is being generated
                														//String holders are created for each table and execution attempted with stmt.executeUpdate
                // creating table named categories
                String createTableCategories = "CREATE TABLE IF NOT EXISTS shop.categories ("
    					+ "category_id int NOT NULL AUTO_INCREMENT,"
    					+ "category_name varchar(50) NOT NULL,"
    					+ "PRIMARY KEY (category_id),"
    					+ "KEY category_id_key (category_id))";
                stmt.executeUpdate(createTableCategories);
                dbUpdate.append("Table created: categories");
                
                // creating table named books
                String createTableBooks = "CREATE TABLE IF NOT EXISTS shop.books ("
    					+ "book_id int NOT NULL AUTO_INCREMENT,"
    					+ "title varchar(50) NOT NULL,"
    					+ "author varchar(50) DEFAULT NULL,"
    					+ "price double NOT NULL,"
    					+ "category_id int NOT NULL,"
    					+ "PRIMARY KEY (book_id),"
    					+ "KEY book_id_key (book_id),"
    					+ "CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES categories (category_id))";
    			stmt.executeUpdate(createTableBooks);
    			dbUpdate.append("Table created: books");
    			
    			// creating table named orders
                String createTableOrders = "CREATE TABLE IF NOT EXISTS shop.orders ("
    					+ "order_id bigint NOT NULL AUTO_INCREMENT,"
    					+ "delivery_name varchar(50) NOT NULL,"
    					+ "delivery_address varchar(50) NOT NULL,"
    					+ "cc_name varchar(50) NOT NULL,"
    					+ "cc_number varchar(32) NOT NULL,"
    					+ "cc_expiry varchar(20) NOT NULL,"
    					+ "PRIMARY KEY (order_id),"
    					+ "KEY order_id_key (order_id))";
    			stmt.executeUpdate(createTableOrders);
    			dbUpdate.append("Table created: orders");
    			
    			// creating table named order_details
                String createTableOrder_Details = "CREATE TABLE IF NOT EXISTS shop.order_details ("
    					+ "id bigint NOT NULL AUTO_INCREMENT,"
    					+ "book_id int NOT NULL,"
    					+ "title varchar(50) NOT NULL,"
    					+ "author varchar(50) DEFAULT NULL,"
    					+ "quantity int NOT NULL,"
    					+ "price double NOT NULL,"
    					+ "order_id bigint NOT NULL,"
    					+ "PRIMARY KEY (id),"
    					+ "KEY order_details_id_key (id),"
    					+ "CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES books (book_id),"
    					+ "CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES orders (order_id))";
    			stmt.executeUpdate(createTableOrder_Details);
    			dbUpdate.append("Table created: order_details");
                
            } catch (Exception e) {								//catch clause if any tables fail to create
            	dbUpdate.append("Error During Table Creation");
            	dbUpdate.append("Stack Trace: ").append(e.toString());
            }
            
            try {
            	dbUpdate.append("Creating Record Data For DB");
                
                // insert records into categories table 
                String insertCategories = "INSERT INTO categories (category_id, category_name) VALUES "
                	    + "(1, 'Science Fiction'),"
                	    + "(2, 'Fantasy'),"
                	    + "(3, 'Classic')";
                stmt.executeUpdate(insertCategories);
                dbUpdate.append("Records inserted into: categories");
                
                // insert records into books table                
                String insertBooks = "INSERT INTO books (book_id, title, author, price, category_id) VALUES "
                	    + "(1, 'War of the Worlds', 'H.G. Wells', '19.99', '1'),"
                	    + "(2, 'Harry Potter and the Half Blood Prince', 'J.K. Rowling', '35.99', '2'),"
                	    + "(3, 'Odyssey', 'Homer', '46.99', '3'),"
                	    + "(4, 'Magyk', 'Angie Sage', '12.99', '2'),"
                	    + "(5, 'Leviathan', 'Scott Westebfield', '13.99', '1'),"
                	    + "(6, 'Iliad', 'Homer', '40.99', '3')";
                stmt.executeUpdate(insertBooks);
                dbUpdate.append("Records inserted into: books");
                
            } catch (Exception e) {
            	dbUpdate.append("Error Populating Records");
            	dbUpdate.append("Stack Trace: ").append(e.toString());
            }
 
        } catch (Exception e) {
            e.printStackTrace();
            dbUpdate.append("Connection Failed: ").append(url);
            dbUpdate.append("Stack Trace: ").append(e.toString());
            
        } finally {
            try {
            	// close all resources of db connection
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
                dbUpdate.append("Connection Closed: ").append(url);
                
            } catch (Exception e) {
                e.printStackTrace();
                dbUpdate.append("Error on close").append("<br>");
                dbUpdate.append("Stack Trace: ").append(e.toString());
            }
        }
    }
    
}