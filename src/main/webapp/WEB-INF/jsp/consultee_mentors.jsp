<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Mentors | CareerSaathi</title>
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
        .mentor-card { background: white; border-radius: 15px; padding: 1.5rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .mentor-avatar { width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 3px solid var(--accent-yellow); }
        .tag { background: #eee; padding: 0.2rem 0.6rem; border-radius: 50px; font-size: 0.75rem; color: #555; }
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
            <a href="${pageContext.request.contextPath}/consultee/mentors" class="menu-item active">
                <i class="bi bi-people-fill"></i> Explore Mentors
            </a>
            <a href="${pageContext.request.contextPath}/consultee/sessions" class="menu-item">
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
                    <h2 class="fw-bold mb-0">Explore Mentors 🔍</h2>
                    <p class="text-muted mb-0">Connect with experts from top companies and universities.</p>
                </div>
            </div>
            <div class="d-flex gap-2">
                <select class="form-select form-select-sm" style="width: 150px;">
                    <option selected>All Domains</option>
                    <option>Tech</option>
                    <option>MBA</option>
                    <option>Design</option>
                </select>
                <button class="btn btn-dark btn-sm"><i class="bi bi-filter"></i> Filters</button>
            </div>
        </div>

        <div class="row g-4">
            <!-- Mentor 1 -->
            <div class="col-md-6 col-lg-4">
                <div class="mentor-card text-center">
                    <img src="https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400" alt="Mentor" class="mentor-avatar mb-3">
                    <h5 class="fw-bold mb-1">Aman Verma</h5>
                    <p class="text-muted small mb-2">SDE-II @ Microsoft</p>
                    <div class="d-flex justify-content-center gap-1 mb-3">
                        <span class="tag">System Design</span>
                        <span class="tag">Java</span>
                        <span class="tag">Backend</span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mt-3 pt-3 border-top">
                        <div class="text-start">
                            <span class="text-warning"><i class="bi bi-star-fill"></i> 4.9</span>
                            <span class="text-muted extra-small d-block">(120 Reviews)</span>
                        </div>
                        <div class="text-end">
                            <span class="fw-bold">₹499</span>
                            <span class="text-muted extra-small d-block">/ 30 min</span>
                        </div>
                    </div>
                    <button class="btn btn-warning w-100 fw-bold mt-3">Book Session</button>
                </div>
            </div>

            <!-- Mentor 2 -->
            <div class="col-md-6 col-lg-4">
                <div class="mentor-card text-center">
                    <img src="https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=400" alt="Mentor" class="mentor-avatar mb-3">
                    <h5 class="fw-bold mb-1">Priya Das</h5>
                    <p class="text-muted small mb-2">UX Designer @ Adobe</p>
                    <div class="d-flex justify-content-center gap-1 mb-3">
                        <span class="tag">UI/UX</span>
                        <span class="tag">Figma</span>
                        <span class="tag">Product</span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mt-3 pt-3 border-top">
                        <div class="text-start">
                            <span class="text-warning"><i class="bi bi-star-fill"></i> 4.8</span>
                            <span class="text-muted extra-small d-block">(85 Reviews)</span>
                        </div>
                        <div class="text-end">
                            <span class="fw-bold">₹599</span>
                            <span class="text-muted extra-small d-block">/ 30 min</span>
                        </div>
                    </div>
                    <button class="btn btn-warning w-100 fw-bold mt-3">Book Session</button>
                </div>
            </div>

            <!-- Mentor 3 -->
            <div class="col-md-6 col-lg-4">
                <div class="mentor-card text-center">
                    <img src="https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=400" alt="Mentor" class="mentor-avatar mb-3">
                    <h5 class="fw-bold mb-1">Rohan Gupta</h5>
                    <p class="text-muted small mb-2">Product Manager @ Swiggy</p>
                    <div class="d-flex justify-content-center gap-1 mb-3">
                        <span class="tag">Product Mgmt</span>
                        <span class="tag">MBA</span>
                        <span class="tag">Strategy</span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mt-3 pt-3 border-top">
                        <div class="text-start">
                            <span class="text-warning"><i class="bi bi-star-fill"></i> 5.0</span>
                            <span class="text-muted extra-small d-block">(50 Reviews)</span>
                        </div>
                        <div class="text-end">
                            <span class="fw-bold">₹799</span>
                            <span class="text-muted extra-small d-block">/ 30 min</span>
                        </div>
                    </div>
                    <button class="btn btn-warning w-100 fw-bold mt-3">Book Session</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
