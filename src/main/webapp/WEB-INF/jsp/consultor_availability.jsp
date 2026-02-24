<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Availability Management | CareerSaathi</title>
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
        .card-custom { background: white; border-radius: 15px; padding: 2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .day-row { border-bottom: 1px solid #eee; padding: 1.5rem 0; display: flex; align-items: center; justify-content: space-between; }
        .day-row:last-child { border-bottom: none; }
        .slot-pill { background: rgba(255, 193, 7, 0.1); color: #d39e00; border: 1px solid #ffc107; padding: 0.3rem 0.8rem; border-radius: 50px; font-size: 0.85rem; font-weight: 600; cursor: pointer; display: flex; align-items: center; gap: 0.5rem; }
        .slot-pill:hover { background: #ffc107; color: #000; }
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
            <a href="${pageContext.request.contextPath}/consultor/availability" class="menu-item active">
                <i class="bi bi-calendar-check"></i> Availability
            </a>
            <a href="${pageContext.request.contextPath}/consultor/requests" class="menu-item">
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
        <div class="dashboard-header mb-5">
            <div class="d-flex align-items-center">
                <button id="sidebarToggle" class="mobile-toggle">
                    <i class="bi bi-list"></i>
                </button>
                <div class="header-title-area">
                    <h2 class="fw-bold mb-0">Weekly Availability ⏰</h2>
                    <p class="text-muted mb-0">Set your working hours and manage your session slots.</p>
                </div>
            </div>
            <div class="d-flex gap-3">
                <select class="form-select form-select-sm" style="width: 150px;">
                    <option>30 min slots</option>
                    <option>60 min slots</option>
                </select>
                <button class="btn btn-warning fw-bold px-4">Save Schedule</button>
            </div>
        </div>

        <div class="card-custom">
            <!-- Monday -->
            <div class="day-row">
                <div style="width: 120px;">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" checked id="mon">
                        <label class="form-check-label fw-bold" for="mon">Monday</label>
                    </div>
                </div>
                <div class="d-flex flex-wrap gap-2 flex-grow-1 px-4">
                    <span class="slot-pill">10:00 AM <i class="bi bi-x"></i></span>
                    <span class="slot-pill">11:00 AM <i class="bi bi-x"></i></span>
                    <span class="slot-pill">04:00 PM <i class="bi bi-x"></i></span>
                    <button class="btn btn-outline-warning btn-sm rounded-pill px-3">+ Add Slot</button>
                </div>
                <div class="text-muted small">Available</div>
            </div>

            <!-- Tuesday -->
            <div class="day-row">
                <div style="width: 120px;">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" checked id="tue">
                        <label class="form-check-label fw-bold" for="tue">Tuesday</label>
                    </div>
                </div>
                <div class="d-flex flex-wrap gap-2 flex-grow-1 px-4">
                    <span class="slot-pill">11:30 AM <i class="bi bi-x"></i></span>
                    <span class="slot-pill">05:00 PM <i class="bi bi-x"></i></span>
                    <button class="btn btn-outline-warning btn-sm rounded-pill px-3">+ Add Slot</button>
                </div>
                <div class="text-muted small">Available</div>
            </div>

            <!-- Wednesday -->
            <div class="day-row">
                <div style="width: 120px;">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="wed">
                        <label class="form-check-label fw-bold" for="wed">Wednesday</label>
                    </div>
                </div>
                <div class="flex-grow-1 px-4 text-center">
                    <span class="text-muted italic">No slots added. High likelihood of blocking this day.</span>
                </div>
                <div class="text-danger small">Unavailable</div>
            </div>

            <!-- Friday -->
            <div class="day-row">
                <div style="width: 120px;">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" checked id="fri">
                        <label class="form-check-label fw-bold" for="fri">Friday</label>
                    </div>
                </div>
                <div class="d-flex flex-wrap gap-2 flex-grow-1 px-4">
                    <span class="slot-pill">09:00 PM <i class="bi bi-x"></i></span>
                    <span class="slot-pill">10:00 PM <i class="bi bi-x"></i></span>
                    <button class="btn btn-outline-warning btn-sm rounded-pill px-3">+ Add Slot</button>
                </div>
                <div class="text-muted small">Available</div>
            </div>
        </div>

        <div class="mt-5 card-custom bg-dark text-white p-4">
            <h5 class="fw-bold mb-3">Sync Calendar 📅</h5>
            <p class="opacity-75 small">Allow CareerSaathi to sync with your Google or Outlook calendar to automatically block slots when you are busy.</p>
            <button class="btn btn-outline-light btn-sm fw-bold">Connect Google Calendar</button>
        </div>
    </div>

</body>
</html>
