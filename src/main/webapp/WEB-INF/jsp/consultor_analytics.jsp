<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analytics | CareerSaathi</title>
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
        .analytic-card { background: white; border-radius: 15px; padding: 1.5rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); height: 100%; }
        .chart-placeholder { height: 250px; background: #f8f9fa; border-radius: 10px; display: flex; align-items: flex-end; justify-content: space-around; padding: 20px; }
        .bar { width: 30px; background: var(--accent-yellow); border-radius: 5px 5px 0 0; transition: 0.3s; cursor: pointer; }
        .bar:hover { background: var(--primary-dark); }
        .progress-sm { height: 8px; border-radius: 10px; }
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
            <a href="${pageContext.request.contextPath}/consultor/sessions" class="menu-item">
                <i class="bi bi-journal-text"></i> My Sessions
            </a>
            <a href="${pageContext.request.contextPath}/consultor/analytics" class="menu-item active">
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
                    <h2 class="fw-bold mb-0">Analytics & Growth 📊</h2>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-4">
            <!-- Earnings Graph -->
            <div class="col-lg-8">
                <div class="analytic-card">
                    <div class="d-flex justify-content-between mb-4">
                        <h6 class="fw-bold">Monthly Earnings Trend</h6>
                        <select class="form-select form-select-sm" style="width: 120px;">
                            <option>Last 6 Months</option>
                            <option>Last Year</option>
                        </select>
                    </div>
                    <!-- CSS Bar Chart Mockup -->
                    <div class="chart-placeholder">
                        <div class="bar" style="height: 40%;" title="Sep: ₹5,000"></div>
                        <div class="bar" style="height: 65%;" title="Oct: ₹8,200"></div>
                        <div class="bar" style="height: 50%;" title="Nov: ₹6,100"></div>
                        <div class="bar" style="height: 85%;" title="Dec: ₹12,000"></div>
                        <div class="bar" style="height: 75%;" title="Jan: ₹10,500"></div>
                        <div class="bar" style="height: 95%;" title="Feb: ₹18,000"></div>
                    </div>
                    <div class="d-flex justify-content-around mt-2 text-muted extra-small">
                        <span>Sep</span><span>Oct</span><span>Nov</span><span>Dec</span><span>Jan</span><span>Feb</span>
                    </div>
                </div>
            </div>

            <!-- Top Performance Stats -->
            <div class="col-lg-4">
                <div class="analytic-card">
                    <h6 class="fw-bold mb-4">Key Metrics</h6>
                    <div class="mb-4">
                        <div class="d-flex justify-content-between small mb-1">
                            <span>Rating Trend</span>
                            <span class="fw-bold text-success">+0.2 ↑</span>
                        </div>
                        <div class="progress progress-sm">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: 96%"></div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <div class="d-flex justify-content-between small mb-1">
                            <span>Profile Conversion</span>
                            <span class="fw-bold">12%</span>
                        </div>
                        <div class="progress progress-sm">
                            <div class="progress-bar bg-dark" role="progressbar" style="width: 45%"></div>
                        </div>
                    </div>
                    <hr>
                    <div class="row g-2 text-center">
                        <div class="col-6 p-3 bg-light rounded">
                            <h4 class="mb-0 fw-bold">128</h4>
                            <span class="extra-small text-muted">Hours Mentored</span>
                        </div>
                        <div class="col-6 p-3 bg-light rounded">
                            <h4 class="mb-0 fw-bold">45</h4>
                            <span class="extra-small text-muted">Total Students</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-6">
                <div class="analytic-card">
                    <h6 class="fw-bold mb-3">Most Booked Domains</h6>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between small">
                            <span>Full Stack Development</span>
                            <span class="fw-bold">42%</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between small">
                            <span>System Design Interview</span>
                            <span class="fw-bold">35%</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between small">
                            <span>Resume Review</span>
                            <span class="fw-bold">23%</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="analytic-card bg-warning text-dark">
                    <h6 class="fw-bold mb-3">Goal of the Month 🚀</h6>
                    <p class="small opacity-75">You are just <strong>3 sessions away</strong> from reaching your target earnings of ₹25,000 this month. Keep it up!</p>
                    <button class="btn btn-dark btn-sm fw-bold w-100">Set New Milestone</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
