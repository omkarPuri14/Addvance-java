<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotorHub | Dashboard</title>
    
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
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 0.8rem 2rem;
            sticky: top;
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

        /* Hero Header */
        .welcome-header {
            margin: 3rem 0 2rem 0;
        }

        .welcome-header h1 {
            font-weight: 800;
            font-size: 2.25rem;
            letter-spacing: -0.02em;
        }

        .welcome-header p {
            color: var(--text-muted);
            font-size: 1rem;
        }

        /* Dashboard Cards */
        .dashboard-card {
            background: var(--card-bg);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 18px;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
            display: flex;
            flex-direction: column;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.5);
        }

        .dashboard-card:hover {
            transform: translateY(-8px);
            border-color: rgba(0, 173, 181, 0.4);
            box-shadow: 0 20px 35px -10px rgba(0, 173, 181, 0.2);
        }

        .card-img-wrapper {
            height: 200px;
            overflow: hidden;
            position: relative;
        }

        .card-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .dashboard-card:hover .card-img-wrapper img {
            transform: scale(1.05);
        }

        .card-body-custom {
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .card-title-custom {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .card-text-custom {
            color: var(--text-muted);
            font-size: 0.9rem;
            margin-bottom: 1.5rem;
            flex-grow: 1;
        }

        .btn-action {
            background: var(--primary-accent);
            color: #ffffff;
            font-weight: 600;
            padding: 0.65rem 1.25rem;
            border-radius: 10px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: all 0.2s ease;
            border: none;
        }

        .btn-action:hover {
            background: var(--primary-hover);
            color: #ffffff;
        }

        /* Footer */
        footer {
            margin-top: auto;
            background: #090d16;
            border-top: 1px solid rgba(255, 255, 255, 0.08);
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

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-car-side me-2"></i>MotorHub</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item">
                        <a class="nav-link act-cust" href="/Vehicle/dashboard"><i class="fa-solid fa-chart-line me-1"></i> Dashboard</a>
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
    <div class="container mb-5">
        
        <!-- Welcome Section -->
        <div class="welcome-header">
            <h1>Welcome back, <%= name %> 👋</h1>
            <p>What would you like to explore today?</p>
        </div>

        <!-- Dashboard Action Cards -->
        <div class="row g-4">
            
            <!-- Cars Card -->
            <div class="col-12 col-md-4">
                <div class="dashboard-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1597404294360-feeeda04612e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2FyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Cars Marketplace">
                    </div>
                    <div class="card-body-custom">
                        <h5 class="card-title-custom">Explore Cars</h5>
                        <p class="card-text-custom">Browse verified pre-owned cars with complete details and instant ordering.</p>
                        <a href="/Vehicle/car" class="btn-action">
                            Browse Cars <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Bikes Card -->
            <div class="col-12 col-md-4">
                <div class="dashboard-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1558981403-c5f9899a28bc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmlrZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Bikes Marketplace">
                    </div>
                    <div class="card-body-custom">
                        <h5 class="card-title-custom">Explore Bikes</h5>
                        <p class="card-text-custom">Discover sports, cruiser, and everyday commuter bikes ready for riding.</p>
                        <a href="/Vehicle/bike" class="btn-action">
                            Browse Bikes <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Sell Card -->
            <div class="col-12 col-md-4">
                <div class="dashboard-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1617724054780-ef6bd6b21e17?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyJTIwb3duZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Sell Vehicle">
                    </div>
                    <div class="card-body-custom">
                        <h5 class="card-title-custom">Sell Your Vehicle</h5>
                        <p class="card-text-custom">List your car or bike on MotorHub and get genuine buyers quickly.</p>
                        <a href="/Vehicle/sell" class="btn-action">
                            List Vehicle <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <h6 class="footer-title">Developed by GuruRaj Swami</h6>
            <div class="social-links">
                <a href="https://www.facebook.com/guru.swami.33865" target="_blank" class="social-icon"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="https://www.instagram.com/guru_swami0?igsh=Zm5tajRvcnVyMHV0" target="_blank" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
                <a href="mailto:gururajswami46@gmail.com" class="social-icon"><i class="fa-solid fa-envelope"></i></a>
            </div>
            <p class="copyright-text">© Guru Vehicle Motors Private Limited. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>