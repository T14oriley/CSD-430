package mod5;

/* Book.java
 * Module 5 Assignment
 * Name: Brittany Kyncl
 * Date: 6.13.23
 * Course: CSD430
 * The Book class represents a book object in the ebook application. It contains information about the 
 * book, such as title(title & author), price, and quantity.
 */

/**
 * Constructs a Book object with the specified title (title string in this case also contains author name) , price, attributes, and quantity.
 *
 * @param tile    The title of the book and author.
 * @param price  The price of the book
 * @param quantity    The quantity of this.book.
 */

public class book {
	String title;
	float  price;
	int    quantity;
	
	public book(String t, float p, int q) {
	    title    = t;
	    price    = p;
	    quantity = q;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String t) {
		this.title = t;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float p) {
		this.price = p;
	}

	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int q) {
		this.quantity = q;
	}
	
}