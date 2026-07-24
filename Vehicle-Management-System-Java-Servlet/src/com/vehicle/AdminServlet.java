package com.vehicle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Security Check: Only allow logged-in Admins
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("login");
            return;
        }

        DbConnection db = new DbConnection();
        List<Map<String, String>> userList = new ArrayList<>();
        List<Map<String, String>> bookingList = new ArrayList<>();
        int totalBookings = 0;

        try {
            Connection con = db.makeConnection();
            if (con != null) {
                // 1. Fetch All Users
                String userSql = "SELECT user_id, name, email FROM users";
                PreparedStatement userSt = con.prepareStatement(userSql);
                ResultSet userRs = userSt.executeQuery();

                while (userRs.next()) {
                    Map<String, String> userMap = new HashMap<>();
                    userMap.put("id", String.valueOf(userRs.getInt("user_id")));
                    userMap.put("name", userRs.getString("name"));
                    userMap.put("email", userRs.getString("email"));
                    userList.add(userMap);
                }
                userRs.close();
                userSt.close();

                // 2. Fetch All Bookings from 'booking' table
                String bookingSql = "SELECT booking_id, user_id, owner_id, vehicle_id, date FROM booking";
                PreparedStatement bookingSt = con.prepareStatement(bookingSql);
                ResultSet bookingRs = bookingSt.executeQuery();

                while (bookingRs.next()) {
                    Map<String, String> booking = new HashMap<>();
                    booking.put("booking_id", String.valueOf(bookingRs.getInt("booking_id")));
                    booking.put("user_id", String.valueOf(bookingRs.getInt("user_id")));
                    booking.put("owner_id", String.valueOf(bookingRs.getInt("owner_id")));
                    booking.put("vehicle_id", String.valueOf(bookingRs.getInt("vehicle_id")));
                    booking.put("date", String.valueOf(bookingRs.getDate("date")));
                    bookingList.add(booking);
                }
                totalBookings = bookingList.size();

                bookingRs.close();
                bookingSt.close();
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Pass data to JSP page
        request.setAttribute("userList", userList);
        request.setAttribute("bookingList", bookingList);
        request.setAttribute("totalBookings", totalBookings);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}