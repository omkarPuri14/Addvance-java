<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotorHub | Admin Dashboard</title>
    
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

        /* Glassmorphic Top Navbar */
        .navbar-custom {
            background: rgba(15, 23, 42, 0.85) !important;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-color);
            padding: 0.8rem 2rem;
        }

        .navbar-brand {
            font-weight: 800;
            font-size: 1.5rem;
            color: var(--primary-accent) !important;
            letter-spacing: -0.02em;
        }

        .admin-badge {
            background: rgba(239, 68, 68, 0.15);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #ef4444;
            padding: 0.2rem 0.6rem;
            border-radius: 6px;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            margin-left: 0.5rem;
        }

        .user-badge {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #f1f5f9;
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
            font-size: 0.875rem;
        }

        .btn-logout:hover {
            background: #ef4444;
            color: #ffffff;
        }

        /* Stat Header Card */
        .stat-card {
            background: linear-gradient(135deg, #1e293b 0%, rgba(0, 173, 181, 0.15) 100%);
            border: 1px solid rgba(0, 173, 181, 0.3);
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.3);
        }

        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: rgba(0, 173, 181, 0.2);
            color: var(--primary-accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }

        .stat-value {
            font-size: 2.25rem;
            font-weight: 800;
            margin-top: 0.25rem;
        }

        /* Table Dashboard Panels */
        .panel-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.4);
            margin-bottom: 2.5rem;
        }

        .panel-header {
            background: rgba(255, 255, 255, 0.02);
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .panel-title {
            font-size: 1.15rem;
            font-weight: 700;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.6rem;
        }

        /* Custom Table Styling */
        .table-custom {
            margin: 0;
            color: var(--text-light);
            vertical-align: middle;
        }

        .table-custom thead {
            background: rgba(15, 23, 42, 0.6);
            border-bottom: 1px solid var(--border-color);
        }

        .table-custom th {
            color: var(--text-muted);
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 1rem 1.5rem;
            border: none;
        }

        .table-custom td {
            padding: 1rem 1.5rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            font-size: 0.925rem;
            background: transparent;
        }

        .table-custom tbody tr {
            transition: background 0.15s ease;
        }

        .table-custom tbody tr:hover {
            background: rgba(255, 255, 255, 0.03);
        }

        .btn-delete {
            background: rgba(239, 68, 68, 0.15);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.3);
            font-weight: 600;
            padding: 0.35rem 0.85rem;
            border-radius: 8px;
            font-size: 0.825rem;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
        }

        .btn-delete:hover {
            background: #ef4444;
            color: #ffffff;
        }

        /* Footer */
        footer {
            margin-top: auto;
            background: #090d16;
            border-top: 1px solid var(--border-color);
            padding: 1.5rem 0;
            text-align: center;
            color: var(--text-muted);
            font-size: 0.85rem;
        }
    </style>
</head>

<body>

    <!-- Top Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
        <div class="container-fluid px-4">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <i class="fa-solid fa-shield-halved me-2"></i> MotorHub <span class="admin-badge">Admin</span>
            </a>
            <div class="d-flex align-items-center gap-3 ms-auto">
                <span class="user-badge">
                    <i class="fa-solid fa-user-gear me-1"></i> <%= session.getAttribute("name") %>
                </span>
                <a href="login" class="btn-logout">
                    <i class="fa-solid fa-right-from-bracket me-1"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <!-- Main Content Container -->
    <div class="container my-5">

        <!-- Quick Analytics Header -->
        <div class="row g-4 mb-4">
            <div class="col-12 col-sm-6 col-md-4">
                <div class="stat-card">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <span class="text-muted fw-semibold" style="font-size: 0.875rem;">Total Vehicle Bookings</span>
                        <div class="stat-icon">
                            <i class="fa-solid fa-receipt"></i>
                        </div>
                    </div>
                    <div class="stat-value"><%= request.getAttribute("totalBookings") %></div>
                </div>
            </div>
        </div>

        <!-- Section 1: Manage Users Panel -->
        <div class="panel-card">
            <div class="panel-header">
                <h4 class="panel-title">
                    <i class="fa-solid fa-users text-info"></i> Registered Users
                </h4>
            </div>
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("userList");
                            if (users != null && !users.isEmpty()) {
                                for (Map<String, String> u : users) {
                        %>
                        <tr>
                            <td><span class="badge bg-secondary opacity-75">#<%= u.get("id") %></span></td>
                            <td class="fw-semibold"><%= u.get("name") %></td>
                            <td class="text-muted"><%= u.get("email") %></td>
                            <td class="text-end">
                                <a href="deleteUser?id=<%= u.get("id") %>" 
                                   class="btn-delete"
                                   onclick="return confirm('Are you sure you want to delete user <%= u.get("name") %>?');">
                                   <i class="fa-regular fa-trash-can"></i> Delete
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="4" class="text-center py-4 text-muted">
                                <i class="fa-solid fa-user-slash me-2"></i> No registered users found.
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Section 2: Show All Bookings Panel -->
        <div class="panel-card">
            <div class="panel-header">
                <h4 class="panel-title">
                    <i class="fa-solid fa-car-side text-info"></i> All Vehicle Bookings
                </h4>
            </div>
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>User ID</th>
                            <th>Vehicle ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Map<String, String>> bookings = (List<Map<String, String>>) request.getAttribute("bookingList");
                            if (bookings != null && !bookings.isEmpty()) {
                                for (Map<String, String> b : bookings) {
                        %>
                        <tr>
                            <td><span class="badge bg-dark border border-secondary">#<%= b.get("order_id") %></span></td>
                            <td><i class="fa-regular fa-user text-muted me-1"></i> User #<%= b.get("user_id") %></td>
                            <td><i class="fa-solid fa-car-tunnel text-muted me-1"></i> Vehicle #<%= b.get("vehicle_id") %></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="3" class="text-center py-4 text-muted">
                                <i class="fa-solid fa-box-open me-2"></i> No bookings found in database.
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            © Guru Vehicle Motors Private Limited. All rights reserved.
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>