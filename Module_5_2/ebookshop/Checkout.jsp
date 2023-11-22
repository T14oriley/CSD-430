<%--
CSD430 Tyler O'Riley 11/21/2023 Assignments 5
Ebookshop project
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page session="true" import="ebookshop.Book, java.util.Vector"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>E-BookShop Checkout</title>
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
    	border-collapse: separate;
    }
    td {
    	padding: 5px;
    }
   	</style>
</head>
<body>
	<h1>Your Online BookShop - Checkout</h1>
	<hr/><p/>
	<table border="1">
		<tr>
	  		<td>TITLE</td>
	  		<td align="right">PRICE</td>
	  		<td align="right">QUANTITY</td>
  		</tr>
		<%
			@SuppressWarnings("unchecked")
		    Vector<Book> shoplist = (Vector<Book>) session.getAttribute("ebookshop.cart");
		    for (Book anOrder : shoplist) {
		%>
      	<tr>
	        <td><%=anOrder.getTitle()%></td>
	        <td align="right">$<%=anOrder.getPrice()%></td>
	        <td align="right"><%=anOrder.getQuantity()%></td>
        </tr>
		<%
		    }
		    session.invalidate();
		%>
	    <tr>
			<td>TOTALS</td>
			<td align="right">$<%=(String)request.getAttribute("dollars")%></td>
			<td align="right"><%=(String)request.getAttribute("books")%></td>
	    </tr>
    </table>
  	<p/>
  	<a href="/ebookshop/eshop">Buy more!</a>
</body>
</html>