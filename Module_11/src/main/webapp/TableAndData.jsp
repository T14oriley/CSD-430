<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Module 11 Assignment</title>
    </head>
    <body>
        <%
            java.sql.Connection con = null;
            java.sql.Statement stmt = null;
           
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");		//Database connection and test for existing DB. DB is dropped and recreated if exists
                String url = "jdbc:mysql://localhost:3306/";
                con = java.sql.DriverManager.getConnection(url, "student1", "pass");
                stmt = con.createStatement();
                String dropDB = "DROP DATABASE IF EXISTS FFC";	//DB offical name set to FFC or Final Fantasy Classes
                stmt.executeUpdate(dropDB);
                String createDB = "CREATE DATABASE FFC";
                stmt.executeUpdate(createDB);
                out.println("<b>Database 'FFC' created sucessfully.</b><br />");
            } 
            catch(Exception e) {								//catch clause if DB fails to generate
                out.println("<b>Database not created, an error occurred.</b><br />");
            }
            
            try{                
                Class.forName("com.mysql.cj.jdbc.Driver");		//Test clause to connect to DB. JDBC COnnecter called and tested for error
                String url = "jdbc:mysql://localhost:3306/FFC";
                con = java.sql.DriverManager.getConnection(url, "student1", "pass");             
                stmt = con.createStatement();
            }
            catch(Exception e){
                out.println("<h1>Error connection to database.</h1><br />");
            }
            
            try{												//Test clause for existing primary table FF_Classes with exception clause. Table is created if not found, and dropped if exists
                stmt.executeUpdate("DROP TABLE FF_Classes");
                out.println("<b>Table FF_Classes Dropped</b><br />");
            }
            catch(java.sql.SQLException e){                
                out.println("<b>Table FF_Classes does not exist</b><br />");
            }
            
            try{
                stmt.executeUpdate("CREATE TABLE FF_Classes(Class_Name CHAR(100) NOT NULL, Class_ID CHAR(10) NOT NULL PRIMARY KEY, E_Type CHAR(40) NOT NULL, Role CHAR(40) NOT NULL, Stance CHAR(20) NOT NULL, Gear CHAR(20) NOT NULL, Weapon CHAR (100) NOT NULL, Base_HP CHAR(6) NOT NULL, Base_MP CHAR(6) NOT NULL)");
                out.println("<b>Table FF_Classes Created</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Table FF_Classes Creation failed</b><br />");
            }
            
            try{
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Warrior', '01', 'Physical', 'Tank', 'Melee', 'Plate', 'Two Hand Axe', '1000', '0000')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('White Mage', '02', 'White Magic', 'Healer', 'Magic Ranged', 'Cloth', 'Staff', '0300', '0700')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Black Mage', '03', 'Black Magic', 'DPS', 'Magic Ranged', 'Cloth', 'Staff', '0500', '0600')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Ninja', '04', 'Physical/Ninjutsu', 'DPS', 'Melee', 'Medium', 'Kunai', '0700', '0300')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Dragoon', '05', 'Physical', 'DPS', 'Melee', 'Medium', 'Lance', '0800', '0000')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Red Mage', '06', 'White/Black Magic', 'DPS', 'Magic Ranged', 'Medium', 'Rapier', '0500', '0500')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Dark Knight', '07', 'Physical/Black Magic', 'Tank', 'Melee', 'Plate', 'Two Hand Sword', '1000', '0200')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Paladin', '08', 'Physical/White Magic', 'Tank', 'Melee', 'Plate', 'Sword And Shield', '1000', '0200')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Sage', '09', 'White Magic', 'Healer', 'Magic Ranged', 'Cloth', 'Sage Tools', '0400', '0700')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Bard', '10', 'Physical', 'DPS', 'Physical Ranged', 'Medium', 'Bow/Harp', '0600', '0200')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Machinist', '11', 'Physical', 'DPS', 'Physical Ranged', 'Medium', 'Gun', '0800', '0000')");
                stmt.executeUpdate("INSERT INTO FF_Classes(Class_Name, Class_ID, E_Type, Role, Stance, Gear, Weapon, Base_HP, Base_MP)VALUES('Summoner', '12', 'Black Magic', 'DPS', 'Magic Ranged', 'Cloth', 'Grimoire', '0400', '0700')");
                
                
                
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
        <a href='index.html'>Back to Main Page</a>
        
    </body>
</html>