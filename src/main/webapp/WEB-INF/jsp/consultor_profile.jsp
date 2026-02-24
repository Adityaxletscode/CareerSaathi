<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Profile | CareerSaathi</title>
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
        .profile-card { background: white; border-radius: 15px; padding: 2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .profile-pic-container { position: relative; width: 150px; height: 150px; margin: 0 auto 1.5rem; }
        .profile-pic { width: 100%; height: 100%; border-radius: 50%; object-fit: cover; border: 4px solid var(--accent-yellow); }
        .edit-pic-btn { position: absolute; bottom: 5px; right: 5px; background: var(--primary-dark); color: white; border: none; border-radius: 50%; width: 35px; height: 35px; display: flex; align-items: center; justify-content: center; }
        .tag-input { display: flex; flex-wrap: wrap; gap: 0.5rem; padding: 0.5rem; border: 1px solid #dee2e6; border-radius: 0.375rem; }
        .tag-badge { background: #eee; padding: 0.2rem 0.6rem; border-radius: 50px; font-size: 0.8rem; display: flex; align-items: center; gap: 0.3rem; }
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
            <a href="${pageContext.request.contextPath}/consultor/profile" class="menu-item active">
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
                    <h2 class="fw-bold mb-0">Mentor Profile 👤</h2>
                </div>
            </div>
        </div>
        
        <div class="row g-4">
            <!-- Left Column: Basic Info & Branding -->
            <div class="col-lg-4">
                <div class="profile-card text-center">
                    <div class="profile-pic-container">
                        <img src="https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400" class="profile-pic" alt="Profile">
                        <button class="edit-pic-btn"><i class="bi bi-camera"></i></button>
                    </div>
                    <h4 class="fw-bold fs-5">${user.name}</h4>
                    <p class="text-muted small mb-3">Senior Software Architect</p>
                    <div class="d-flex justify-content-center gap-3 mb-4">
                        <a href="#" class="text-dark"><i class="bi bi-linkedin fs-5"></i></a>
                        <a href="#" class="text-dark"><i class="bi bi-github fs-5"></i></a>
                        <a href="#" class="text-dark"><i class="bi bi-globe fs-5"></i></a>
                    </div>
                    <div class="p-3 bg-light rounded text-start">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="small text-muted">Pricing</span>
                            <span class="fw-bold text-success">₹499 / session</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="small text-muted">Experience</span>
                            <span class="fw-bold">8+ Years</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="small text-muted">Languages</span>
                            <span class="fw-bold">Hindi, English</span>
                        </div>
                    </div>
                    <button class="btn btn-warning w-100 fw-bold mt-4">Save Changes</button>
                </div>
            </div>

            <!-- Right Column: Detailed Setup -->
            <div class="col-lg-8">
                <div class="profile-card">
                    <h5 class="fw-bold mb-4">Professional Details</h5>
                    <form>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label small fw-bold">Professional Bio</label>
                                <textarea class="form-control" rows="4" placeholder="Tell students about your journey...">Passionate software engineer with 8+ years of experience in building scalable systems. I love helping juniors master system design and backend technologies.</textarea>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Expertise Domains</label>
                                <div class="tag-input">
                                    <span class="tag-badge">Backend <i class="bi bi-x"></i></span>
                                    <span class="tag-badge">System Design <i class="bi bi-x"></i></span>
                                    <span class="tag-badge">Java <i class="bi bi-x"></i></span>
                                    <input type="text" class="border-0 bg-transparent flex-grow-1" style="outline: none;" placeholder="Add Domain">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Expertise Level</label>
                                <select class="form-select">
                                    <option>Junior (1-3 yrs)</option>
                                    <option>Mid-Level (3-7 yrs)</option>
                                    <option selected>Senior (7+ yrs)</option>
                                    <option>VP / CTO</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Portfolio / Website URL</label>
                                <input type="url" class="form-control" placeholder="https://yourportfolio.com">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Session Price (per 30 min)</label>
                                <div class="input-group">
                                    <span class="input-group-text">₹</span>
                                    <input type="number" class="form-control" value="499">
                                </div>
                            </div>
                            <div class="col-12 mt-4">
                                <h6 class="fw-bold mb-3">Certifications & Documents</h6>
                                <div class="p-3 border rounded border-dashed text-center">
                                    <i class="bi bi-cloud-arrow-up fs-2 text-muted"></i>
                                    <p class="small text-muted mb-0">Drag and drop your certificates here or <a href="#" class="text-warning text-decoration-none">browse</a></p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
