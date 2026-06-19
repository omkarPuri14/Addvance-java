package com.vote;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Registration")
public class Voteing extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();

		
		String fname = req.getParameter("firstName");
		String lname = req.getParameter("lastName");
		String dob = req.getParameter("dob"); 
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		
		long mobNo = 0;
		try {
			
			String cleanPhone = phone.replaceAll("[^0-9]", "");
			mobNo = Long.parseLong(cleanPhone);
		} catch (NumberFormatException e) {
			
		}

		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zipcode = req.getParameter("zipcode"); 
		String county = req.getParameter("county");
		String idNumber = req.getParameter("idNumber");
		
		int idNo = 0;
		try {
			idNo = Integer.parseInt(idNumber);
		} catch (NumberFormatException e) {
			
		}
		
		String party = req.getParameter("party");
		String language = req.getParameter("language");
		String eligibility = req.getParameter("eligibility");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch432", "root", "root");
			
			PreparedStatement ps = c.prepareStatement(
					"insert into voteing (Fname, Lname, dob, gender, email, mobNo, addres, city, state, zipcode, county, idno, party, langu, elegibi) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, dob); 
			ps.setString(4, gender);
			ps.setString(5, email);
			ps.setLong(6, mobNo);
			ps.setString(7, address);
			ps.setString(8, city);
			ps.setString(9, state);
			ps.setString(10, zipcode); 
			ps.setString(11, county);
			ps.setInt(12, idNo);
			ps.setString(13, party);
			ps.setString(14, language);
			ps.setString(15, eligibility);
			
			int a = ps.executeUpdate();
			if (a > 0) {
				out.println("<h1 style='color:green'>inserted ...!</h1>");
			} else {
				out.println("<h1 style='color:red'>NOT inserted ...!</h1>");
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}
}
