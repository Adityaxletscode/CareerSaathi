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
        .sidebar { width: var(--sidebar-width); height: 100vh; position: fixed; left: 0; top: 0; background-color: var(--primary-dark); color: white; display: flex; flex-direction: column; z-index: 1000;}
        .sidebar-header { padding: 2rem; text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .sidebar-brand { font-size: 1.5rem; font-weight: 700; color: white; text-decoration: none; }
        .menu-item { padding: 0.8rem 2rem; display: flex; align-items: center; color: rgba(255,255,255,0.7); text-decoration: none; border-left: 4px solid transparent;}
        .menu-item i { margin-right: 1rem; font-size: 1.2rem; }
        .menu-item:hover, .menu-item.active { color: var(--accent-yellow); background-color: rgba(255,255,255,0.05); border-left-color: var(--accent-yellow); }
        .main-content { margin-left: var(--sidebar-width); padding: 2.5rem; }
        .session-card { background: white; border-radius: 15px; padding: 1.2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); margin-bottom: 1rem; border-left: 5px solid #ffc107; }
        .past { border-left-color: #6c757d; opacity: 0.8; }
        .status-badge { font-size: 0.75rem; padding: 0.2rem 0.6rem; border-radius: 50px; font-weight: 600; }
        .status-confirmed { background: rgba(25, 135, 84, 0.1); color: #198754; }
        .status-completed { background: rgba(108, 117, 125, 0.1); color: #6c757d; }
    </style>
</head>
<body>

    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <a href="${pageContext.request.contextPath}/home" class="sidebar-brand">
                <span>Career</span><span style="color: var(--accent-yellow)">Saathi</span>
            </a>
        </div>
        <div class="sidebar-menu mt-4">
            <a href="${pageContext.request.contextPath}/consultee/dashboard" class="menu-item">
                <i class="bi bi-grid-1x2-fill"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/consultee/assessment" class="menu-item">
                <i class="bi bi-journal-check"></i> Career Assessment
            </a>
            <a href="${pageContext.request.contextPath}/consultee/mentors" class="menu-item">
                <i class="bi bi-people-fill"></i> Explore Mentors
            </a>
            <a href="${pageContext.request.contextPath}/consultee/sessions" class="menu-item active">
                <i class="bi bi-calendar-event"></i> My Sessions
            </a>
            <a href="${pageContext.request.contextPath}/consultee/chat" class="menu-item">
                <i class="bi bi-chat-dots-fill"></i> Chat with Mentor
            </a>
            <a href="${pageContext.request.contextPath}/consultee/profile" class="menu-item">
                <i class="bi bi-person-fill"></i> Profile
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
                    <h2 class="fw-bold mb-0">My Sessions 📅</h2>
                </div>
            </div>
        </div>

        <div class="mb-5">
            <h6 class="text-muted text-uppercase small fw-bold mb-3">Upcoming Sessions</h6>
            <div class="session-card d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 50px; height: 50px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">JD</div>
                    <div>
                        <h6 class="mb-0 fw-bold">John Doe</h6>
                        <p class="text-muted small mb-0">System Design Interview Prep</p>
                    </div>
                </div>
                <div class="text-center px-4 border-start border-end">
                    <h6 class="mb-0 fw-bold">Feb 25, 2026</h6>
                    <span class="text-muted small">10:30 AM (30 min)</span>
                </div>
                <div class="d-flex gap-2 align-items-center">
                    <span class="status-badge status-confirmed me-3">Confirmed</span>
                    <button class="btn btn-dark btn-sm rounded-pill px-4">Join Hub</button>
                    <button class="btn btn-outline-danger btn-sm rounded-pill"><i class="bi bi-x-lg"></i></button>
                </div>
            </div>
        </div>

        <div>
            <h6 class="text-muted text-uppercase small fw-bold mb-3">Past Sessions</h6>
            <div class="session-card past d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 50px; height: 50px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">SK</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Sarah Khan</h6>
                        <p class="text-muted small mb-0">Resume Review Session</p>
                    </div>
                </div>
                <div class="text-center px-4 border-start border-end">
                    <h6 class="mb-0 fw-bold">Feb 15, 2026</h6>
                    <span class="text-muted small">04:00 PM</span>
                </div>
                <div>
                    <span class="status-badge status-completed me-3">Completed</span>
                    <button class="btn btn-outline-dark btn-sm rounded-pill">View Recording</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
