/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.org.slf4j.internal.LoggerFactory;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {
    
    private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(AccountDAO.class);

    public List<Account> getAll() {
        List<Account> listA = new ArrayList<>();
        String sql = "Select a.AccountID, Username, [Password], Email, Is_Staff, [Name], Phone, Adress\n"
                + "from Accounts a, UserInfos u\n"
                + "where a.AccountID = u.AccountID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("AccountID"));
                a.setUsername(rs.getString("Username"));
                a.setPassword(rs.getString("Password"));
                a.setEmail(rs.getString("Email"));
                a.setIsStaff(rs.getBoolean("Is_Staff"));
                a.setName(rs.getString("Name"));
                a.setPhone(rs.getString("Phone"));
                a.setAddress(rs.getString("Adress"));
                listA.add(a);
            }
        } catch (SQLException e) {
            LOGGER.error("An SQL error occurred w", e.getMessage());
        }
        return listA;
    }

    public List<Account> getAccountByRole(int isStaff) {
        List<Account> listRA = new ArrayList<>();
        String sql = "select a.AccountID, Username, [Password], Email, Is_Staff, [Name], Phone, Adress\n"
                + "from Accounts a , UserInfos ui\n"
                + "where a.AccountID = ui.AccountID and Is_Staff = " + isStaff;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("AccountID"));
                a.setUsername(rs.getString("Username"));
                a.setPassword(rs.getString("Password"));
                a.setEmail(rs.getString("Email"));
                a.setIsStaff(rs.getBoolean("Is_Staff"));
                a.setName(rs.getString("Name"));
                a.setPhone(rs.getString("Phone"));
                a.setAddress(rs.getString("Adress"));
                listRA.add(a);
            }
        } catch (SQLException e) {
            return null;        }
        return listRA;
    }

    public Account getInfoByLogin(String name, String pass, List<Account> listA) {
        for (Account a : listA) {
            if (name.equals(a.getUsername()) && pass.equals(a.getPassword())) {
                return a;
            }
        }
        return null;
    }

    public int login(Account a, List<Account> listA) {
        for (int i = 0; i < listA.size(); i++) {
            if (a.getUsername().equals(listA.get(i).getUsername()) && a.getPassword().equals(listA.get(i).getPassword())) {
                if (listA.get(i).isIsStaff()) {
                    return 1;
                } else {
                    return 2;
                }
            }
        }
        return 3;
    }

    public Account getAccountById(int id, List<Account> listA) {
        for (Account a : listA) {
            if (a.getId() == id) {
                return a;
            }
        }
        return null;
    }

    public boolean checkExistedAccount(String name, String email) {

        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[Email]\n"
                + "  FROM [dbo].[Accounts]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (name.equals(rs.getString("Username"))) {
                    return true;
                }
                if (email.equals(rs.getString("Email"))) {
                    return true;
                }
            }
        } catch (SQLException e) {
           
            return true;
        }
        return false;
    }

    public void updateNewAccount(String name, String pass, String email) {
        String sql1 = "INSERT INTO [dbo].[Accounts]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[Email]\n"
                + "           ,[is_Staff])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";
        String sql2 = "SELECT top 1 [AccountID]\n"
                + "      ,[Username]\n"
                + "      ,[Password]\n"
                + "      ,[Email]\n"
                + "      ,[Is_Staff]\n"
                + "  FROM [dbo].[Accounts]\n"
                + "  order by [AccountID] desc";
        String sql3 = "INSERT INTO [UserInfos]\n"
                + "           ([AccountID]\n"
                + "           ,[Name]\n"
                + "           ,[Phone]\n"
                + "           ,[Adress])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st1.setString(1, name);
            st1.setString(2, pass);
            st1.setString(3, email);
            st1.setBoolean(4, false);
            st1.executeUpdate();
            ResultSet rs = st2.executeQuery();
            String blank = "";
            if (rs.next()) {
                st3.setInt(1, rs.getInt("AccountID"));
                st3.setString(2, blank);
                st3.setString(3, blank);
                st3.setString(4, blank);
                st3.executeUpdate();
            }

        } catch (SQLException e) {
            return;        
        }
    }

    public void updateExistedAccount(Account a, int isStaff) {
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [Username] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Is_Staff] = ?\n"
                + " WHERE AccountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getEmail());
            st.setInt(4, isStaff);
            st.setInt(5, a.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            return;        
        }
    }
}
