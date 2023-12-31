package mod5;

/*
 * Module 6 Assignment
 * Tyler O'Riley
 * 11/19/2023
 * CSD430
 * DB connection and creation file for bookstore web page
 */

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher;

@WebServlet("/eshop")
public class shopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public shopServlet() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
    	System.out.println("**** INITIALIZING CONTROLLER SREVLET ****");
    	super.init(config);
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// forward call to doPost()
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
	    @SuppressWarnings("unchecked")
	    Vector<book> shoplist = (Vector<book>)session.getAttribute("mod5.cart");
	    
	    String do_this = request.getParameter("do_this");

	    if (do_this == null) {
	    	
	    	Vector<String> blist = new Vector<String>();
	    	blist.addElement("Learn HTML5 and JavaScript for iOS. Scott Preston $39.99");
	    	blist.addElement("Java 7 for Abosulte Beginners. Jay Bryant $39.99");
	    	blist.addElement("Beginning Android 4. Livingston $39.99");
	    	blist.addElement("Pro Spatial with SQL Server 2012. Alastair Aitchison $59.99");
	    	blist.addElement("Beginning Database Design. Clare Churner $34.99");
	    	
	    	session.setAttribute("mod5.list", blist);
	    	
	    	ServletContext    sc = request.getSession().getServletContext();
	    	RequestDispatcher rd = sc.getRequestDispatcher("/");
	    	rd.forward(request, response);
	    }
	    else {
	    	
	    	if (do_this.equals("checkout"))  {
		        float dollars = 0;
		        int   books = 0;
		        
		        for (book aBook : shoplist) {
		        	float price = aBook.getPrice();
		        	int   qty = aBook.getQuantity();
		        	dollars += price * qty;
		        	books += qty;
		        }
		        
		        request.setAttribute("dollars", String.valueOf(dollars));
		        request.setAttribute("books", String.valueOf(books));
		        
		        ServletContext    sc = request.getServletContext();
		        RequestDispatcher rd = sc.getRequestDispatcher("/checkOut.jsp");
		        rd.forward(request, response);
		        
	    	} 
	    	else { 
	    		if (do_this.equals("remove")) {
					String pos = request.getParameter("position");
					shoplist.removeElementAt(Integer.parseInt(pos));
	    		}
	    		else if (do_this.equals("add")) {
		    		boolean  found = false;
		    		book aBook = getBook(request);
		    		
			        if (shoplist == null) {  
			        	shoplist = new Vector<book>();
			        	shoplist.addElement(aBook);
			        } else {  
			        	for (int i = 0; i < shoplist.size() && !found; i++) {
			        		book b = (book)shoplist.elementAt(i);
			        		if (b.getTitle().equals(aBook.getTitle())) {
			        			b.setQuantity(b.getQuantity() + aBook.getQuantity());
			        			shoplist.setElementAt(b, i);
			        			found = true;
			        		}
			        	} 
			        	
			        	if (!found) {  
			        		shoplist.addElement(aBook);
			        	}
			        } 
	    		} 

				session.setAttribute("mod5.cart", shoplist);
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/");
				rd.forward(request, response);
	    	} 
	    } 
	} 
	

	private book getBook(HttpServletRequest req) {
	  	String myBook = req.getParameter("book");
	    int    n = myBook.indexOf('$');
	    String title = myBook.substring(0, n);
	    String price = myBook.substring(n+1);
	    String qty = req.getParameter("qty");
	    return new book(title, Float.parseFloat(price), Integer.parseInt(qty));
	} 
}