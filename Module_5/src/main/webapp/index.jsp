<%-- 
  Module 6 Assignment
  Tyler O'Riley
  11/19/2023
  CSD430
  DB connection and creation file for bookstore web page
--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page session="true" import="mod5.book, java.util.Vector"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>E-BookShop</title>
	<style type="text/css">
    body {
    	background-color:gray; 
    	font-size=10pt;
    }
    H1 {
    	font-size:20pt;
    }
    table {
    	background-color:white;
    	border-colapse: separate; 
    }
    td {
    	padding: 5px;
    }
   	</style>
</head>
<body>
	<h1>Your Online BookShop</h1>
	<hr/>
	<p/>
	
	<%  
		@SuppressWarnings("unchecked")
		Vector<mod5.book> booklist = (Vector<mod5.book>)session.getAttribute("mod5.list");
		if (booklist == null) {
		  response.sendRedirect("/mod5/eshop");
		  }
		else {
	%>
    <form name="addForm" action="eshop" method="POST">
    	<input type="hidden" name="do_this" value="add">
		Book:
      	<select name=book>
			<%  
				for (int i = 0; i < booklist.size(); i++) {
		        	out.println("<option>" + booklist.elementAt(i) + "</option>");
		        }
	  		%>
	  	</select>
	    Quantity: 
	    <input type="text" name="qty" size="3" value="1">
		<input type="submit" value="Add to Cart">
	</form>
	<p/>
	<%  
		@SuppressWarnings("unchecked")
		Vector<mod5.book> shoplist = (Vector<mod5.book>)session.getAttribute("mod5.cart");
		if (shoplist != null  &&  shoplist.size() > 0) {
	%>
	<table border="1" >
	    <tr>
		    <td>TITLE</td>
		    <td>PRICE</td>
		    <td>QUANTITY</td>
		    <td></td>
	    </tr>
		<%  
			for (int i = 0; i < shoplist.size(); i++) {
				book aBook = shoplist.elementAt(i);
		%>
        <tr>
			<td><%= aBook.getTitle() %></td>
	        <td align="right">$<%= aBook.getPrice() %></td>
	        <td align="right"><%= aBook.getQuantity() %></td>
	        <td>
	            <form name="removeForm" action="eshop" method="POST">
	                <input type="hidden" name="position" value="<%=i%>">
	                <input type="hidden" name="do_this" value="remove">
	                <input type="submit" value="Remove from Cart">
	            </form>
	        </td>
        </tr>
        <%
	     	} 
	    %>
	</table>
    <p/>
	<form name="checkoutForm" action="eshop" method="POST">
		<input type="hidden" name="do_this" value="checkout">
		<input type="submit" value="Checkout">
	</form>
    <%
    	} 
    } 
    %>

</body>
</html>