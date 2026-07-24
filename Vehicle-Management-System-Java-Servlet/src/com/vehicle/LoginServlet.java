package com.vehicle;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.vehicle.DbConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DbConnection db = new DbConnection();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println("Login Attempt - Email:\t" + email);

        try {
            Connection con = db.makeConnection();
            if (con != null) {
                System.out.println("Connection Successful");
                
                // -------------------------------------------------------------
                // STEP 1: Check the ADMIN table first
                // -------------------------------------------------------------
                String adminSql = "SELECT * FROM admin WHERE email=?";
                PreparedStatement adminSt = con.prepareStatement(adminSql);
                adminSt.setString(1, email);
                ResultSet adminRs = adminSt.executeQuery();

                if (adminRs.next()) {
                    String rpassword = adminRs.getString("password");
                    if (password.equals(rpassword)) {
                        session.setAttribute("admin_id", adminRs.getInt("admin_id"));
                        session.setAttribute("name", adminRs.getString("name"));
                        session.setAttribute("email", adminRs.getString("email"));
                        session.setAttribute("role", "ADMIN");
                        
                        System.out.println("Admin Login Successful!");
                        
                        adminRs.close();
                        adminSt.close();
                        con.close();
                        
                        response.sendRedirect("admin");
                        return; // Exit method after redirect
                    } else {
                        System.out.println("Invalid Password for Admin");
                        
                        adminRs.close();
                        adminSt.close();
                        con.close();
                        
                        response.sendRedirect("login?error=wrongpass");
                        return;
                    }
                }
                adminRs.close();
                adminSt.close();

                // -------------------------------------------------------------
                // STEP 2: If not an admin, check the regular USERS table
                // -------------------------------------------------------------
                String userSql = "SELECT * FROM users WHERE email=?";
                PreparedStatement userSt = con.prepareStatement(userSql);
                userSt.setString(1, email);
                ResultSet userRs = userSt.executeQuery();

                if (userRs.next()) {
                    String rpassword = userRs.getString("password");
                    if (password.equals(rpassword)) {
                        session.setAttribute("user_id", userRs.getInt("user_id"));
                        session.setAttribute("name", userRs.getString("name"));
                        session.setAttribute("email", userRs.getString("email"));
                        session.setAttribute("role", "USER");
                        
                        System.out.println("User Login Successful!");
                        
                        userRs.close();
                        userSt.close();
                        con.close();
                        
                        response.sendRedirect("dashboard");
                        return;
                    } else {
                        System.out.println("Invalid Password for User");
                        
                        userRs.close();
                        userSt.close();
                        con.close();
                        
                        response.sendRedirect("login?error=wrongpass");
                        return;
                    }
                } else {
                    System.out.println("Email ID Not found in both Admin and User tables: " + email);
                    
                    userRs.close();
                    userSt.close();
                    con.close();
                    
                    response.sendRedirect("login?error=notfound");
                    return;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}