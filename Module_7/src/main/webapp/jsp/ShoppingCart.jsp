<%-- 
  Module 7 Assignment
  Tyler O'Riley
  11/28/2023
  CSD430
  Eshop application involving MVC updating on existing project file
--%>

<%@page language="java" contentType="text/html"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="eshop.beans.Book"%>
<%@page import="eshop.beans.CartItem"%>
<%@page import="eshop.controller.CartController"%>
<jsp:useBean id="dataManager" scope="application"
  class="eshop.model.DataManager"/>
<%
    String base = (String) application.getAttribute("base");	//Get the base URL from the application context
    @SuppressWarnings("unchecked")								//Retrieve the shopping cart from the session
    Hashtable<String, CartItem> shoppingCart =
            (Hashtable<String, CartItem>) session.getAttribute("shoppingCart");
 	
    if (shoppingCart == null) {									// If the shopping cart doesn't exist, create a new one and set it in the session
        shoppingCart = new Hashtable<String, CartItem>(10);
        session.setAttribute("shoppingCart", shoppingCart);
    }
    String action = request.getParameter("action");				// Retrieve the action parameter from the request
    CartController cartController = new CartController(dataManager);	// Instantiate the CartController and pass the DataManager as a dependency

    if (action != null && action.equals("addItem")) {			// Process the action based on its value
        cartController.addItem(request);						// Call the addItem method of the CartController
    } else if (action != null && action.equals("updateItem")) {
        cartController.updateItem(request);						// Call the updateItem method of the CartController
    } else if (action != null && action.equals("deleteItem")) {
        cartController.deleteItem(request);						// Call the deleteItem method of the CartController
    }
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Shopping Cart</title>
  <link rel="stylesheet" href="/eshop/css/eshop.css" type="text/css"/>
  </head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<jsp:include page="LeftMenu.jsp" flush="true"/>
<%
  if (!shoppingCart.isEmpty()) {
  %>
    <div class="content">
      <h2>Shopping Cart</h2>
      <table>
        <tr>
          <th>Title</th>
          <th>Author</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Subtotal</th>
          <th>Delete</th>
          </tr>
<%
        Enumeration<CartItem> enumList = shoppingCart.elements();
        double itemPrice = 0;
        double totalPrice = 0;
        while (enumList.hasMoreElements()) {
          CartItem item = enumList.nextElement();
          itemPrice = Math.round(
        		    Integer.parseInt(item.getQuantity())
        		    * item.getPrice() * 100.) / 100.
                    ;
          totalPrice += itemPrice;
  %>
          <tr>
            <td><%=item.getTitle()%></td>
            <td><%=item.getAuthor()%></td>
            <td><%=item.getPrice()%></td>
            <td><form>
              <input type="hidden" name="action" value="updateItem"/>
              <input type="hidden" name="bookId"
                value="<%=item.getBookID()%>"/>
              <input type="text" size="2" name="quantity" 
                value="<%=item.getQuantity()%>"/>
              <input type="submit" value="Update"/>
              </form></td>
            <td>
              <%=itemPrice%>
                </td>
            <td><form>
              <input type="hidden" name="action" value="deleteItem"/>
              <input type="hidden" name="bookId" 
                value="<%=item.getBookID()%>"/>
              <input type="submit" value="Delete"/>
              </form></td>
            </tr>
<%
          }
  %>
        <tr>
          <td colspan="5" id="total">Total: <%=totalPrice%></td>
          <td class="total">&nbsp;</td>
          </tr>
        <tr>
          <td colspan="6" class="center"><a class="link1"
            href="<%=base%>?action=checkOut">Check Out</a></td>
          </tr>
        </table>
      </div>
<%
    }
  else {
    %><p class="info">The Shopping cart is empty.</p><%
    }
  %>
</body>
</html>
