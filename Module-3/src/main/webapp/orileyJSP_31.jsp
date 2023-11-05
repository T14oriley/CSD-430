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
<title>Module 3 - JSP31</title>
</head>
<body>
	<h2>JSP File Navigation</h2>
	<hr>
	<ul>
		<li><a href="orileyJSP_31.jsp">JSP_31</a></li>
		<li><a href="orileyJSP_32.jsp">JSP_32</a></li>
	</ul>
	<hr>
	<h3>Array Generation</h3>
	<%
		int[] IntArray = new int[50];		//Java Integer Array
		Random random = new Random();
		
		for (int i=0; i < IntArray.length; i++) {		//Java for loop to fill array
			IntArray[i] = random.nextInt(100) + 1;
		}
		
		out.println("This array holds the values of: [");	//Java for loop. For each num in IntArray (displays each variable one at a time)
		for (int num:IntArray) {
			out.print(num + ", ");
		}
		out.println("]");	//closes brackets containing array
	%>

	<hr>
	<table border="1">		<%--HTML table creation. Border lines set to 1 "thickness" --%>
		<tr>
			<th colspan="3">Even/Odd Finder</th>	<%-- table header setting colspan to 3 for 3 columns to be created --%>
		</tr>
		<tr>
			<th>Index</th>
			<th>Value</th>
			<th>Even/Odd</th>
		</tr>
		<% 
			for (int i=0; i < IntArray.length; i++) { 	//Because this for loop interacts with the table, your scripplets will be spaced out to accomodate needed HTML syntax
		%>
        <tr>
      		<td><%= i %></td>	<%--Index is displaying I = current array value 0,1,2,3 etc. --%>
      		<td><%= IntArray[i] %></td>		<%-- <td> goes in order so we are now display the value for the Value column which is the array value ex. 34 --%>
      		<td>
      			<%
      				if(IntArray[i] % 2 == 0) {	//Notice the spacing difference. This scripplet has a few lines to display the even/odd string
      					out.println("Even");	//Therefor we have spaced out our HTML syntax and Scripplet syntax to make sense
      				}else {
      					out.println("Odd");
      				}
      			%>
      		</td>
        </tr>
		<% } //so this is the closing bracket of the for loop. I believe this placement is to not cut off the loop while its modifying the table rows%>
	</table>
	<hr>
</body>
</html>