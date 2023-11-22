<%-- 
  Module 6 Assignment
  Tyler O'Riley
  11/19/2023
  CSD430
  DB connection and creation file for bookstore web page
--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="mod5.sqlDB, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title>JDBC Test</title>
	
	<%-- Internal CSS styling --%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #D9F9F2;
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
        background-color: #F7F5D3; 
	    }
	    
	    tr:nth-child(even) {
	        background-color: #FBFBE8; 
	    }
	    
	    tr:hover {
	        background-color: #EBEEED; 
	    }
    </style>
</head>
<body>
	<%
		sqlDB shop = new sqlDB();
	    
	    try {
	    	shop.createShop();	    	
	    } catch (SQLException e) {
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
	<%= output %>
	
	
	<h2>Shop Database 'books' Table Query Results</h2>
	
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsMeta = null;
		
		String url = application.getInitParameter("db-url");
		String username = application.getInitParameter("db-username");
		String password = application.getInitParameter("db-password");
    
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			out.println("Connection Established: " + url);
			
			rs = stmt.executeQuery("SELECT * FROM books");
			out.println("<br>Displaying all from table: books");
			
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
	
	<h2>Shop Database 'categories' Table Query Results</h2>
	
	<%

    
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
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
	<a href="/mod5/eshop">Continue to Online ebookshop App</a>

</body>
</html>