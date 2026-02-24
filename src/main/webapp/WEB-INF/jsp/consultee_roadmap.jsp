<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Roadmap | CareerSaathi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
        .roadmap-container { position: relative; padding-left: 50px; }
        .roadmap-container::before { content: ''; position: absolute; left: 24px; top: 0; bottom: 0; width: 4px; background: #ddd; border-radius: 2px; }
        .step { position: relative; margin-bottom: 3rem; background: white; padding: 1.5rem; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        .step::after { content: ''; position: absolute; left: -31px; top: 20px; width: 20px; height: 20px; background: white; border: 4px solid var(--accent-yellow); border-radius: 50%; z-index: 1; }
        .step.completed::after { background: var(--accent-yellow); }
    </style>
</head>
<body>

    <div class="sidebar">
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
            <a href="${pageContext.request.contextPath}/consultee/roadmap" class="menu-item active">
                <i class="bi bi-map-fill"></i> Career Roadmap
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
        <div class="d-flex justify-content-between align-items-center mb-5">
            <div>
                <h2 class="fw-bold">Career Roadmap 📊</h2>
                <p class="text-muted">Personalized path for <strong>Software Engineer</strong></p>
            </div>
            <button class="btn btn-warning fw-bold">Switch Goal</button>
        </div>

        <div class="roadmap-container">
            <div class="step completed">
                <h5 class="fw-bold">Foundation & CS Basics</h5>
                <p class="text-muted small">Data Structures, Algorithms, OS, DBMS</p>
                <div class="badge bg-success">Completed</div>
            </div>
            <div class="step">
                <h5 class="fw-bold">Frontend Mastery</h5>
                <p class="text-muted small">HTML/CSS, JS, React/Angular, Responsive Design</p>
                <div class="mt-3">
                    <h6 class="extra-small fw-bold">Recommended Projects:</h6>
                    <ul class="extra-small text-muted mb-0">
                        <li>Personal Portfolio Website</li>
                        <li>E-commerce UI Mockup</li>
                    </ul>
                </div>
            </div>
            <div class="step">
                <h5 class="fw-bold">Backend Development</h5>
                <p class="text-muted small">Java/Spring Boot, Node.js, SQL/NoSQL Databases</p>
                <div class="badge bg-warning text-dark">In Progress</div>
            </div>
            <div class="step">
                <h5 class="fw-bold">Distributed Systems & Cloud</h5>
                <p class="text-muted small">Docker, Kubernetes, AWS/Azure Essentials</p>
                <p class="text-muted extra-small mt-2">Salary Expectation: ₹12 - 25 LPA</p>
            </div>
        </div>
    </div>

</body>
</html>
