<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Sessions | CareerSaathi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <script src="${pageContext.request.contextPath}/js/dashboard.js" defer></script>
    <style>
        :root { --sidebar-width: 280px; --primary-dark: #1a1a1a; --accent-yellow: #ffc107; }
        body { background-color: #f4f7f6; font-family: 'Inter', sans-serif; }
        .sidebar { width: var(--sidebar-width); height: 100vh; position: fixed; left: 0; top: 0; background-color: var(--primary-dark); color: white; display: flex; flex-direction: column; z-index: 1000; }
        .sidebar-header { padding: 2rem; text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .sidebar-brand { font-size: 1.5rem; font-weight: 700; color: white; text-decoration: none; }
        .menu-item { padding: 0.8rem 2rem; display: flex; align-items: center; color: rgba(255,255,255,0.7); text-decoration: none; border-left: 4px solid transparent; transition: 0.3s;}
        .menu-item i { margin-right: 1rem; font-size: 1.2rem; }
        .menu-item:hover, .menu-item.active { color: var(--accent-yellow); background-color: rgba(255,255,255,0.05); border-left-color: var(--accent-yellow); }
        .main-content { margin-left: var(--sidebar-width); padding: 2.5rem; }
        .session-item { background: white; border-radius: 12px; padding: 1.2rem; margin-bottom: 1rem; display: flex; align-items: center; justify-content: space-between; border-left: 5px solid #ffc107; box-shadow: 0 2px 10px rgba(0,0,0,0.03); }
        .session-item.completed { border-left-color: #198754; opacity: 0.8; }
        .session-item.cancelled { border-left-color: #dc3545; }
        .status-pill { font-size: 0.7rem; padding: 0.2rem 0.6rem; border-radius: 50px; font-weight: 800; }
    </style>
</head>
<body>

    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <a href="${pageContext.request.contextPath}/home" class="sidebar-brand">
                <span>Career</span><span style="color: var(--accent-yellow)">Saathi</span>
            </a>
        </div>
        <div class="sidebar-menu">
            <a href="${pageContext.request.contextPath}/consultor/dashboard" class="menu-item">
                <i class="bi bi-grid-1x2-fill"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/consultor/profile" class="menu-item">
                <i class="bi bi-person-circle"></i> Profile
            </a>
            <a href="${pageContext.request.contextPath}/consultor/availability" class="menu-item">
                <i class="bi bi-calendar-check"></i> Availability
            </a>
            <a href="${pageContext.request.contextPath}/consultor/requests" class="menu-item">
                <i class="bi bi-inbox-fill"></i> Session Requests
            </a>
            <a href="${pageContext.request.contextPath}/consultor/sessions" class="menu-item active">
                <i class="bi bi-journal-text"></i> My Sessions
            </a>
            <a href="${pageContext.request.contextPath}/consultor/analytics" class="menu-item">
                <i class="bi bi-bar-chart-fill"></i> Analytics
            </a>
            <a href="${pageContext.request.contextPath}/consultor/reviews" class="menu-item">
                <i class="bi bi-star-fill"></i> Reviews
            </a>
            <a href="${pageContext.request.contextPath}/consultor/earnings" class="menu-item">
                <i class="bi bi-cash-stack"></i> Earnings
            </a>
            <a href="${pageContext.request.contextPath}/consultor/chat" class="menu-item">
                <i class="bi bi-chat-dots-fill"></i> Chat
            </a>
            <hr style="border-color: rgba(255,255,255,0.1)">
            <a href="${pageContext.request.contextPath}/logout" class="menu-item text-danger">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>

    <div class="main-content">
        <div class="dashboard-header mb-4">
            <div class="d-flex align-items-center">
                <button id="sidebarToggle" class="mobile-toggle">
                    <i class="bi bi-list"></i>
                </button>
                <div class="header-title-area">
                    <h2 class="fw-bold mb-0">My Sessions 🗓️</h2>
                </div>
            </div>
        </div>

        <div class="mb-5">
            <h6 class="fw-bold text-muted text-uppercase mb-3" style="font-size: 0.8rem; letter-spacing: 1px;">Upcoming Sessions</h6>
            <div class="session-item">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 45px; height: 45px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">AK</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Aditya Kumar</h6>
                        <span class="extra-small text-muted">Web Development Roadmap</span>
                    </div>
                </div>
                <div class="text-center">
                    <h6 class="mb-0 fw-bold">Today</h6>
                    <span class="extra-small text-muted">04:30 PM</span>
                </div>
                <div class="d-flex gap-2">
                    <button class="btn btn-dark btn-sm rounded-pill px-4">Start Session</button>
                    <button class="btn btn-outline-warning btn-sm rounded-pill px-3">Reschedule</button>
                </div>
            </div>
        </div>

        <div class="mb-5">
            <h6 class="fw-bold text-muted text-uppercase mb-3" style="font-size: 0.8rem; letter-spacing: 1px;">Completed Sessions</h6>
            <div class="session-item completed">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 45px; height: 45px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">RP</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Riya Pandey</h6>
                        <span class="extra-small text-muted">UI/UX Feedback</span>
                    </div>
                </div>
                <div class="text-center">
                    <h6 class="mb-0 fw-bold">Feb 20, 2026</h6>
                    <span class="extra-small text-muted">02:00 PM</span>
                </div>
                <div>
                    <span class="badge bg-success small py-2 px-3">Completed</span>
                    <button class="btn btn-link btn-sm text-dark text-decoration-none ms-2"><i class="bi bi-file-earmark-text"></i> Notes</button>
                </div>
            </div>
            <div class="session-item completed">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 45px; height: 45px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">MK</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Manish Kumar</h6>
                        <span class="extra-small text-muted">Java Basics Doubt</span>
                    </div>
                </div>
                <div class="text-center">
                    <h6 class="mb-0 fw-bold">Feb 18, 2026</h6>
                    <span class="extra-small text-muted">10:00 AM</span>
                </div>
                <div>
                    <span class="badge bg-success small py-2 px-3">Completed</span>
                </div>
            </div>
        </div>

        <div>
            <h6 class="fw-bold text-muted text-uppercase mb-3" style="font-size: 0.8rem; letter-spacing: 1px;">Cancelled Sessions</h6>
            <div class="session-item cancelled">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 45px; height: 45px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">VJ</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Vikram Jha</h6>
                        <span class="extra-small text-muted">Career Discussion</span>
                    </div>
                </div>
                <div class="text-center">
                    <h6 class="mb-0 fw-bold">Feb 15, 2026</h6>
                    <span class="extra-small text-muted">Cancelled by Mentor</span>
                </div>
                <div>
                    <span class="badge bg-danger small py-2 px-3">Cancelled</span>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
