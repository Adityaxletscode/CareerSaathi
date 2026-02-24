<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews & Ratings | CareerSaathi</title>
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
        .review-card { background: white; border-radius: 12px; padding: 1.5rem; margin-bottom: 1.5rem; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        .rating-bar { height: 8px; border-radius: 10px; background: #eee; overflow: hidden; }
        .rating-fill { background: var(--accent-yellow); height: 100%; border-radius: 10px; }
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
            <a href="${pageContext.request.contextPath}/consultor/reviews" class="menu-item active">
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
                    <h2 class="fw-bold mb-0">Reviews & Ratings ⭐</h2>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-lg-4">
                <div class="review-card text-center p-5">
                    <h1 class="display-3 fw-bold mb-0">4.8</h1>
                    <div class="text-warning mb-2">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-half"></i>
                    </div>
                    <p class="text-muted small">Total 150 Ratings</p>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="review-card">
                    <h6 class="fw-bold mb-3">Rating Breakdown</h6>
                    <div class="d-flex align-items-center gap-3 mb-2">
                        <span class="small" style="width: 50px;">5 Star</span>
                        <div class="rating-bar flex-grow-1"><div class="rating-fill" style="width: 85%;"></div></div>
                        <span class="small text-muted" style="width: 40px;">120</span>
                    </div>
                    <div class="d-flex align-items-center gap-3 mb-2">
                        <span class="small" style="width: 50px;">4 Star</span>
                        <div class="rating-bar flex-grow-1"><div class="rating-fill" style="width: 10%;"></div></div>
                        <span class="small text-muted" style="width: 40px;">22</span>
                    </div>
                    <div class="d-flex align-items-center gap-3 mb-2">
                        <span class="small" style="width: 50px;">3 Star</span>
                        <div class="rating-bar flex-grow-1"><div class="rating-fill" style="width: 3%;"></div></div>
                        <span class="small text-muted" style="width: 40px;">5</span>
                    </div>
                    <div class="d-flex align-items-center gap-3 mb-2">
                        <span class="small" style="width: 50px;">2 Star</span>
                        <div class="rating-bar flex-grow-1"><div class="rating-fill" style="width: 1%;"></div></div>
                        <span class="small text-muted" style="width: 40px;">2</span>
                    </div>
                    <div class="d-flex align-items-center gap-3">
                        <span class="small" style="width: 50px;">1 Star</span>
                        <div class="rating-bar flex-grow-1"><div class="rating-fill" style="width: 1%;"></div></div>
                        <span class="small text-muted" style="width: 40px;">1</span>
                    </div>
                </div>
            </div>
        </div>

        <h6 class="fw-bold text-muted text-uppercase mb-3" style="font-size: 0.8rem;">Recent Feedback</h6>
        
        <div class="review-card">
            <div class="d-flex justify-content-between align-items-start mb-3">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 40px; height: 40px; background: #ffc107; color: #000; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">AK</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Aditya Kumar</h6>
                        <div class="text-warning extra-small">
                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                    </div>
                </div>
                <span class="text-muted extra-small">2 days ago</span>
            </div>
            <p class="small text-muted mb-0">"Amazing session! The mentor explained complex React concepts in a very simple way. I highly recommend him to anyone looking for career guidance in tech."</p>
        </div>

        <div class="review-card">
            <div class="d-flex justify-content-between align-items-start mb-3">
                <div class="d-flex align-items-center gap-3">
                    <div style="width: 40px; height: 40px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">SP</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Sneha Patel</h6>
                        <div class="text-warning extra-small">
                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star"></i>
                        </div>
                    </div>
                </div>
                <span class="text-muted extra-small">1 week ago</span>
            </div>
            <p class="small text-muted mb-0">"Very helpful session on system design. Could have covered more about load balancers, but overall a great learning experience."</p>
        </div>
    </div>

</body>
</html>
