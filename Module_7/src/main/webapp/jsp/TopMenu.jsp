<%-- 
  Module 7 Assignment
  Tyler O'Riley
  11/28/2023
  CSD430
  Eshop application involving MVC updating on existing project file
--%>

<%@page language="java" contentType="text/html"%>
<%
  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  %>
<div class="header">
  <div class="logo">
    <p>e-Shopping Center</p>
    </div>
  <div class="cart">
    <a class="link2" href="<%=base%>?action=showCart">Show Cart
      <img src="<%=imageURL%>cart.gif" border="0"/></a>
    </div>
  </div>