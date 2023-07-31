/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.org.slf4j.internal.LoggerFactory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.Item;
import model.Order;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {
    
    private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(OrderDAO.class);

    public List<Order> getAll() {
        List<Order> listO = new ArrayList<>();
        String sql = " select OrderID, AccountID, Total_Price, OrderDate, [Status]\n"
                + " from Orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("OrderID"));
                o.setAccountID(rs.getInt("AccountID"));
                o.setTotalPrice(rs.getFloat("Total_Price"));
                o.setOrderDate(rs.getString("OrderDate"));
                o.setStatus(rs.getString("Status"));
                listO.add(o);
            }
        } catch (SQLException e) {
            return null;
        }
        return listO;
    }

    public List<Order> getAllByStatus(String status) {
        List<Order> listSO = new ArrayList<>();
        String sql = "SELECT [OrderID]\n"
                + "      ,[AccountID]\n"
                + "      ,[Total_Price]\n"
                + "      ,[OrderDate]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Orders]\n"
                + "  where [Status] like N'%" + status +"%'\n"
                + "  order by [OrderID] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("OrderID"));
                o.setAccountID(rs.getInt("AccountID"));
                o.setTotalPrice(rs.getFloat("Total_Price"));
                o.setOrderDate(rs.getString("OrderDate"));
                o.setStatus(rs.getString("Status"));
                listSO.add(o);
            }
        } catch (SQLException e) {
            LOGGER.error("An SQL error occurred while listting order", e.getMessage());
        }
        return listSO;
    }

    public List<Order> getAllByAccountId(int id) {
        List<Order> listOA = new ArrayList<>();
        String sql = "SELECT [OrderID]\n"
                + "      ,[AccountID]\n"
                + "      ,[Total_Price]\n"
                + "      ,[OrderDate]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Orders]\n"
                + "  where [AccountID] = ?\n"
                + "  order by [OrderID] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("OrderID"));
                o.setAccountID(rs.getInt("AccountID"));
                o.setTotalPrice(rs.getFloat("Total_Price"));
                o.setOrderDate(rs.getString("OrderDate"));
                o.setStatus(rs.getString("Status"));
                listOA.add(o);
            }
        } catch (SQLException e) {
            LOGGER.error("An SQL error occurred while git all list by Acoount ID", e.getMessage());
        }
        return listOA;
    }

    public void addCartOrder(int accountId, Cart cart) {
        LocalDate curDate = LocalDate.now();
        BookDAO bd = new BookDAO();
        String date = curDate.toString();
        String sql1 = "INSERT INTO [Orders]\n"
                + "           (AccountID, Total_Price, OrderDate, Status)\n"
                + "     VALUES ( ?, ?, ?, ?)";
        String sql2 = "select top 1 OrderID, AccountID, Total_Price, OrderDate, [Status]\n"
                + " from Orders\n"
                + " order by OrderID desc";
        String sql3 = "INSERT INTO [OrderItems]\n"
                + "           ([OrderID],[BookID],[Quantity],[Unit_Price])\n"
                + "		   VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st1.setInt(1, accountId);
            float totalPrice = 0;
            List<Item> listI = cart.getItems();
            for (Item i : listI) {
                totalPrice += i.getPrice();
            }
            st1.setFloat(2, totalPrice);
            st1.setString(3, date);
            st1.setString(4, "Chờ xử lý");
            st1.executeUpdate();
            ResultSet rs = st2.executeQuery();
            if (rs.next()) {
                int orderId = rs.getInt("OrderID");
                for (Item i : listI) {
                    st3.setInt(1, orderId);
                    st3.setInt(2, i.getBook().getId());
                    st3.setInt(3, i.getQuantity());
                    st3.setFloat(4, i.getBook().getPrice());
                    st3.executeUpdate();
                    bd.updateBoughtBook(i);
                }
            }
        } catch (SQLException e) {        
            LOGGER.error("An SQL error occurred while git all list by Acoount ID", e.getMessage());        }
    }

    public void addItemOrder(int accountId, Item item) {
        LocalDate curDate = LocalDate.now();
        BookDAO bd = new BookDAO();
        String date = curDate.toString();
        String sql1 = "INSERT INTO [Orders]\n"
                + "           (AccountID, Total_Price, OrderDate, Status)\n"
                + "     VALUES ( ?, ?, ?, ?)";
        String sql2 = "select top 1 OrderID, AccountID, Total_Price, OrderDate, [Status]\n"
                + " from Orders\n"
                + " order by OrderID desc";
        String sql3 = "INSERT INTO [OrderItems]\n"
                + "           ([OrderID],[BookID],[Quantity],[Unit_Price])\n"
                + "		   VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st1.setInt(1, accountId);
            st1.setFloat(2, item.getPrice());
            st1.setString(3, date);
            st1.setString(4, "Chờ xử lý");
            st1.executeUpdate();
            ResultSet rs = st2.executeQuery();
            if (rs.next()) {
                int orderId = rs.getInt("OrderID");
                st3.setInt(1, orderId);
                st3.setInt(2, item.getBook().getId());
                st3.setInt(3, item.getQuantity());
                st3.setFloat(4, item.getBook().getPrice());
                st3.executeUpdate();
                bd.updateBoughtBook(item);
            }
        } catch (SQLException e) {
            LOGGER.error("An SQL error occurred while creating a user: {}", e.getMessage());
        }
    }

    public void cancelOrder(int oid, String msg) {
        String sql1 = "select BookID, Quantity\n"
                + "from OrderItems\n"
                + "WHERE OrderID = ?";
        String sql2 = "DELETE FROM [dbo].[OrderItems]\n"
                + "      WHERE OrderID = ?";

        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st1.setInt(1, oid);
            ResultSet rs = st1.executeQuery();
            BookDAO bd = new BookDAO();
            while (rs.next()) {
                int bid = rs.getInt("BookID");
                int quantity = rs.getInt("Quantity");
                bd.updateReturnedBook(bid, quantity);
            }
            st2.setInt(1, oid);
            st2.executeUpdate();
            updateOrder(oid, msg);
        } catch (Exception e) {
            return;        
        }
    }

    public void updateOrder(int oid, String msg) {
        String sql1 = "SELECT [OrderID]\n"
                + "      ,[AccountID]\n"
                + "      ,[Total_Price]\n"
                + "      ,[OrderDate]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Orders]\n"
                + "  WHERE OrderID = ? ";
        String sql2 = "UPDATE [dbo].[Orders]\n"
                + "   SET [AccountID] = ?\n"
                + "      ,[Total_Price] = ?\n"
                + "      ,[OrderDate] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE OrderID = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st1.setInt(1, oid);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                st2.setInt(1, rs.getInt("AccountID"));
                st2.setFloat(2, rs.getFloat("Total_Price"));
                st2.setString(3, rs.getString("OrderDate"));
                st2.setString(4, msg);
                st2.setInt(5, oid);
                st2.executeUpdate();
            }
        } catch (Exception e) {
            LOGGER.error("An SQL error occurred w", e.getMessage());
        }
    }
}
