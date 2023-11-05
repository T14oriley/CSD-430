<%--
CSD430
Tyler O'Riley, Module 3 Assignment, 11/05/2023
Basic JSP functions with scripplet practice
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Module 3 JSP32</title>
</head>
<body>
	<h2>JSP File Navigation</h2>
	<hr>
	<ul>
		<li><a href="orileyJSP_31.jsp">JSP_31</a></li>
		<li><a href="orileyJSP_32.jsp">JSP_32</a></li>
	</ul>
	<hr>
	<h3>Array Generation Using Strings</h3>
	<%
		String[] FF14Array = {"Black Mage", "White Mage", "Gun Breaker", "Sage", "Dragoon", "Blue Mage", "Red Mage", "Warrior", "Paladin", "Dancer", "Samurai"};
	
		out.println("The classes for Final Fantasy 14 include: {");		//String[] array for FF14 classes to be displayed through for loop
		for (String word:FF14Array) {
			out.print(word + ", ");
		}
		out.println("}");
	%>
	<br>
	<br>
	
	<table border="1">
		<tr>
			<th colspan="2">Roles Of FF14</th>	<%--Same details as JSP31 pertaining to how and why this table is structured the way it is --%>
		</tr>
		<tr>
			<th>Classes</th>
			<th>Role</th>
		</tr>
		<% 	
			int index = 0;
			for (String word:FF14Array) { 
		%>
        <tr>
      		<td>Class: <%= index %></td>
      		<td><%= word %></td>
        </tr>
		<% 	
			index++;
			} 
		%>
	</table>
</body>
</html>