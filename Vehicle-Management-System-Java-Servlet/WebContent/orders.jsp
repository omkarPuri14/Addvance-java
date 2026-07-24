<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.vehicle.Booking" %>
<%@ page import="com.vehicle.Vehicle" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotorHub | My Orders</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts & Font Awesome Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-accent: #00adb5;
            --primary-hover: #00888e;
            --dark-bg: #0f172a;
            --card-bg: #1e293b;
            --text-light: #f8fafc;
            --text-muted: #94a3b8;
            --border-color: rgba(255, 255, 255, 0.08);
            --danger-bg: rgba(239, 68, 68, 0.15);
            --danger-border: rgba(239, 68, 68, 0.3);
            --danger-color: #ef4444;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--dark-bg);
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Glassmorphic Navbar */
        .navbar-custom {
            background: rgba(15, 23, 42, 0.85) !important;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-color);
            padding: 0.8rem 2rem;
        }

        .navbar-brand {
            font-weight: 800;
            font-size: 1.8rem;
            color: var(--primary-accent) !important;
            letter-spacing: -0.02em;
        }

        .nav-link {
            color: var(--text-muted) !important;
            font-weight: 500;
            font-size: 0.95rem;
            margin: 0 0.25rem;
            padding: 0.5rem 1rem !important;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .nav-link:hover {
            color: var(--text-light) !important;
            background: rgba(255, 255, 255, 0.05);
        }

        .nav-link.act-cust {
            color: var(--text-light) !important;
            background: rgba(0, 173, 181, 0.15);
            border: 1px solid rgba(0, 173, 181, 0.3);
            font-weight: 600;
        }

        .user-badge {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #f1f5f9 !important;
            padding: 0.4rem 0.9rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 600;
        }

        .btn-logout {
            background: var(--danger-bg);
            color: var(--danger-color);
            border: 1px solid var(--danger-border);
            font-weight: 600;
            padding: 0.4rem 1.2rem;
            border-radius: 8px;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .btn-logout:hover {
            background: var(--danger-color);
            color: #ffffff;
        }

        /* Order Cards Layout */
        .order-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 18px;
            overflow: hidden;
            margin-bottom: 1.75rem;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.4);
            transition: all 0.3s ease;
        }

        .order-card:hover {
            border-color: rgba(0, 173, 181, 0.4);
            transform: translateY(-3px);
        }

        .veh-img-container {
            height: 100%;
            min-height: 250px;
            overflow: hidden;
            position: relative;
            background: rgba(0, 0, 0, 0.2);
        }

        .veh-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .order-card:hover .veh-img {
            transform: scale(1.03);
        }

        .price-badge {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: rgba(15, 23, 42, 0.85);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(0, 173, 181, 0.4);
            color: var(--primary-accent);
            font-weight: 800;
            font-size: 1.1rem;
            padding: 0.4rem 0.9rem;
            border-radius: 12px;
        }

        /* Order Header Banner */
        .order-header-bar {
            background: rgba(15, 23, 42, 0.6);
            border-bottom: 1px solid var(--border-color);
            padding: 0.9rem 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 0.5rem;
        }

        .booking-tag {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-muted);
        }

        .booking-tag span {
            color: var(--text-light);
        }

        /* Spec Badge Grid */
        .spec-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(130px, 1fr));
            gap: 0.75rem;
            padding: 1rem;
            background: rgba(15, 23, 42, 0.4);
            border-radius: 12px;
            margin: 1rem 0;
        }

        .spec-item {
            display: flex;
            flex-direction: column;
        }

        .spec-label {
            font-size: 0.75rem;
            color: var(--text-muted);
            text-transform: uppercase;
            font-weight: 600;
        }

        .spec-value {
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--text-light);
            margin-top: 0.15rem;
        }

        /* Cancel Button */
        .btn-cancel {
            background: var(--danger-bg);
            color: var(--danger-color);
            border: 1px solid var(--danger-border);
            font-weight: 700;
            padding: 0.65rem 1.5rem;
            border-radius: 12px;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            width: 100%;
        }

        .btn-cancel:hover {
            background: var(--danger-color);
            color: #ffffff;
            box-shadow: 0 8px 20px -5px rgba(239, 68, 68, 0.4);
        }

        /* Empty State Box */
        .empty-orders {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 18px;
            padding: 4rem 2rem;
            text-align: center;
        }

        /* Footer */
        footer {
            margin-top: auto;
            background: #090d16;
            border-top: 1px solid var(--border-color);
            padding: 2.5rem 0;
            text-align: center;
        }

        .footer-title {
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 1rem;
            color: var(--text-light);
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 1.25rem;
            margin-bottom: 1.25rem;
        }

        .social-icon {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--text-muted);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .social-icon:hover {
            background: var(--primary-accent);
            color: #ffffff;
            transform: translateY(-3px);
        }

        .copyright-text {
            color: var(--text-muted);
            font-size: 0.85rem;
            margin: 0;
        }
    </style>
</head>
<body>

    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if(session.getAttribute("user_id") == null) {
            response.sendRedirect("/Vehicle/login");
            return;
        }

        session = request.getSession();
        String name = (String)session.getAttribute("name");
    %>

    <!-- Glassmorphic Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-car-side me-2"></i>MotorHub</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item">
                        <a class="nav-link" href="/Vehicle/dashboard"><i class="fa-solid fa-chart-line me-1"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Vehicle/car"><i class="fa-solid fa-car me-1"></i> Buy a Car</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Vehicle/bike"><i class="fa-solid fa-motorcycle me-1"></i> Buy a Bike</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Vehicle/sell"><i class="fa-solid fa-tag me-1"></i> Sell Vehicle</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link act-cust" href="/Vehicle/orders"><i class="fa-solid fa-box me-1"></i> My Orders</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center gap-3">
                    <span class="user-badge"><i class="fa-solid fa-circle-user me-1"></i> <%= name %></span>
                    <a href="/Vehicle/logout" class="btn-logout"><i class="fa-solid fa-right-from-bracket me-1"></i> Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container my-5">
        <% 
            ArrayList<Booking> bookingList = (ArrayList)request.getAttribute("bookingList"); 
            ArrayList<Vehicle> vehicleList = (ArrayList)request.getAttribute("vehicleList"); 
            int orderCount = (bookingList != null) ? bookingList.size() : 0;
        %>

        <div class="d-flex align-items-center justify-content-between mb-4">
            <div>
                <h2 class="fw-bold mb-1"><i class="fa-solid fa-receipt text-info me-2"></i>My Bookings</h2>
                <p class="text-muted small mb-0">View active reservations and manage your orders</p>
            </div>
            <span class="badge bg-secondary px-3 py-2 fs-6">
                <%= orderCount %> Active <%= (orderCount == 1) ? "Booking" : "Bookings" %>
            </span>
        </div>

        <% if(bookingList != null && !bookingList.isEmpty() && vehicleList != null) { %>
            <% for(int i = 0; i < bookingList.size(); i++) { %>
                <% Booking booking = (Booking)bookingList.get(i); %>
                <% Vehicle vehicle = (Vehicle)vehicleList.get(i); %>

                <div class="order-card">
                    <!-- Top Order Information Bar -->
                    <div class="order-header-bar">
                        <div class="d-flex align-items-center gap-3 flex-wrap">
                            <span class="booking-tag"><i class="fa-solid fa-hashtag text-info me-1"></i> Booking ID: <span>#<%= booking.getBooking_id() %></span></span>
                            <span class="text-muted">|</span>
                            <span class="booking-tag"><i class="fa-regular fa-calendar me-1 text-info"></i> Date: <span><%= booking.getDate() %></span></span>
                        </div>
                        <div class="booking-tag">
                            <i class="fa-solid fa-user me-1 text-info"></i> User ID: <span>#<%= booking.getUser_id() %></span>
                        </div>
                    </div>

                    <!-- Main Vehicle Info Body -->
                    <div class="row g-0">
                        <div class="col-12 col-md-5 col-lg-4">
                            <div class="veh-img-container">
                                <img class="veh-img" src="<%= vehicle.getImage() %>" alt="<%= vehicle.getModel() %>">
                                <div class="price-badge">₹ <%= vehicle.getPrice() %></div>
                            </div>
                        </div>

                        <div class="col-12 col-md-7 col-lg-8">
                            <div class="p-3 p-md-4 d-flex flex-column h-100 justify-content-between">
                                <div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h4 class="fw-bold mb-1"><%= vehicle.getModel() %></h4>
                                        <span class="badge bg-dark border border-secondary">Vehicle ID: #<%= vehicle.getV_id() %></span>
                                    </div>
                                    <p class="text-muted small mb-2">
                                        <i class="fa-solid fa-location-dot me-1 text-info"></i> <%= vehicle.getArea() %>, <%= vehicle.getCity() %>, <%= vehicle.getState() %> - <%= vehicle.getZip() %>
                                    </p>

                                    <!-- Key Specs Grid -->
                                    <div class="spec-grid">
                                        <div class="spec-item">
                                            <span class="spec-label">Type</span>
                                            <span class="spec-value"><%= vehicle.getType() %></span>
                                        </div>
                                        <div class="spec-item">
                                            <span class="spec-label">Color</span>
                                            <span class="spec-value"><%= vehicle.getColor() %></span>
                                        </div>
                                        <div class="spec-item">
                                            <span class="spec-label">Fuel</span>
                                            <span class="spec-value"><%= vehicle.getFuel_type() %></span>
                                        </div>
                                        <div class="spec-item">
                                            <span class="spec-label">Gear</span>
                                            <span class="spec-value"><%= vehicle.getGear() %></span>
                                        </div>
                                        <div class="spec-item">
                                            <span class="spec-label">Reg. Date</span>
                                            <span class="spec-value"><%= vehicle.getReg_date() %></span>
                                        </div>
                                        <div class="spec-item">
                                            <span class="spec-label">Owner ID</span>
                                            <span class="spec-value">#<%= vehicle.getOwner_id() %></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Cancellation Form -->
                                <div class="pt-2">
                                    <form action="/Vehicle/orders" method="POST">
                                        <input type="hidden" name="vehicle_id" value="<%= booking.getVehicle_id() %>">
                                        <button type="submit" class="btn-cancel" name="booking_id" value="<%= booking.getBooking_id() %>">
                                            <i class="fa-solid fa-ban"></i> Cancel Booking
                                        </button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <div class="empty-orders">
                <i class="fa-solid fa-box-open text-muted mb-3" style="font-size: 3.5rem;"></i>
                <h4 class="fw-bold mb-2">No Active Orders Found</h4>
                <p class="text-muted mb-4">You haven't booked any vehicles yet. Explore available cars or bikes to make your first reservation.</p>
                <div class="d-flex justify-content-center gap-3">
                    <a href="/Vehicle/car" class="btn btn-info text-white fw-bold px-4 py-2" style="border-radius: 10px;">
                        <i class="fa-solid fa-car me-1"></i> Browse Cars
                    </a>
                    <a href="/Vehicle/bike" class="btn btn-outline-info fw-bold px-4 py-2" style="border-radius: 10px;">
                        <i class="fa-solid fa-motorcycle me-1"></i> Browse Bikes
                    </a>
                </div>
            </div>
        <% } %>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <h6 class="footer-title">Developed by Ganesh Sindagi</h6>
            <div class="social-links">
                <a href="https://www.facebook.com/ganesh.sindagi.3" target="_blank" class="social-icon"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="https://twitter.com/GaneshSindagi" target="_blank" class="social-icon"><i class="fa-brands fa-twitter"></i></a>
                <a href="https://www.instagram.com/ganesh_sindagi/" target="_blank" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
                <a href="mailto:ganeshsindagi7@gmail.com" class="social-icon"><i class="fa-solid fa-envelope"></i></a>
            </div>
            <p class="copyright-text">© Copyright MotorHub. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>