
package model;

public class Item {
    public Book book;
    int quantity;
    float price;

    public Item() {
    }

    public Item(Book book, int quantity, float price) {
        this.book = book;
        this.quantity = quantity;
        this.price = price;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
