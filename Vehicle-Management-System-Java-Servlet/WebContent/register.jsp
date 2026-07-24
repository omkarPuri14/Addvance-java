<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotorHub | Register</title>
    
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
            --card-bg: rgba(30, 41, 59, 0.7);
            --text-light: #f8fafc;
            --text-muted: #94a3b8;
            --input-bg: #1e293b;
            --border-color: rgba(255, 255, 255, 0.1);
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--dark-bg);
            background-image: 
                radial-gradient(at 0% 0%, rgba(0, 173, 181, 0.15) 0px, transparent 50%),
                radial-gradient(at 100% 100%, rgba(15, 23, 42, 0.8) 0px, transparent 50%);
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            margin: 0;
        }

        .register-wrapper {
            width: 100%;
            max-width: 440px;
        }

        /* Brand Header */
        .brand-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .brand-logo {
            font-size: 2.25rem;
            font-weight: 800;
            color: var(--primary-accent);
            letter-spacing: -0.02em;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .brand-subtitle {
            color: var(--text-muted);
            font-size: 0.95rem;
            margin-top: 0.25rem;
        }

        /* Glassmorphic Register Card */
        .register-card {
            background: var(--card-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 2.5rem 2rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }

        .card-title-custom {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .card-desc {
            color: var(--text-muted);
            font-size: 0.875rem;
            margin-bottom: 1.75rem;
        }

        /* Form Controls */
        .form-label {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-light);
            margin-bottom: 0.5rem;
        }

        .input-group-custom {
            position: relative;
            margin-bottom: 1.25rem;
        }

        .input-group-text-custom {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            z-index: 10;
            font-size: 1rem;
        }

        .form-control-custom {
            background-color: var(--input-bg);
            border: 1px solid var(--border-color);
            color: var(--text-light);
            border-radius: 12px;
            padding: 0.75rem 1rem 0.75rem 2.75rem;
            font-size: 0.95rem;
            width: 100%;
            transition: all 0.2s ease;
        }

        .form-control-custom:focus {
            background-color: var(--input-bg);
            border-color: var(--primary-accent);
            color: var(--text-light);
            box-shadow: 0 0 0 4px rgba(0, 173, 181, 0.15);
            outline: none;
        }

        .form-control-custom::placeholder {
            color: #64748b;
        }

        .form-hint {
            color: var(--text-muted);
            font-size: 0.775rem;
            margin-top: 0.35rem;
            display: block;
        }

        /* Submit Button */
        .btn-submit {
            background-color: var(--primary-accent);
            color: #ffffff;
            font-weight: 700;
            font-size: 1rem;
            padding: 0.8rem 1.5rem;
            border-radius: 12px;
            border: none;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.2s ease;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(0, 173, 181, 0.4);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.875rem;
            color: var(--text-muted);
        }

        .login-link a {
            color: var(--primary-accent);
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* Footer Copyright */
        .register-footer {
            text-align: center;
            margin-top: 2rem;
            color: var(--text-muted);
            font-size: 0.825rem;
        }
    </style>
</head>

<body>

    <div class="register-wrapper">
        
        <!-- Brand Header -->
        <div class="brand-header">
            <a href="#" class="brand-logo">
                <i class="fa-solid fa-car-side"></i> MotorHub
            </a>
            <p class="brand-subtitle">Vehicle Management Portal</p>
        </div>

        <!-- Register Card -->
        <div class="register-card">
            <h2 class="card-title-custom">Create Account</h2>
            <p class="card-desc">Enter your details to register as a new user</p>

            <form action="/Vehicle/register" method="POST">
                
                <!-- Name Field -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <div class="input-group-custom">
                        <i class="fa-regular fa-user input-group-text-custom"></i>
                        <input 
                            name="name" 
                            type="text" 
                            class="form-control-custom" 
                            placeholder="John Doe"
                            required
                        >
                    </div>
                </div>

                <!-- Email Field -->
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email Address</label>
                    <div class="input-group-custom">
                        <i class="fa-regular fa-envelope input-group-text-custom"></i>
                        <input 
                            name="email" 
                            type="email" 
                            class="form-control-custom" 
                            id="exampleInputEmail1" 
                            placeholder="name@example.com"
                            required
                        >
                    </div>
                    <span class="form-hint"><i class="fa-solid fa-shield-halved me-1"></i> We'll never share your email with anyone else.</span>
                </div>

                <!-- Password Field -->
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <div class="input-group-custom">
                        <i class="fa-solid fa-lock input-group-text-custom"></i>
                        <input 
                            name="password" 
                            type="password" 
                            class="form-control-custom" 
                            id="exampleInputPassword1" 
                            placeholder="••••••••"
                            required
                        >
                    </div>
                </div>

                <!-- Submit Button -->
                <button id="signup" type="submit" class="btn-submit">
                    <span>Register</span>
                    <i class="fa-solid fa-user-plus"></i>
                </button>

            </form>

            <div class="login-link">
                Already have an account? <a href="/Vehicle/login">Sign In</a>
            </div>
        </div>

        <!-- Footer -->
        <div class="register-footer">
            © Guru Vehicle Motors Private Limited
        </div>

    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>