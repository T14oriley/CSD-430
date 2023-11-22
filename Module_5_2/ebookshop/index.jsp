<%--
CSD430 Tyler O'Riley 11/21/2023 Assignments 5
Ebookshop project
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="true" import="java.util.Vector, ebookshop.Book" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>E-bookshop</title>
	<style type="text/css">
		body {background-color:gray; font-size=10pt;}
		H1 {font-size:20pt;}
		table {background-color:white;}
	</style>
</head>
<body>
	<H1>Your online Bookstore</H1>
	<hr/><p/>
	
	<% // Scriplet1: check whether the booklist is ready
	@SuppressWarnings("unchecked")
	Vector<ebookshop.Book> booklist = (Vector<ebookshop.Book>)session.getAttribute("ebookshop.list");
	if (booklist == null) {
		response.sendRedirect("/ebookshop/eshop");
		}
	else {
	%>

		<form name="addForm" action="eshop" method="post">
			<input type="hidden" name="do_this" value="add">
			Book:
			<select name=book>
			
			<%	// Scriptlet 2: copy the booklist to the selection panel 
			for (int i = 0; i < booklist.size(); i++) {
    			out.println("<option>" + booklist.elementAt(i) + "</option>");
    		}
			%>

			</select>
		Quantity: <input type="text" name="qty" size="3" value="1">
		<input type="submit" value="Add to Cart">
		</form>
	<p/>

	<%	// Scriplet 3: check whether the shopping cart is empty
	@SuppressWarnings("unchecked")
	Vector<ebookshop.Book> shoplist = (Vector<ebookshop.Book>)session.getAttribute("ebookshop.cart");
	if (shoplist != null && shoplist.size() > 0) {
	%>

		<table border="1" cellpadding="2">
		<tr>
		<td>TITLE</td>
		<td>PRICE</td>
		<td>QUANTITY</td>
		<td></td>
		</tr>
		
		<%	// Scriptlet 4: display the books in the shopping cart
		for (int i = 0; i < shoplist.size(); i++) {
			Book aBook = shoplist.elementAt(i);
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
		} // for(int i..
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