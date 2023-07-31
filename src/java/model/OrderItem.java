
package model;

public class OrderItem {
        int id;
    int accountID;
    float totalPrice;
    String orderDate;

    public OrderItem() {
    }

    public OrderItem(int id, int accountID, float totalPrice, String orderDate) {
        this.id = id;
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    
    
}
