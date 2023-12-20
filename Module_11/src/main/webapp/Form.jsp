<%-- CSD 430 Module 11 Final Project 												--%>
<%-- Tyler O'Riley 12/19/2023 														--%>
<%-- JSP file to call bean files and execute setter getter inquiries				--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tt" uri="WEB-INF/taglib.tld"%>
<!DOCTYPE html>
<html xmlns = "http://www.w3.org/1999/xhtml" xmlns:h = "http://java.sun.com/jsf/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Module 11 Assignment</title>
    </head>
    <body>
        <h1>Final Fantasy Class Database</h1>
        <div>
            <% 
                if(request.getMethod().equals("POST")){
            %>
            <tt:TableHeaders />
            <jsp:useBean id='myDB' class='beanMod11.DatabaseBean' />


			<%-- Query methods to be called when each button is executed --%>
			
			
            <%
//-----------------------------------Class_Name DB SEARCH QUERY---------------------------------------
                out.println("<h2>Your Selection</h2>");
            
            	java.sql.ResultSet resultSet;
            
            	String class_Name = request.getParameter("Class_Name");
            
            	resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Class_Name = '" + class_Name + "'");
            
	            try{
	                //out.println("<table border='1'>");
	                
	                while(resultSet.next()){
	                	out.println("<tr>");
	                    
	                    for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
	                        out.println("<td>");
	                        out.print((resultSet.getString(i)));
	                        out.println("</td>");
	                    }
	                    
	                    out.println("</tr>");
	                }
	            }
	            catch(Exception e){
	                out.println("<b>No results.</b><br />");
	            }
	            
	            myDB.closeConnection();

//-----------------------------------Class_ID DB SEARCH QUERY---------------------------------------
                
                String class_ID = request.getParameter("Class_ID");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Class_ID = '" + class_ID + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)));
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();

//----------------------------------E_Type DB SEARCH QUERY----------------------------------------
                
                String e_Type = request.getParameter("E_Type");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE E_Type = '" + e_Type + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();

//-----------------------------------Role DB SEARCH QUERY---------------------------------------
                
                String role = request.getParameter("Role");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Role = '" + role + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();
                
//------------------------------------Stance DB SEARCH QUERY--------------------------------------
                
                String stance = request.getParameter("Stance");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Stance = '" + stance + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();

//-----------------------------------Gear DB SEARCH QUERY---------------------------------------
                
                String gear = request.getParameter("Gear");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Gear = '" + gear + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();
                
//------------------------------------Weapon DB SEARCH QUERY--------------------------------------
                
                String weapon = request.getParameter("Weapon");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Weapon = '" + weapon + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();
                
//------------------------------------Base_HP DB SEARCH QUERY--------------------------------------
                
                String base_HP = request.getParameter("Base_HP");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Base_HP = '" + base_HP + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();
                
//------------------------------------Base_MP DB SEARCH QUERY--------------------------------------
                
                String base_MP = request.getParameter("Base_MP");
                
                resultSet = myDB.getResults("SELECT * FROM FF_Classes WHERE Base_MP = '" + base_MP + "'");
                
                try{
                    //out.println("<table border='1'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                    
                    
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                out.println("</table><br /><br />");
                myDB.closeConnection();
            
 			%>
 			<tt:TableHeaders />
 			<%
          
            out.println("<h2>Complete Results</h2>");
 
            resultSet = myDB.getResults("SELECT * FROM FF_Classes");
            
            try{
               // out.println("<table border='1'>");
                
                while(resultSet.next()){
                	out.println("<tr>");
                    
                    for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                        out.println("<td>");
                        out.print((resultSet.getString(i)).trim());
                        out.println("</td>");
                    }
                    
                    out.println("</tr>");
                }
                
                
            }
            catch(Exception e){
                out.println("<b>No results.</b><br />");
            }
            out.println("</table>");
            myDB.closeConnection();
        }
            %>

            <%
                if(request.getMethod().equals("GET")){
            %>
            
            <%-- JSP Buttons containing each search query listed above --%>
            
            <form method='post' action='Form.jsp'>           	
                <input type='text' id='class_Name' name='Class_Name' size='40' maxlength='40'/>
                <input type='submit' value='Search Results by Class_Name'/>&nbsp;&nbsp;&nbsp;
                <label for='stadium'>Search for a Final Fantasy Class by Name</label><br />
                
                <input type='text' id='class_ID' name='Class_ID' size='40' maxlength='2'/>
                <input type='submit' value='Search Results by Class_ID'/>&nbsp;&nbsp;&nbsp;
                <label for='school'>Search for a Final Fantasy Class by ID 00-12</label><br />
                
                <input type='text' id='e_Type' name='E_Type' size='40' maxlength='40'/>
                <input type='submit' value='Search Results by E_Type'/>&nbsp;&nbsp;&nbsp;
                <label for='city'>Search for a Final Fantasy Class by Elemental Type</label><br />
                
                <input type='text' id='role' name='Role' size='40' maxlength='40'/>
                <input type='submit' value='Search Results by Role'/>
                <label for='state'>Search for a Final Fantasy Class by Job Role</label><br />
                
                <input type='text' id='stance' name='Stance' size='40' maxlength='5'/>
                <input type='submit' value='Search Results by Stance'/>&nbsp;&nbsp;&nbsp;
                <label for='yearOpened'>Search for a Final Fantasy Class by Combat Stance</label><br />
                
                <input type='text' id='gear' name='Gear' size='40' maxlength='7'/>
                <input type='submit' value='Search Results by Gear'/>&nbsp;&nbsp;&nbsp;
                <label for='capacity'>Search for a Final Fantasy Class by Gear Type</label><br />
                
                <input type='text' id='weapon' name='Weapon' size='40' maxlength='40'/>
                <input type='submit' value='Search Results by Weapon'/>&nbsp;&nbsp;&nbsp;
                <label for='lgstCrowdOpponent'>Search for a Final Fantasy Class by Weapon Type</label><br /> 
                
                <input type='text' id='base_HP' name='Base_HP' size='40' maxlength='5'/>
                <input type='submit' value='Search Results by Base_HP'/>&nbsp;&nbsp;&nbsp;
                <label for='lgstCrowdYear'>Search for a Final Fantasy Class by Base HP</label><br />
                
                <input type='text' id='base_MP' name='Base_MP' size='40' maxlength='40'/>
                <input type='submit' value='Search Results by Base_MP'/>&nbsp;&nbsp;&nbsp;
                <label for='lgstCrowd'>Search for a Final Fantasy Class by Base MP</label>
            </form>
            <%
            }
            %>
        </div>
        
    </body>
</html>