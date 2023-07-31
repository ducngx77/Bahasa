
package model;

public class Order {
    int id;
    int accountID;
    float totalPrice;
    String orderDate;
    String status;

    public Order() {
    }
    
    public Order( int accountID, float totalPrice, String orderDate, String status) {
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.status = status;
    }

    public Order(int id, int accountID, float totalPrice, String orderDate, String status) {
        this.id = id;
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.status = status;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
