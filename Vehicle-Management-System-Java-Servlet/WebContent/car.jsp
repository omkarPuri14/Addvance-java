<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.vehicle.Vehicle" %>
<%@ page import="com.vehicle.Area" %>
<%@ page import="com.vehicle.City" %>
<%@ page import="com.vehicle.State" %>
<%@ page import="com.vehicle.Zip" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotorHub | Cars</title>
    
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
            background: rgba(239, 68, 68, 0.15);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.3);
            font-weight: 600;
            padding: 0.4rem 1.2rem;
            border-radius: 8px;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .btn-logout:hover {
            background: #ef4444;
            color: #ffffff;
        }

        /* Filter Sidebar Component */
        .filter-panel {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 18px;
            padding: 1.5rem;
            position: sticky;
            top: 90px;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.4);
        }

        .filter-title {
            font-size: 1.15rem;
            font-weight: 700;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 0.75rem;
        }

        .filter-group-title {
            font-size: 0.875rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--primary-accent);
            margin-top: 1.5rem;
            margin-bottom: 0.75rem;
        }

        .form-check-label {
            font-size: 0.9rem;
            color: var(--text-muted);
            cursor: pointer;
        }

        .form-check-input:checked + .form-check-label {
            color: var(--text-light);
            font-weight: 600;
        }

        .form-check-input {
            background-color: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.2);
        }

        .form-check-input:checked {
            background-color: var(--primary-accent);
            border-color: var(--primary-accent);
        }

        .range-caption {
            display: flex;
            justify-content: space-between;
            font-size: 0.8rem;
            color: var(--text-muted);
            margin-top: 0.25rem;
        }

        /* Vehicle Cards Grid */
        .vehicle-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 18px;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.4);
            transition: all 0.3s ease;
        }

        .vehicle-card:hover {
            border-color: rgba(0, 173, 181, 0.4);
            transform: translateY(-4px);
        }

        .veh-img-container {
            height: 240px;
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

        .vehicle-card:hover .veh-img {
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

        /* Specification Badges */
        .spec-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
            gap: 0.75rem;
            padding: 1.25rem;
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
            font-size: 0.925rem;
            font-weight: 600;
            color: var(--text-light);
            margin-top: 0.15rem;
        }

        .btn-book {
            background: var(--primary-accent);
            color: #ffffff;
            font-weight: 700;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            border: none;
            width: 100%;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-book:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(0, 173, 181, 0.4);
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
                        <a class="nav-link act-cust" href="/Vehicle/car"><i class="fa-solid fa-car me-1"></i> Buy a Car</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Vehicle/bike"><i class="fa-solid fa-motorcycle me-1"></i> Buy a Bike</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Vehicle/sell"><i class="fa-solid fa-tag me-1"></i> Sell Vehicle</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Vehicle/orders"><i class="fa-solid fa-box me-1"></i> My Orders</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center gap-3">
                    <span class="user-badge"><i class="fa-solid fa-circle-user me-1"></i> <%= name %></span>
                    <a href="/Vehicle/logout" class="btn-logout"><i class="fa-solid fa-right-from-bracket me-1"></i> Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Section -->
    <div class="container my-4">
        <div class="row g-4">
            
            <!-- Filter Sidebar -->
            <div class="col-12 col-lg-3">
                <div class="filter-panel">
                    <div class="filter-title">
                        <i class="fa-solid fa-sliders text-info"></i> Search Filters
                    </div>

                    <!-- Price Filter -->
                    <form action="/Vehicle/filterpricecar" method="POST">
                        <div class="filter-group-title">Filter By Price</div>
                        <label for="customRange2" class="form-label text-muted" style="font-size: 0.85rem;">Price Threshold</label>
                        <input name="price_range" type="range" class="form-range" min="100000" max="10000000" step="5000" value="5000000" id="customRange2" onChange="this.form.submit()">
                        <div class="range-caption">
                            <span>₹ 10L</span>
                            <span>₹ 1 Cr</span>
                        </div>
                    </form>

                    <!-- Area Filter -->
                    <form action="/Vehicle/filterareacar" method="POST">
                        <% ArrayList<Area> areaList = (ArrayList)request.getAttribute("areaList"); %>
                        <% if(areaList != null && !areaList.isEmpty()){ %>
                            <div class="filter-group-title">Area</div>
                            <% for(int i=0; i<areaList.size(); i++){ %>
                                <% Area area = (Area)areaList.get(i); %>
                                <div class="form-check mb-1">
                                    <input name="area" class="form-check-input" type="checkbox" value="<%= area.getArea() %>" id="areaCheck<%= i %>" onChange="this.form.submit()">
                                    <label class="form-check-label" for="areaCheck<%= i %>">
                                        <%= area.getArea() %>
                                    </label>
                                </div>
                            <% } %>
                        <% } %>
                    </form>

                    <!-- City Filter -->
                    <form action="/Vehicle/filtercitycar" method="POST">
                        <% ArrayList<City> cityList = (ArrayList)request.getAttribute("cityList"); %>
                        <% if(cityList != null && !cityList.isEmpty()){ %>
                            <div class="filter-group-title">City</div>
                            <% for(int i=0; i<cityList.size(); i++){ %>
                                <% City city = (City)cityList.get(i); %>
                                <div class="form-check mb-1">
                                    <input name="city" class="form-check-input" type="checkbox" value="<%= city.getCity() %>" id="cityCheck<%= i %>" onChange="this.form.submit()">
                                    <label class="form-check-label" for="cityCheck<%= i %>">
                                        <%= city.getCity() %>
                                    </label>
                                </div>
                            <% } %>
                        <% } %>
                    </form>

                    <!-- State Filter -->
                    <form action="/Vehicle/filterstatecar" method="POST">
                        <% ArrayList<State> stateList = (ArrayList)request.getAttribute("stateList"); %>
                        <% if(stateList != null && !stateList.isEmpty()){ %>
                            <div class="filter-group-title">State</div>
                            <% for(int i=0; i<stateList.size(); i++){ %>
                                <% State state = (State)stateList.get(i); %>
                                <div class="form-check mb-1">
                                    <input name="state" class="form-check-input" type="checkbox" value="<%= state.getState() %>" id="stateCheck<%= i %>" onChange="this.form.submit()">
                                    <label class="form-check-label" for="stateCheck<%= i %>">
                                        <%= state.getState() %>
                                    </label>
                                </div>
                            <% } %>
                        <% } %>
                    </form>

                    <!-- Zip Filter -->
                    <form action="/Vehicle/filterzipcar" method="POST">
                        <% ArrayList<Zip> zipList = (ArrayList)request.getAttribute("zipList"); %>
                        <% if(zipList != null && !zipList.isEmpty()){ %>
                            <div class="filter-group-title">Zip Code</div>
                            <% for(int i=0; i<zipList.size(); i++){ %>
                                <% Zip zip = (Zip)zipList.get(i); %>
                                <div class="form-check mb-1">
                                    <input name="zip" class="form-check-input" type="checkbox" value="<%= zip.getZip() %>" id="zipCheck<%= i %>" onChange="this.form.submit()">
                                    <label class="form-check-label" for="zipCheck<%= i %>">
                                        <%= zip.getZip() %>
                                    </label>
                                </div>
                            <% } %>
                        <% } %>
                    </form>

                </div>
            </div>

            <!-- Vehicle Listing Area -->
            <div class="col-12 col-lg-9">
                <% ArrayList<Vehicle> carList = (ArrayList)request.getAttribute("carList"); %>
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h3 class="fw-bold mb-0">Available Cars</h3>
                    <span class="badge bg-secondary px-3 py-2 fs-6">
                        <%= (carList != null) ? carList.size() : 0 %> Vehicles
                    </span>
                </div>

                <% if(carList != null && !carList.isEmpty()) { %>
                    <% for(int i=0; i<carList.size(); i++){ %>
                        <% Vehicle car = (Vehicle)carList.get(i); %>
                        <div class="vehicle-card">
                            <div class="row g-0">
                                <div class="col-12 col-md-5">
                                    <div class="veh-img-container">
                                        <img class="veh-img" src="<%= car.getImage() %>" alt="<%= car.getModel() %>">
                                        <div class="price-badge">₹ <%= car.getPrice() %></div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-7">
                                    <div class="p-3 p-md-4 d-flex flex-column h-100 justify-content-between">
                                        <div>
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h4 class="fw-bold mb-1"><%= car.getModel() %></h4>
                                                <span class="badge bg-dark border border-secondary">ID: #<%= car.getV_id() %></span>
                                            </div>
                                            <p class="text-muted small mb-2"><i class="fa-solid fa-location-dot me-1 text-info"></i> <%= car.getArea() %>, <%= car.getCity() %>, <%= car.getState() %> - <%= car.getZip() %></p>
                                            
                                            <!-- Spec Cards Grid -->
                                            <div class="spec-grid">
                                                <div class="spec-item">
                                                    <span class="spec-label">Type</span>
                                                    <span class="spec-value"><%= car.getType() %></span>
                                                </div>
                                                <div class="spec-item">
                                                    <span class="spec-label">Color</span>
                                                    <span class="spec-value"><%= car.getColor() %></span>
                                                </div>
                                                <div class="spec-item">
                                                    <span class="spec-label">Fuel</span>
                                                    <span class="spec-value"><%= car.getFuel_type() %></span>
                                                </div>
                                                <div class="spec-item">
                                                    <span class="spec-label">Gear</span>
                                                    <span class="spec-value"><%= car.getGear() %></span>
                                                </div>
                                                <div class="spec-item">
                                                    <span class="spec-label">Reg. Date</span>
                                                    <span class="spec-value"><%= car.getReg_date() %></span>
                                                </div>
                                                <div class="spec-item">
                                                    <span class="spec-label">Owner ID</span>
                                                    <span class="spec-value">#<%= car.getOwner_id() %></span>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Booking Action Form -->
                                        <form action="/Vehicle/book" method="POST" class="mt-2">
                                            <input type="hidden" name="owner_id" value="<%= car.getOwner_id() %>">
                                            <button type="submit" class="btn-book" name="v_id" value="<%= car.getV_id() %>">
                                                <i class="fa-solid fa-calendar-check"></i> Book Vehicle
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                <% } else { %>
                    <div class="text-center py-5 rounded-4" style="background: var(--card-bg); border: 1px solid var(--border-color);">
                        <i class="fa-solid fa-car-burst text-muted mb-3" style="font-size: 3rem;"></i>
                        <h5 class="text-muted">No cars match your criteria.</h5>
                    </div>
                <% } %>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <h6 class="footer-title">Developed by Gururaj Swami</h6>
            <div class="social-links">
                <a href="https://www.facebook.com/ganesh.sindagi.3" target="_blank" class="social-icon"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="https://twitter.com/GaneshSindagi" target="_blank" class="social-icon"><i class="fa-brands fa-twitter"></i></a>
                <a href="https://www.instagram.com/ganesh_sindagi/" target="_blank" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
                <a href="mailto:ganeshsindagi7@gmail.com" class="social-icon"><i class="fa-solid fa-envelope"></i></a>
            </div>
            <p class="copyright-text">© Gururaj MotorHub. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>