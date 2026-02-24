<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile | CareerSaathi</title>
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
        .profile-card { background: white; border-radius: 15px; padding: 2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .profile-img-big { width: 120px; height: 120px; background: var(--accent-yellow); color: var(--primary-dark); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 3rem; font-weight: 800; margin: 0 auto 1.5rem; }
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
            <a href="${pageContext.request.contextPath}/consultee/sessions" class="menu-item">
                <i class="bi bi-calendar-event"></i> My Sessions
            </a>
            <a href="${pageContext.request.contextPath}/consultee/chat" class="menu-item">
                <i class="bi bi-chat-dots-fill"></i> Chat with Mentor
            </a>
            <a href="${pageContext.request.contextPath}/consultee/profile" class="menu-item active">
                <i class="bi bi-person-fill"></i> Profile
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
                    <h2 class="fw-bold mb-0">My Profile 👤</h2>
                    <p class="text-muted mb-0">Update your information to get personalized career advice.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4">
                <div class="profile-card text-center mb-4">
                    <div class="profile-img-big">${user.name.substring(0,1).toUpperCase()}</div>
                    <h4 class="fw-bold">${user.name}</h4>
                    <p class="text-muted mb-4">Full Stack Developer aspirant</p>
                    <button class="btn btn-outline-dark btn-sm rounded-pill px-4">Change Photo</button>
                    <hr>
                    <div class="text-start">
                        <label class="small text-muted">Email</label>
                        <p class="fw-bold">${user.email}</p>
                        <label class="small text-muted">Phone</label>
                        <p class="fw-bold">${user.phoneNo}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="profile-card">
                    <h5 class="fw-bold mb-4">Edit Details</h5>
                    <form>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label small text-muted">Full Name</label>
                                <input type="text" class="form-control" value="${user.name}">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small text-muted">Current Goal</label>
                                <input type="text" class="form-control" value="Software Engineer">
                            </div>
                            <div class="col-12">
                                <label class="form-label small text-muted">Bio</label>
                                <textarea class="form-control" rows="3">Passionate about coding and building scalable web applications. Eager to learn from industry experts.</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label small text-muted">Upload Resume (PDF)</label>
                                <input type="file" class="form-control">
                            </div>
                            <div class="col-12 mt-4">
                                <button type="button" class="btn btn-warning fw-bold px-4">Update Profile</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
