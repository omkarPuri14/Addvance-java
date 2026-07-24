<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.vehicle.Vehicle" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotorHub | Sell Vehicle</title>
    
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
            --input-bg: rgba(15, 23, 42, 0.6);
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

        /* Glassmorphic Panel/Card */
        .glass-panel {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 18px;
            padding: 2rem;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.4);
            margin-bottom: 2.5rem;
        }

        .panel-header {
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 1rem;
            margin-bottom: 1.75rem;
        }

        /* Vehicle Listing Card */
        .vehicle-card {
            background: rgba(15, 23, 42, 0.5);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            overflow: hidden;
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
        }

        .vehicle-card:hover {
            border-color: rgba(0, 173, 181, 0.4);
            transform: translateY(-2px);
        }

        .veh-img-container {
            height: 100%;
            min-height: 220px;
            overflow: hidden;
            position: relative;
            background: rgba(0, 0, 0, 0.2);
        }

        .veh-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
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
            font-size: 1.05rem;
            padding: 0.35rem 0.85rem;
            border-radius: 10px;
        }

        /* Spec Badge Grid */
        .spec-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
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
            font-size: 0.725rem;
            color: var(--text-muted);
            text-transform: uppercase;
            font-weight: 600;
        }

        .spec-value {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-light);
            margin-top: 0.1rem;
        }

        /* Buttons */
        .btn-delete {
            background: var(--danger-bg);
            color: var(--danger-color);
            border: 1px solid var(--danger-border);
            font-weight: 700;
            padding: 0.6rem 1.25rem;
            border-radius: 10px;
            transition: all 0.2s ease;
            width: 100%;
        }

        .btn-delete:hover {
            background: var(--danger-color);
            color: #ffffff;
            box-shadow: 0 8px 20px -5px rgba(239, 68, 68, 0.4);
        }

        .btn-submit {
            background: var(--primary-accent);
            color: #ffffff;
            font-weight: 700;
            padding: 0.8rem 2rem;
            border-radius: 12px;
            border: none;
            transition: all 0.2s ease;
        }

        .btn-submit:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(0, 173, 181, 0.4);
        }

        /* Form Custom Styling */
        .form-label {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-muted);
            margin-bottom: 0.4rem;
        }

        .form-control, .form-select {
            background-color: var(--input-bg) !important;
            border: 1px solid var(--border-color) !important;
            color: var(--text-light) !important;
            border-radius: 10px;
            padding: 0.65rem 1rem;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-accent) !important;
            box-shadow: 0 0 0 0.25rem rgba(0, 173, 181, 0.25) !important;
        }

        .form-select option {
            background-color: var(--dark-bg);
            color: var(--text-light);
        }

        .section-divider {
            border-top: 1px dashed var(--border-color);
            margin: 2rem 0;
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
                        <a class="nav-link act-cust" href="/Vehicle/sell"><i class="fa-solid fa-tag me-1"></i> Sell Vehicle</a>
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

    <!-- Main Container -->
    <div class="container my-5">
        
        <!-- SECTION 1: Registered Vehicles List -->
        <% 
            ArrayList<Vehicle> vehicleList = (ArrayList)request.getAttribute("vehicleList"); 
            int myVehiclesCount = (vehicleList != null) ? vehicleList.size() : 0;
        %>
        
        <div class="glass-panel">
            <div class="panel-header d-flex align-items-center justify-content-between">
                <div>
                    <h3 class="fw-bold mb-1"><i class="fa-solid fa-list-check text-info me-2"></i>Your Vehicles On Sale</h3>
                    <p class="text-muted small mb-0">Manage and remove vehicles currently listed in the marketplace</p>
                </div>
                <span class="badge bg-secondary px-3 py-2 fs-6">
                    <%= myVehiclesCount %> Listed
                </span>
            </div>

            <% if(vehicleList != null && !vehicleList.isEmpty()) { %>
                <% for(int i = 0; i < vehicleList.size(); i++) { %>
                    <% Vehicle vehicle = (Vehicle)vehicleList.get(i); %>
                    <div class="vehicle-card">
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
                                            <span class="badge bg-dark border border-secondary">ID: #<%= vehicle.getV_id() %></span>
                                        </div>
                                        <p class="text-muted small mb-2">
                                            <i class="fa-solid fa-location-dot me-1 text-info"></i> <%= vehicle.getArea() %>, <%= vehicle.getCity() %>, <%= vehicle.getState() %> - <%= vehicle.getZip() %>
                                        </p>

                                        <!-- Spec Grid -->
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

                                    <!-- Delete Action -->
                                    <div class="pt-2">
                                        <form action="/Vehicle/deletevehicle" method="POST">
                                            <input type="hidden" name="owner_id" value="<%= vehicle.getOwner_id() %>">
                                            <button type="submit" class="btn-delete" name="v_id" value="<%= vehicle.getV_id() %>">
                                                <i class="fa-solid fa-trash-can me-1"></i> Delete Listing
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            <% } else { %>
                <div class="text-center py-4">
                    <i class="fa-solid fa-car-tunnel text-muted mb-3" style="font-size: 2.5rem;"></i>
                    <p class="text-muted mb-0">You haven't listed any vehicles for sale yet. Fill out the form below to add one!</p>
                </div>
            <% } %>
        </div>

        <!-- SECTION 2: Vehicle Registration Form -->
        <div class="glass-panel">
            <div class="panel-header">
                <h3 class="fw-bold mb-1"><i class="fa-solid fa-circle-plus text-info me-2"></i>Register Vehicle for Sale</h3>
                <p class="text-muted small mb-0">Complete the details below to publish your vehicle onto MotorHub</p>
            </div>

            <form action="/Vehicle/sell" method="POST">
                
                <!-- Seller Contact Information -->
                <h5 class="fw-bold text-info mb-3"><i class="fa-solid fa-address-card me-2"></i>Seller Information</h5>
                <div class="row g-3 mb-4">
                    <div class="col-12 col-md-6">
                        <label class="form-label">Full Name</label>
                        <input class="form-control" type="text" name="name" placeholder="John Doe" required>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label">Phone Number</label>
                        <input type="tel" name="phone" class="form-control" placeholder="+91 9876543210" required>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" placeholder="john@example.com" required>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label">Address</label>
                        <textarea name="address" rows="1" class="form-control" placeholder="Street name, landmark..." required></textarea>
                    </div>
                </div>

                <div class="section-divider"></div>

                <!-- Vehicle Details -->
                <h5 class="fw-bold text-info mb-3"><i class="fa-solid fa-car me-2"></i>Vehicle Specifications</h5>
                <div class="row g-3 mb-4">
                    <div class="col-12 col-md-4">
                        <label class="form-label">Vehicle Type</label>
                        <select name="type" class="form-select">
                            <option value="2">2 Wheeler (Bike)</option>
                            <option value="4">4 Wheeler (Car)</option>
                        </select>
                    </div>
                    <div class="col-12 col-md-4">
                        <label class="form-label">Model Name</label>
                        <input type="text" name="model" class="form-control" placeholder="e.g. Honda City / Royal Enfield" required>
                    </div>
                    <div class="col-12 col-md-4">
                        <label class="form-label">Color</label>
                        <input type="text" name="color" class="form-control" placeholder="e.g. Pearl White" required>
                    </div>

                    <div class="col-12 col-md-4">
                        <label class="form-label">Registration Date</label>
                        <input type="date" name="reg_date" class="form-control" required>
                    </div>
                    <div class="col-12 col-md-4">
                        <label class="form-label">Asking Price (₹)</label>
                        <input type="text" name="price" class="form-control" placeholder="e.g. 450000" required>
                    </div>
                    <div class="col-12 col-md-4">
                        <label class="form-label">Image URL</label>
                        <input type="text" name="image" class="form-control" placeholder="https://..." required>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label">Fuel Type</label>
                        <input type="text" name="fuel_type" class="form-control" placeholder="Petrol / Diesel / Electric" required>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label">Gear Type</label>
                        <input type="text" name="gear" class="form-control" placeholder="Manual / Automatic" required>
                    </div>
                </div>

                <div class="section-divider"></div>

                <!-- Location Information -->
                <h5 class="fw-bold text-info mb-3"><i class="fa-solid fa-map-location-dot me-2"></i>Location Details</h5>
                <div class="row g-3 mb-4">
                    <div class="col-12 col-md-3">
                        <label class="form-label">Area</label>
                        <input type="text" name="area" class="form-control" placeholder="e.g. Indiranagar" required>
                    </div>
                    <div class="col-12 col-md-3">
                        <label class="form-label">City</label>
                        <input type="text" name="city" class="form-control" placeholder="e.g. Bengaluru" required>
                    </div>
                    <div class="col-12 col-md-3">
                        <label class="form-label">State</label>
                        <input type="text" name="state" class="form-control" placeholder="e.g. Karnataka" required>
                    </div>
                    <div class="col-12 col-md-3">
                        <label class="form-label">Zip Code</label>
                        <input type="text" name="zip" class="form-control" placeholder="e.g. 560038" required>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="text-end pt-3">
                    <button type="submit" class="btn-submit">
                        <i class="fa-solid fa-paper-plane me-2"></i>Register Vehicle
                    </button>
                </div>
            </form>
        </div>

    </div>

    <!-- Footer -->
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