package ebookshop;

import java.util.Vector;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShoppingServlet
 */
@WebServlet("/eshop")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ShoppingServlet() {
        super();
	}
        
	public void init(ServletConfig config) throws ServletException {
    	System.out.println("**** INITIALIZING CONTROLLER SREVLET ****");
    	super.init(config);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// forward call to doPost()
		doPost(request,response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
	    @SuppressWarnings("unchecked")
	    
	    Vector<Book> shoplist = (Vector<Book>)session.getAttribute("ebookshop.cart");
	    
	    String do_this = request.getParameter("do_this");

	    if (do_this == null) {
	    	
	    	Vector<String> blist = new Vector<String>();
	    	blist.addElement("Learn HTML5 and JavaScript for iOS. Scott Preston $39.99");
	    	blist.addElement("Java 7 for Abosulte Beginners. Jay Bryant $39.99");
	    	blist.addElement("Beginning Android 4. Livingston $39.99");
	    	blist.addElement("Pro Spatial with SQL Server 2012. Alastair Aitchison $59.99");
	    	blist.addElement("Beginning Database Design. Clare Churner $34.99");
	    	
	    	session.setAttribute("ebookshop.list", blist);
	    	
	    	ServletContext    sc = request.getSession().getServletContext();
	    	RequestDispatcher rd = sc.getRequestDispatcher("/");
	    	rd.forward(request, response);
	    }
	    else {
	    	
	    	if (do_this.equals("checkout"))  {
		        float dollars = 0;
		        int   books = 0;
		        
		        for (Book aBook : shoplist) {
		        	float price = aBook.getPrice();
		        	int   qty = aBook.getQuantity();
		        	dollars += price * qty;
		        	books += qty;
		        }
		        
		        request.setAttribute("dollars", String.valueOf(dollars));
		        request.setAttribute("books", String.valueOf(books));
		        
		        ServletContext    sc = request.getServletContext();
		        RequestDispatcher rd = sc.getRequestDispatcher("/Checkout.jsp");
		        rd.forward(request, response);
		        
	    	} // if (..checkout..
	    	else { 
	    		// Not a checkout request - Manipulate the list of books
	    		if (do_this.equals("remove")) {
					String pos = request.getParameter("position");
					shoplist.removeElementAt(Integer.parseInt(pos));
	    		}
	    		else if (do_this.equals("add")) {
		    		boolean  found = false;
		    		Book aBook = getBook(request);
		    		
			        if (shoplist == null) {  // the shopping cart is empty
			        	shoplist = new Vector<Book>();
			        	shoplist.addElement(aBook);
			        } else {  // update the #copies if the book is already there
			        	for (int i = 0; i < shoplist.size() && !found; i++) {
			        		Book b = (Book)shoplist.elementAt(i);
			        		if (b.getTitle().equals(aBook.getTitle())) {
			        			b.setQuantity(b.getQuantity() + aBook.getQuantity());
			        			shoplist.setElementAt(b, i);
			        			found = true;
			        		}
			        	} // for (i..
			        	
			        	if (!found) {  // if it is a new book => Add it to the shoplist
			        		shoplist.addElement(aBook);
			        	}
			        } // if (shoplist == null) .. else ..
	    		} // if (..add..

				// Save the updated list of books and return to the home page
				session.setAttribute("ebookshop.cart", shoplist);
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/");
				rd.forward(request, response);
	    	} // if (..checkout..else
	    } // if (do_this..
	} // doPost
	
    	
	private Book getBook(HttpServletRequest req) {
	  	String myBook = req.getParameter("book");
	    int    n = myBook.indexOf('$');
	    String title = myBook.substring(0, n);
	    String price = myBook.substring(n+1);
	    String qty = req.getParameter("qty");
	    return new Book(title, Float.parseFloat(price), Integer.parseInt(qty));
	} // getBook
}