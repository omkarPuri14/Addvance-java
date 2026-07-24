<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Motor-Hub | Buy & Sell Vehicles</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts & Font Awesome Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-color: #6366f1;
            --primary-hover: #4f46e5;
            --dark-bg: #0f172a;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--dark-bg);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-x: hidden;
            position: relative;
            margin: 0;
        }

        /* Ambient Background Glow Effects */
        .glow-1 {
            position: absolute;
            width: 350px;
            height: 350px;
            background: rgba(99, 102, 241, 0.35);
            filter: blur(120px);
            border-radius: 50%;
            top: 10%;
            left: 15%;
            z-index: 0;
        }

        .glow-2 {
            position: absolute;
            width: 400px;
            height: 400px;
            background: rgba(236, 72, 153, 0.25);
            filter: blur(140px);
            border-radius: 50%;
            bottom: 10%;
            right: 15%;
            z-index: 0;
        }

        /* Glassmorphism Hero Card */
        .hero-card {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 3rem 2.5rem;
            max-width: 520px;
            width: 90%;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            text-align: center;
            color: #ffffff;
        }

        /* Image Styling with Glow Frame */
        .img-wrapper {
            position: relative;
            width: 140px;
            height: 140px;
            margin: 0 auto 1.75rem auto;
        }

        .card-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        /* Typography */
        .brand-title {
            font-weight: 800;
            font-size: 2.5rem;
            letter-spacing: -0.02em;
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, #ffffff 0%, #cbd5e1 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .subtitle {
            color: #94a3b8;
            font-size: 1.05rem;
            font-weight: 500;
            line-height: 1.6;
            margin-bottom: 2rem;
        }

        .action-heading {
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: #64748b;
            font-weight: 700;
            margin-bottom: 1.25rem;
        }

        /* Buttons Styling */
        .btn-group-custom {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn-custom {
            padding: 0.85rem 1.75rem;
            font-weight: 600;
            font-size: 1rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            width: 50%;
        }

        .btn-primary-custom {
            background: var(--primary-color);
            color: #ffffff;
            border: none;
            box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
        }

        .btn-primary-custom:hover {
            background: var(--primary-hover);
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 15px 25px -5px rgba(99, 102, 241, 0.5);
        }

        .btn-outline-custom {
            background: rgba(255, 255, 255, 0.05);
            color: #ffffff;
            border: 1px solid rgba(255, 255, 255, 0.15);
        }

        .btn-outline-custom:hover {
            background: rgba(255, 255, 255, 0.12);
            color: #ffffff;
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        /* Features Badges */
        .features-list {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            color: #64748b;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .feature-item i {
            color: #22c55e;
        }
    </style>
</head>

<body>

    <!-- Ambient background glows -->
    <div class="glow-1"></div>
    <div class="glow-2"></div>

    <!-- Main Card Container -->
    <div class="hero-card">
        
        <!-- Profile Image -->
        <div class="img-wrapper">
            <img src="https://images.unsplash.com/photo-1510883056135-32472f0e11b8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fGNhcnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" 
                 class="card-img" 
                 alt="Motor-Hub Banner">
        </div>

        <!-- Heading & Subtitle -->
        <h1 class="brand-title">Motor-Hub</h1>
        <p class="subtitle">The fast and secure marketplace to buy and sell cars and bikes effortlessly.</p>

        <!-- Action Section -->
        <div class="action-heading">Get Started</div>
        
        <div class="btn-group-custom">
            <a href="/Vehicle/login" class="btn-custom btn-primary-custom">
                <i class="fa-solid fa-right-to-bracket"></i> Login
            </a>
            <a href="/Vehicle/register" class="btn-custom btn-outline-custom">
                <i class="fa-solid fa-user-plus"></i> Register
            </a>
        </div>

        <!-- Trust Badges -->
        <div class="features-list">
            <div class="feature-item">
                <i class="fa-solid fa-shield-halved"></i> 100% Secure
            </div>
            <div class="feature-item">
                <i class="fa-solid fa-bolt"></i> Fast Transactions
            </div>
        </div>

    </div>

</body>
</html>