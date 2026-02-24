<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Requests | CareerSaathi</title>
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
        .request-card { background: white; border-radius: 15px; padding: 1.5rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); margin-bottom: 1.5rem; }
        .user-tag { background: #f8f9fa; padding: 0.3rem 0.8rem; border-radius: 50px; font-size: 0.8rem; font-weight: 600; color: #555; }
        .status-badge { font-size: 0.75rem; padding: 0.3rem 0.8rem; border-radius: 50px; font-weight: 700; }
        .status-pending { background: rgba(255, 193, 7, 0.1); color: #d39e00; }
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
            <a href="${pageContext.request.contextPath}/consultor/requests" class="menu-item active">
                <i class="bi bi-inbox-fill"></i> Session Requests
            </a>
            <a href="${pageContext.request.contextPath}/consultor/sessions" class="menu-item">
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
                    <h2 class="fw-bold mb-0">Pending Requests 📥</h2>
                </div>
            </div>
        </div>

        <!-- Request 1 -->
        <div class="request-card">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="d-flex align-items-center gap-3">
                        <div style="width: 60px; height: 60px; background: var(--accent-yellow); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 1.5rem;">AK</div>
                        <div>
                            <h5 class="mb-1 fw-bold">Aditya Kumar <span class="status-badge status-pending ms-2">Pending</span></h5>
                            <div class="d-flex gap-2">
                                <span class="user-tag">3rd Year CSE</span>
                                <span class="user-tag">React.js</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center border-start border-end">
                    <h6 class="fw-bold mb-0">Feb 26, 2026</h6>
                    <span class="text-muted small">04:30 PM (30 min)</span>
                </div>
                <div class="col-md-3 text-end">
                    <div class="d-flex gap-2 justify-content-end">
                        <button class="btn btn-dark btn-sm rounded-pill px-3">Accept</button>
                        <button class="btn btn-outline-danger btn-sm rounded-pill px-3">Reject</button>
                    </div>
                    <a href="#" class="extra-small text-muted mt-2 d-block text-decoration-none">Reschedule?</a>
                </div>
            </div>
            <div class="mt-4 p-3 bg-light rounded">
                <p class="mb-0 small fw-bold">Note from student:</p>
                <p class="mb-0 small text-muted">"Hi Sir, I need help with Redux state management in my final year project. I've been stuck for 2 days. Hoping to get some guidance!"</p>
            </div>
        </div>

        <!-- Request 2 -->
        <div class="request-card">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="d-flex align-items-center gap-3">
                        <div style="width: 60px; height: 60px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 1.5rem;">SS</div>
                        <div>
                            <h5 class="mb-1 fw-bold">Sneha Sharma <span class="status-badge status-pending ms-2">Pending</span></h5>
                            <div class="d-flex gap-2">
                                <span class="user-tag">Final Year</span>
                                <span class="user-tag">Interview Prep</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center border-start border-end">
                    <h6 class="fw-bold mb-0">Feb 27, 2026</h6>
                    <span class="text-muted small">11:00 AM (60 min)</span>
                </div>
                <div class="col-md-3 text-end">
                    <div class="d-flex gap-2 justify-content-end">
                        <button class="btn btn-dark btn-sm rounded-pill px-3">Accept</button>
                        <button class="btn btn-outline-danger btn-sm rounded-pill px-3">Reject</button>
                    </div>
                    <a href="#" class="extra-small text-muted mt-2 d-block text-decoration-none">Reschedule?</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
