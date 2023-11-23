<%--
CSD430 Tyler O'Riley 11/21/2023 Assignments 5
Ebookshop project

Primary structure of this code is used from GITHUB repository owned by user bkncl, URL provided below
https://github.com/bkyncl/csd-430/tree/main/ebookshop
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="ebookshop.BuildShopDB, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title>JDBC Test</title>
												<%-- CSS code to set styling for page and tables --%>
    <style>										
        body {
            font-family: Arial, sans-serif;
            background-color: #85c3ed;
            margin: 0;
            padding: 0px 20px 20px 20px;
        }        
        h2 {
            color: #130439;
            text-transform: uppercase;
            text-decoration: underline;

        }       
        table {
            width: 100%;
            border-collapse: collapse;
            border: 3px solid #130439;
            margin: 10px 0px;
        }    
        td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        tr {
        background-color: #cc8a58; /* Set the table rows fill color */
	    }
	    																	
	    tr:nth-child(even) {
	        background-color: #e6a777; /* Set the even rows fill color */
	    }
	    
	    tr:hover {
	        background-color: #EBEEED; /* Set the hover fill color */
	    }
    </style>
    											<%-- CSS :nth-child(even) this script selects the even rows within a table for different colors --%>
</head>
<body>
	<%
		BuildShopDB shop = new BuildShopDB();	//BuildShopDB has been imported. the shop variable stores the java class to call its methods
	    
	    try {
	    	shop.createShop();	    			// shop.createShop run the method createShop from the BuildShopDB.java
	    } catch (SQLException e) {				// The following try catches attempt to establish connect and create DB and tables within MySQL
	    	out.println("<br>Error");
			out.println("<br>Stack Trace: " + e.toString() + "<br>");
	    }
	    
	    try {
	    	shop.populateShop();	    	
	    } catch (SQLException e) {
	    	out.println("<br>Error");
			out.println("<br>Stack Trace: " + e.toString() + "<br>");
	    }
	    
	    String output = shop.getOutput();
	%>
	
	<h2>Shop Database Initialization and Record Insertion</h2>
	<%-- output is called from connected file BuildShopDB.java to display status message --%>
	<%= output %>
	

	<h2>Shop Database 'books' Table Query Results</h2>
	<%
		Connection conn = null;			//database connection variables
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsMeta = null;
		
		String url = application.getInitParameter("db-url");			// database connection parameters as defined in web.xml
		String username = application.getInitParameter("db-username");
		String password = application.getInitParameter("db-password");
    
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");					// database connection is attempted using connection variables
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			out.println("Connection Established: " + url);
			
			rs = stmt.executeQuery("SELECT * FROM books");				// request query to bring table data to web table
			out.println("<br>Displaying all from table: books");
			
			%><table border="1"><%
			rsMeta = rs.getMetaData();
			int nCols = rsMeta.getColumnCount();						// for and while statement to populate web table with SQL DB data
			%><tr><%
			for (int kCol = 1; kCol <= nCols; kCol++) {
				out.print("<td><b>" + rsMeta.getColumnName(kCol) + "</b></td>");
			}
			%></tr><%
			while (rs.next()) {
				%><tr><%
				for (int kCol = 1; kCol <= nCols; kCol++) {
					out.print("<td>" + rs.getString(kCol) + "</td>");
				}
				%></tr><%
			}
			%></table><%
		} catch (Exception e) {
			out.println("<br>Error");
			out.println("<br>Stack Trace: " + e.toString() + "<br>");
		} finally {
			try {														// try statement to close connections with MySQL DB
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
				out.println("Connection closed: " + url);
			} catch (Exception e) {
				out.println("<br>Error on close");
				out.println("<br>Stack Trace: " + e.toString() + "<br>");
			}
		}
	%>
	
	<h2>Shop Database 'categories' Table Query Results</h2>
	
	<%

    
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");					// Same scripts as above, this time to populate the book categories
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			out.println("Connection Established: " + url);
			
			rs = stmt.executeQuery("SELECT * FROM categories");
			out.println("<br>Displaying all from table: categories");
			
			%><table border="1"><%
			rsMeta = rs.getMetaData();
			int nCols = rsMeta.getColumnCount();
			%><tr><%
			for (int kCol = 1; kCol <= nCols; kCol++) {
				out.print("<td><b>" + rsMeta.getColumnName(kCol) + "</b></td>");
			}
			%></tr><%
			while (rs.next()) {
				%><tr><%
				for (int kCol = 1; kCol <= nCols; kCol++) {
					out.print("<td>" + rs.getString(kCol) + "</td>");
				}
				%></tr><%
			}
			%></table><%
		} catch (Exception e) {
			out.println("<br>Error");
			out.println("<br>Stack Trace: " + e.toString() + "<br>");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
				out.println("Connection closed: " + url);
			} catch (Exception e) {
				out.println("<br>Error on close");
				out.println("<br>Stack Trace: " + e.toString() + "<br>");
			}
		}
	%>
	
	<br>
	<a href="/ebookshop/eshop">Continue to Online ebookshop App</a>

</body>
</html>