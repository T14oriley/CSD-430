<%--
CSD430 Tyler O'Riley 12/04/2023 Assignment 8

JSP database JSP to test and generate SQL table data for Final Fantasy spells
 --%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Module 8 Assignment</title>
    </head>
    <body>
        <h1>Sample Final Fantasy Spell List</h1>
        
        <%
            java.sql.Connection con = null;
            java.sql.Statement stmt = null;
           
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/";
                con = java.sql.DriverManager.getConnection(url, "student1", "pass");
                stmt = con.createStatement();
                String dropDB = "DROP DATABASE IF EXISTS aether";
                stmt.executeUpdate(dropDB);
                String createDB = "CREATE DATABASE aether";
                stmt.executeUpdate(createDB);
                out.println("<b>Database 'aether' created sucessfully.</b><br />");
            } 
            catch(Exception e) {
                out.println("<b>Database not created, an error occurred.</b><br />");
            }
            
            try{                
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/aether";
                con = java.sql.DriverManager.getConnection(url, "student1", "pass");             
                stmt = con.createStatement();
            }
            catch(Exception e){
                out.println("<h1>Error connection to database.</h1><br />");
            }
            
            try{
                stmt.executeUpdate("DROP TABLE spell_sheet");
                out.println("<b>Table spell_sheet Dropped</b><br />");
            }
            catch(java.sql.SQLException e){                
                out.println("<b>Table spell_sheet does not exist</b><br />");
            }
            
            try{
                stmt.executeUpdate("CREATE TABLE spell_sheet(mp_cost CHAR(4) NOT NULL PRIMARY KEY, spell_name CHAR(40) NOT NULL, school CHAR(40) NOT NULL)");
                out.println("<b>Table spell_sheet Created</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Table spell_sheet Creation failed</b><br />");
            }
            
            try{
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0800', 'Flare', 'Black Magic')");
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0550', 'Fire IV', 'Black Magic')");
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0350', 'Cure II', 'White Magic')");
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0200', 'Aero', 'Red Magic')");
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0000', 'Xenoglossy', 'Black Magic')");
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0950', 'Holy', 'White Magic')");
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0300', 'Stone', 'White Magic')");
                stmt.executeUpdate("INSERT INTO spell_sheet(mp_cost, spell_name, school)VALUES('0600', 'Blizzard III', 'Black Magic')");
                
                
                stmt.executeUpdate("COMMIT");
                
                out.println("<b>Data Inserted</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Error inserting data</b><br />");
            }
            try{
                stmt.close();
                con.close();
                out.println("<b>Database connections closed</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Connection close failed</b><br />");
            }
        %>
        <br /><br />
        <a href='index.jsp'>Back to Main Page</a>
        
    </body>
</html>