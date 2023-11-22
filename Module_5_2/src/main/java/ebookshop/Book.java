//CSD430 Tyler O'Riley 11/21/2023 Assignments 5
//Ebookshop project

package ebookshop;


public class Book {
	String title;
	float  price;
	int    quantity;
	
	public Book(String t, float p, int q) {
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