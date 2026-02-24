<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultee Dashboard | CareerSaathi</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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

        /* Top Header */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .user-profile-top {
            display: flex;
            align-items: center;
            gap: 1rem;
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

        /* Cards */
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            height: 100%;
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .goal-badge {
            background-color: rgba(255, 193, 7, 0.1);
            color: #d39e00;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
            display: inline-block;
        }

        .progress {
            height: 10px;
            border-radius: 5px;
        }

        .progress-bar {
            background-color: var(--accent-yellow);
        }

        .notification-item {
            padding: 1rem;
            border-bottom: 1px solid #eee;
            display: flex;
            gap: 1rem;
        }

        .notification-icon {
            color: var(--accent-yellow);
            font-size: 1.5rem;
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
            <a href="${pageContext.request.contextPath}/consultee/dashboard" class="menu-item ${activeTab == 'dashboard' ? 'active' : ''}">
                <i class="bi bi-grid-1x2-fill"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/consultee/assessment" class="menu-item ${activeTab == 'assessment' ? 'active' : ''}">
                <i class="bi bi-journal-check"></i> Career Assessment
            </a>
            <a href="${pageContext.request.contextPath}/consultee/mentors" class="menu-item ${activeTab == 'mentors' ? 'active' : ''}">
                <i class="bi bi-people-fill"></i> Explore Mentors
            </a>
            <a href="${pageContext.request.contextPath}/consultee/sessions" class="menu-item ${activeTab == 'sessions' ? 'active' : ''}">
                <i class="bi bi-calendar-event"></i> My Sessions
            </a>
            <a href="${pageContext.request.contextPath}/consultee/chat" class="menu-item ${activeTab == 'chat' ? 'active' : ''}">
                <i class="bi bi-chat-dots-fill"></i> Chat with Mentor
            </a>
            <a href="${pageContext.request.contextPath}/consultee/profile" class="menu-item ${activeTab == 'profile' ? 'active' : ''}">
                <i class="bi bi-person-fill"></i> Profile
            </a>
            <hr style="border-color: rgba(255,255,255,0.1)">
            <a href="${pageContext.request.contextPath}/logout" class="menu-item text-danger">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Header -->
        <div class="dashboard-header">
            <div class="d-flex align-items-center">
                <button id="sidebarToggle" class="mobile-toggle">
                    <i class="bi bi-list"></i>
                </button>
                <div class="header-title-area">
                    <h4 class="fw-bold mb-0">Overview</h4>
                    <p class="text-muted small mb-0">Welcome back to your career journey!</p>
                </div>
            </div>
            <div class="user-profile-top">
                <div class="text-end d-none d-md-block">
                    <h6 class="mb-0 fw-bold">${user.name}</h6>
                    <span class="text-muted small">Consultee</span>
                </div>
                <div class="avatar-circle">
                    ${user.name.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>

        <!-- 1. Welcome Section -->
        <div class="row g-4 mb-4">
            <div class="col-lg-8">
                <div class="stat-card" style="background: linear-gradient(135deg, #1a1a1a 0%, #333 100%); color: white;">
                    <h2 class="display-6 fw-bold mb-3">Welcome, ${user.name} 👋</h2>
                    <p class="mb-4 opacity-75">"The best way to predict the future is to create it." Start by exploring mentors or taking a career assessment.</p>
                    <div class="d-flex gap-3">
                        <a href="${pageContext.request.contextPath}/consultee/assessment" class="btn btn-warning fw-bold">Start Assessment</a>
                        <a href="${pageContext.request.contextPath}/consultee/mentors" class="btn btn-outline-light">Find Mentors</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="stat-card text-center">
                    <h5 class="fw-bold mb-3">Profile Completion</h5>
                    <div class="position-relative mb-3" style="height: 120px;">
                        <!-- Simple Circular Progress Mockup -->
                        <div style="font-size: 2rem; font-weight: 800; color: var(--accent-yellow); margin-top: 20px;">60%</div>
                        <p class="text-muted small">Complete your profile to get better recommendations</p>
                    </div>
                    <div class="progress mb-2">
                        <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <a href="${pageContext.request.contextPath}/consultee/profile" class="btn btn-sm btn-link text-warning p-0">Complete Now →</a>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-4">
            <!-- 2. Chat with Mentor -->
            <div class="col-md-6 col-lg-4">
                <div class="stat-card border-start border-primary border-5">
                    <div class="d-flex justify-content-between mb-3">
                        <h6 class="fw-bold">Chat with Mentor</h6>
                        <span class="badge bg-danger rounded-pill">3 New</span>
                    </div>
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="avatar-circle" style="width: 35px; height: 35px; background-color: #eee;">SK</div>
                        <div>
                            <p class="mb-0 small fw-bold">Sarah Khan</p>
                            <p class="mb-0 extra-small text-muted">"How is your project going?"</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="avatar-circle" style="width: 35px; height: 35px; background-color: #eee;">AM</div>
                        <div>
                            <p class="mb-0 small fw-bold">Aman Verma</p>
                            <p class="mb-0 extra-small text-muted">"Shared the roadmap document."</p>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/consultee/chat" class="btn btn-warning btn-sm w-100 mt-2 fw-bold">Open Messenger</a>
                </div>
            </div>

            <!-- 3. Upcoming Consultation -->
            <div class="col-md-6 col-lg-4">
                <div class="stat-card border-start border-warning border-5">
                    <h6 class="fw-bold mb-3">Upcoming Session</h6>
                    <div class="d-flex align-items-center gap-3">
                        <div class="avatar-circle" style="width: 40px; height: 40px; font-size: 0.9rem;">JD</div>
                        <div>
                            <h6 class="mb-0 fw-bold">John Doe</h6>
                            <p class="text-muted small mb-0">Senior SDE @ Google</p>
                        </div>
                    </div>
                    <div class="mt-3 py-2 bg-light rounded text-center">
                        <i class="bi bi-calendar3 me-2 text-warning"></i>
                        <span class="fw-bold">Tomorrow, 10:30 AM</span>
                    </div>
                    <button class="btn btn-dark btn-sm w-100 mt-3">Join Meeting</button>
                </div>
            </div>

            <!-- 4. Notifications Feed -->
            <div class="col-md-12 col-lg-4">
                <div class="stat-card p-0">
                    <div class="p-3 border-bottom d-flex justify-content-between">
                        <h6 class="fw-bold mb-0">Notifications</h6>
                        <span class="badge bg-warning text-dark">2 New</span>
                    </div>
                    <div class="notification-feed" style="max-height: 250px; overflow-y: auto;">
                        <div class="notification-item">
                            <i class="bi bi-check-circle-fill notification-icon"></i>
                            <div>
                                <p class="mb-0 small fw-bold">Mentor session confirmed</p>
                                <span class="text-muted extra-small" style="font-size: 0.75rem;">10 mins ago</span>
                            </div>
                        </div>
                        <div class="notification-item">
                            <i class="bi bi-lightbulb-fill notification-icon"></i>
                            <div>
                                <p class="mb-0 small fw-bold">New Roadmap available for AI Engineers</p>
                                <span class="text-muted extra-small" style="font-size: 0.75rem;">2 hours ago</span>
                            </div>
                        </div>
                    </div>
                    <div class="p-2 text-center">
                        <a href="#" class="text-muted small text-decoration-none">View All</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Career Insights / Core Feature Teaser -->
        <div class="row g-4">
            <div class="col-12">
                <div class="stat-card">
                    <h5 class="fw-bold mb-4">Core Features</h5>
                    <div class="row g-4 text-center">
                        <div class="col-md-3">
                            <div class="p-3 rounded bg-light">
                                <i class="bi bi-stars fs-2 text-warning"></i>
                                <h6 class="mt-2 fw-bold">AI Assessment</h6>
                                <p class="extra-small text-muted mb-0">Discover your strengths</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="p-3 rounded bg-light">
                                <i class="bi bi-search fs-2 text-warning"></i>
                                <h6 class="mt-2 fw-bold">Mentor Match</h6>
                                <p class="extra-small text-muted mb-0">Find the right guide</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="p-3 rounded bg-light">
                                <i class="bi bi-signpost-split fs-2 text-warning"></i>
                                <h6 class="mt-2 fw-bold">Smart Roadmaps</h6>
                                <p class="extra-small text-muted mb-0">Step-by-step guidance</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="p-3 rounded bg-light">
                                <i class="bi bi-chat-dots fs-2 text-warning"></i>
                                <h6 class="mt-2 fw-bold">Live Chat</h6>
                                <p class="extra-small text-muted mb-0">Instant doubt solving</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
