<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Dashboard | CareerSaathi</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <script src="${pageContext.request.contextPath}/js/dashboard.js" defer></script>
    <style>
        :root {
            --sidebar-width: 280px;
            --primary-dark: #1a1a1a;
            --accent-yellow: #ffc107;
            --text-gray: #6c757d;
        }

        body {
            background-color: #f4f7f6;
            font-family: 'Inter', sans-serif;
            overflow-x: hidden;
        }

        /* Sidebar Styling */
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background-color: var(--primary-dark);
            color: white;
            transition: all 0.3s;
            z-index: 1000;
            display: flex;
            flex-direction: column;
        }

        .sidebar-header {
            padding: 2rem;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-brand {
            font-size: 1.5rem;
            font-weight: 700;
            color: white;
            text-decoration: none;
        }

        .sidebar-menu {
            flex-grow: 1;
            padding: 1.5rem 0;
            overflow-y: auto;
        }

        .menu-item {
            padding: 0.8rem 2rem;
            display: flex;
            align-items: center;
            color: rgba(255,255,255,0.7);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 4px solid transparent;
        }

        .menu-item i {
            margin-right: 1rem;
            font-size: 1.2rem;
        }

        .menu-item:hover, .menu-item.active {
            color: var(--accent-yellow);
            background-color: rgba(255,255,255,0.05);
            border-left-color: var(--accent-yellow);
        }

        /* Main Content Styling */
        .main-content {
            margin-left: var(--sidebar-width);
            padding: 2rem;
            transition: all 0.3s;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            height: 100%;
            transition: transform 0.3s;
        }

        .stat-card:hover { transform: translateY(-5px); }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: rgba(255, 193, 7, 0.1);
            color: var(--accent-yellow);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .avatar-circle {
            width: 45px;
            height: 45px;
            background-color: var(--accent-yellow);
            color: var(--primary-dark);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
        }

        .notification-item {
            padding: 1rem;
            border-bottom: 1px solid #eee;
            display: flex;
            gap: 1rem;
        }


    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <a href="${pageContext.request.contextPath}/home" class="sidebar-brand">
                <span>Career</span><span style="color: var(--accent-yellow)">Saathi</span>
            </a>
        </div>
        <div class="sidebar-menu">
            <a href="${pageContext.request.contextPath}/consultor/dashboard" class="menu-item ${activeTab == 'dashboard' ? 'active' : ''}">
                <i class="bi bi-grid-1x2-fill"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/consultor/profile" class="menu-item ${activeTab == 'profile' ? 'active' : ''}">
                <i class="bi bi-person-circle"></i> Profile
            </a>
            <a href="${pageContext.request.contextPath}/consultor/availability" class="menu-item ${activeTab == 'availability' ? 'active' : ''}">
                <i class="bi bi-calendar-check"></i> Availability
            </a>
            <a href="${pageContext.request.contextPath}/consultor/requests" class="menu-item ${activeTab == 'requests' ? 'active' : ''}">
                <i class="bi bi-inbox-fill"></i> Session Requests
            </a>
            <a href="${pageContext.request.contextPath}/consultor/sessions" class="menu-item ${activeTab == 'sessions' ? 'active' : ''}">
                <i class="bi bi-journal-text"></i> My Sessions
            </a>
            <a href="${pageContext.request.contextPath}/consultor/analytics" class="menu-item ${activeTab == 'analytics' ? 'active' : ''}">
                <i class="bi bi-bar-chart-fill"></i> Analytics
            </a>
            <a href="${pageContext.request.contextPath}/consultor/reviews" class="menu-item ${activeTab == 'reviews' ? 'active' : ''}">
                <i class="bi bi-star-fill"></i> Reviews
            </a>
            <a href="${pageContext.request.contextPath}/consultor/earnings" class="menu-item ${activeTab == 'earnings' ? 'active' : ''}">
                <i class="bi bi-cash-stack"></i> Earnings
            </a>
            <a href="${pageContext.request.contextPath}/consultor/chat" class="menu-item ${activeTab == 'chat' ? 'active' : ''}">
                <i class="bi bi-chat-dots-fill"></i> Chat
            </a>
            <hr style="border-color: rgba(255,255,255,0.1)">
            <a href="${pageContext.request.contextPath}/logout" class="menu-item text-danger">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-header">
            <div class="d-flex align-items-center">
                <button id="sidebarToggle" class="mobile-toggle">
                    <i class="bi bi-list"></i>
                </button>
                <div class="header-title-area">
                    <h4 class="fw-bold mb-0">Mentor Dashboard</h4>
                    <p class="text-muted small mb-0">Managing your expertise has never been easier.</p>
                </div>
            </div>
            <div class="user-profile-top">
                <div class="text-end d-none d-md-block">
                    <h6 class="mb-0 fw-bold">${user.name}</h6>
                    <span class="text-muted small">Mentor</span>
                </div>
                <div class="avatar-circle">
                    ${user.name.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>

        <!-- 1. Overview Section -->
        <div class="row g-4 mb-4">
            <div class="col-lg-8">
                <div class="stat-card" style="background: linear-gradient(135deg, #1a1a1a 0%, #444 100%); color: white;">
                    <div class="row align-items-center">
                        <div class="col-md-7">
                            <h2 class="display-6 fw-bold mb-3">Welcome, ${user.name} 👋</h2>
                            <p class="opacity-75 mb-4">You have <strong>3 new session requests</strong> today. Your current average rating is looking great!</p>
                            <div class="d-flex gap-4">
                                <div>
                                    <h4 class="mb-0 fw-bold">4.8 ⭐</h4>
                                    <span class="small opacity-75">Avg Rating</span>
                                </div>
                                <div>
                                    <h4 class="mb-0 fw-bold">12</h4>
                                    <span class="small opacity-75">Sessions (Month)</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 d-none d-md-block text-center">
                            <i class="bi bi-trophy" style="font-size: 5rem; color: var(--accent-yellow); opacity: 0.5;"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="stat-card">
                    <h5 class="fw-bold mb-4">Quick Stats</h5>
                    <div class="row g-3">
                        <div class="col-6">
                            <div class="p-3 bg-light rounded text-center">
                                <h4 class="fw-bold mb-0">₹18,000</h4>
                                <span class="extra-small text-muted">Total Earnings</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-3 bg-light rounded text-center">
                                <h4 class="fw-bold mb-0">240</h4>
                                <span class="extra-small text-muted">Profile Views</span>
                            </div>
                        </div>
                        <div class="col-12 mt-3 text-center">
                            <a href="${pageContext.request.contextPath}/consultor/analytics" class="btn btn-warning btn-sm w-100 fw-bold">View Full Analytics</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-4">
            <!-- 2. Today's Sessions -->
            <div class="col-md-6 col-lg-8">
                <div class="stat-card">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0">Today's Sessions</h5>
                        <a href="${pageContext.request.contextPath}/consultor/sessions" class="small text-warning text-decoration-none">View All</a>
                    </div>
                    <div class="session-list">
                        <div class="d-flex align-items-center justify-content-between p-3 bg-light rounded mb-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="avatar-circle" style="width: 40px; height: 40px; background-color: #eee;">RM</div>
                                <div>
                                    <h6 class="mb-0 fw-bold">Rahul Mishra</h6>
                                    <span class="extra-small text-muted">React.js Portfolio Review</span>
                                </div>
                            </div>
                            <div class="text-end">
                                <span class="fw-bold d-block">10:30 AM</span>
                                <span class="badge bg-success small">Upcoming</span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center justify-content-between p-3 bg-light rounded">
                            <div class="d-flex align-items-center gap-3">
                                <div class="avatar-circle" style="width: 40px; height: 40px; background-color: #eee;">SP</div>
                                <div>
                                    <h6 class="mb-0 fw-bold">Sneha Patil</h6>
                                    <span class="extra-small text-muted">Backend Design Strategy</span>
                                </div>
                            </div>
                            <div class="text-end">
                                <span class="fw-bold d-block">03:00 PM</span>
                                <span class="badge bg-warning text-dark small">Pending</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 3. Notifications Feed -->
            <div class="col-md-6 col-lg-4">
                <div class="stat-card p-0">
                    <div class="p-3 border-bottom d-flex justify-content-between">
                        <h6 class="fw-bold mb-0">Notifications</h6>
                        <span class="badge bg-warning text-dark">2 New</span>
                    </div>
                    <div class="notification-feed" style="max-height: 250px; overflow-y: auto;">
                        <div class="notification-item">
                            <i class="bi bi-calendar-plus text-warning" style="font-size: 1.2rem;"></i>
                            <div>
                                <p class="mb-0 small fw-bold">New Booking Request</p>
                                <span class="text-muted extra-small">Aditya wants a session on Feb 26</span>
                            </div>
                        </div>
                        <div class="notification-item">
                            <i class="bi bi-star-fill text-warning" style="font-size: 1.2rem;"></i>
                            <div>
                                <p class="mb-0 small fw-bold">New 5-Star Review!</p>
                                <span class="text-muted extra-small">"Best mentor for system design"</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
