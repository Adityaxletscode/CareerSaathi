<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Earnings & Payments | CareerSaathi</title>
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
        .earning-card { background: white; border-radius: 15px; padding: 2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .table-custom { border-collapse: separate; border-spacing: 0 10px; }
        .table-custom tbody tr { background: white; box-shadow: 0 2px 8px rgba(0,0,0,0.02); transition: 0.3s; }
        .status-paid { color: #198754; font-weight: 700; background: rgba(25, 135, 84, 0.1); padding: 0.2rem 0.6rem; border-radius: 50px; font-size: 0.75rem; }
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
            <a href="${pageContext.request.contextPath}/consultor/analytics" class="menu-item">
                <i class="bi bi-bar-chart-fill"></i> Analytics
            </a>
            <a href="${pageContext.request.contextPath}/consultor/reviews" class="menu-item">
                <i class="bi bi-star-fill"></i> Reviews
            </a>
            <a href="${pageContext.request.contextPath}/consultor/earnings" class="menu-item active">
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
                    <h2 class="fw-bold mb-0">Earnings & Payments 💰</h2>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="earning-card text-center">
                    <p class="text-muted small mb-1">Total Earnings</p>
                    <h2 class="fw-bold">₹24,500</h2>
                    <span class="badge bg-success small">+15% vs last month</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="earning-card text-center">
                    <p class="text-muted small mb-1">Withdrawable Balance</p>
                    <h2 class="fw-bold text-warning">₹8,400</h2>
                    <button class="btn btn-dark btn-sm rounded-pill mt-2 px-4 shadow-sm">Withdraw <i class="bi bi-arrow-right-circle ms-1"></i></button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="earning-card text-center">
                    <p class="text-muted small mb-1">Pending Clearance</p>
                    <h2 class="fw-bold text-muted">₹3,200</h2>
                    <p class="extra-small text-muted mb-0">Will be available in 7 days</p>
                </div>
            </div>
        </div>

        <h6 class="fw-bold text-muted text-uppercase mb-3" style="font-size: 0.8rem;">Recent Transactions</h6>
        
        <div class="table-responsive">
            <table class="table table-custom align-middle">
                <thead>
                    <tr class="text-muted small">
                        <th>Student Name</th>
                        <th>Session Date</th>
                        <th>Amount</th>
                        <th>Platform Fee</th>
                        <th>Status</th>
                        <th>Transaction ID</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><h6 class="mb-0 fw-bold">Aditya Kumar</h6></td>
                        <td><span class="small">Feb 20, 2026</span></td>
                        <td><span class="fw-bold">₹499</span></td>
                        <td><span class="text-danger extra-small">-₹49</span></td>
                        <td><span class="status-paid">Paid</span></td>
                        <td><code class="extra-small">TRX8844SS9</code></td>
                    </tr>
                    <tr>
                        <td><h6 class="mb-0 fw-bold">Riya Singh</h6></td>
                        <td><span class="small">Feb 18, 2026</span></td>
                        <td><span class="fw-bold">₹799</span></td>
                        <td><span class="text-danger extra-small">-₹79</span></td>
                        <td><span class="status-paid">Paid</span></td>
                        <td><code class="extra-small">TRX8844SS8</code></td>
                    </tr>
                    <tr>
                        <td><h6 class="mb-0 fw-bold">Manish Pal</h6></td>
                        <td><span class="small">Feb 15, 2026</span></td>
                        <td><span class="fw-bold">₹499</span></td>
                        <td><span class="text-danger extra-small">-₹49</span></td>
                        <td><span class="status-paid">Paid</span></td>
                        <td><code class="extra-small">TRX8844SS7</code></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
