/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
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

/**
 *
 * @author Admin
 */
@WebServlet(name="UpdateServlet", urlPatterns={"/update"})
public class UpdateServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AccountDAO ad = new AccountDAO();
        String rAccountId = request.getParameter("aid");
        if(rAccountId != null){
            int aid = Integer.parseInt(rAccountId);
            List<Account> listA = ad.getAll();
            Account a = ad.getAccountById(aid, listA);
            ad.updateExistedAccount(a, 1);
            request.getRequestDispatcher("manage?mid=3").forward(request, response);
        }
        request.getRequestDispatcher("manage?mid=3").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(true);       
        Account account = (Account)session.getAttribute("account");
        AccountDAO ad = new AccountDAO();
        String rAccountId = request.getParameter("aid");
        if(rAccountId != null){
            int aid = Integer.parseInt(rAccountId);
            List<Account> listA = ad.getAll();
            Account a = ad.getAccountById(aid, listA);
            ad.updateExistedAccount(a, 1);
            request.getRequestDispatcher("staff").forward(request, response);
        }
        String newPass = request.getParameter("newPass");
        if(newPass != null){
            account.setPassword(newPass);
            ad.updateExistedAccount(account, 0);
        }else{
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            account.setName(name);
            account.setEmail(email);
            account.setAddress(address);
            account.setPhone(phone);
            ad.updateExistedAccount(account, 0);
        }
        session.setAttribute("account", account);
        response.sendRedirect("info");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
