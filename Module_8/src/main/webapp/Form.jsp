<%--
CSD430 Tyler O'Riley 12/04/2023 Assignment 8

JSP form page for search inquiries for spell tables
 --%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Module 8 Assignment</title>
    </head>
    <body>
        <h1>Final Fantasy Spell Sample</h1>
        <div>
            <% 
                if(request.getMethod().equals("POST")){
            %>
            <jsp:useBean id='myDB' class='databaseBean.DBSQLBean' />

            <%
	            out.println("<table border='1'>");
            	out.println("<tr>");
	            out.println("<th>MP Cost</th>");
	            out.println("<th>Spell Name</th>");
	            out.println("<th>School of Magic</th>");
	            out.println("</tr>");
	            out.println("</table>");
	            
            	java.sql.ResultSet resultSet;
            
            	String mp = request.getParameter("mp_cost");
            
            	resultSet = myDB.getResults("SELECT * FROM spell_sheet WHERE mp_cost = '" + mp + "'");
            
	            try{
	                out.println("<table border='1' bgcolor='d3d3d3'>");
	                
	                while(resultSet.next()){
	                	out.println("<tr>");
	                    
	                    for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
	                        out.println("<td>");
	                        out.print((resultSet.getString(i)));
	                        out.println("</td>");
	                    }
	                    
	                    out.println("</tr>");
	                }
	                
	                out.println("</table>");
	            }
	            catch(Exception e){
	                out.println("<b>No results.</b><br />");
	            }
	            
	            myDB.closeConnection();

//--------------------------------------------------------------------------
                
                String spName = request.getParameter("spell_name");
                
                resultSet = myDB.getResults("SELECT * FROM spell_sheet WHERE spell_name = '" + spName + "'");
                
                try{
                    out.println("<table border='1' bgcolor='00ac00'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)));
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                    
                    out.println("</table>");
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();

//--------------------------------------------------------------------------
                
                String schl = request.getParameter("school");
                
                resultSet = myDB.getResults("SELECT * FROM spell_sheet WHERE school = '" + schl + "'");
                
                try{
                    out.println("<table border='1' bgcolor='D40000'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                    
                    out.println("</table>");
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();

//--------------------------------------------------------------------------

                out.println("<h2>Complete Results</h2>");
                
                resultSet = myDB.getResults("SELECT * FROM spell_sheet");
                
                try{
                    out.println("<table border='1' bgcolor='ADD8E6'>");
                    out.println("<tr>");
                    out.println("<th>MP Cost</th>");
                    out.println("<th>Spell Name</th>");
                    out.println("<th>School of Magic</th>");
                    out.println("</tr>");
                    
                    while(resultSet.next()){
                        out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                    
                    out.println("</table>");
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();
            }
            %>

            <%
                if(request.getMethod().equals("GET")){
            %>
            
            <form method='post' action='Form.jsp'>
            	<label for='mp'>Search Spells By MP Cost</label>&nbsp;&nbsp;&nbsp;
                <input type='text' id='mp' name='mp_cost' size='5' maxlength='5'/>
                <input type='submit' value='Search'/><br />
                <label for='spName'>Search for Spells By Name</label>&nbsp;&nbsp;&nbsp;
                <input type='text' id='spName' name='spell_name' size='40' maxlength='40'/>
                <input type='submit' value='Search'/><br />
                <label for='schl'>Search Spells By School Of Magic</label>&nbsp;&nbsp;&nbsp;
                <input type='text' id='schl' name='school' size='40' maxlength='40'/>
                <input type='submit' value='Search'/>
            </form>
            <%
            }
            %>
        </div>
        
    </body>
</html>