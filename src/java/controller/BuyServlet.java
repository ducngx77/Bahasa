/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BookDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Book;
import model.Cart;
import model.Item;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the price, quantity, checkout money of a cart and process purchasing
        HttpSession session = request.getSession();
        String checkout = request.getParameter("checkout");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        Cart cart = null;
        OrderDAO od = new OrderDAO();
        BookDAO bd = new BookDAO();
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        List<Item> listI = cart.getItems();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            session.setAttribute("cart", cart);
            session.setAttribute("size", listI.size());
            response.sendRedirect("login");
        } else {
            int accountId = account.getId();
            try {
                if (checkout != null) {
                    od.addCartOrder(accountId, cart);
                    cart = new Cart();
                    listI = cart.getItems();
                } else if (quantity != null && price != null) {
                    String rid = request.getParameter("id");
                    if (rid != null) {
                        int id = Integer.parseInt(rid);
                        List<Book> listB = bd.getAll();
                        Book b = bd.getBookByID(id, listB);
                        int itemQuantity = Integer.parseInt(quantity);
                        float itemPrice = Float.parseFloat(price) * itemQuantity;
                        Item item = new Item(b, itemQuantity, itemPrice);
                        od.addItemOrder(accountId, item);
                        cart.removeItem(id);
                    }
                } else {
                    String rid = request.getParameter("id");
                    if (rid != null) {
                        int id = Integer.parseInt(rid);
                    Item item = cart.getItemById(id);
                    od.addItemOrder(accountId, item);
                    cart.removeItem(id);
                    }
                }
            } catch (NumberFormatException e) {
                return;
            }
            session.setAttribute("cart", cart);
            session.setAttribute("size", listI.size());
            response.sendRedirect("orderHistory");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
