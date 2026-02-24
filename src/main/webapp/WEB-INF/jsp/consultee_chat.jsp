<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat with Mentor | CareerSaathi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <script src="${pageContext.request.contextPath}/js/dashboard.js" defer></script>
    <style>
        :root { --sidebar-width: 280px; --primary-dark: #1a1a1a; --accent-yellow: #ffc107; }
        body { background-color: #f4f7f6; font-family: 'Inter', sans-serif; height: 100vh; overflow: hidden; }
        .sidebar { width: var(--sidebar-width); height: 100vh; position: fixed; left: 0; top: 0; background-color: var(--primary-dark); color: white; display: flex; flex-direction: column; z-index: 1000;}
        .sidebar-header { padding: 2rem; text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .sidebar-brand { font-size: 1.5rem; font-weight: 700; color: white; text-decoration: none; }
        .menu-item { padding: 0.8rem 2rem; display: flex; align-items: center; color: rgba(255,255,255,0.7); text-decoration: none; border-left: 4px solid transparent;}
        .menu-item i { margin-right: 1rem; font-size: 1.2rem; }
        .menu-item:hover, .menu-item.active { color: var(--accent-yellow); background-color: rgba(255,255,255,0.05); border-left-color: var(--accent-yellow); }
        .main-content { margin-left: var(--sidebar-width); height: 100vh; display: flex; flex-direction: column; }
        
        /* Chat Interface */
        .chat-container { flex-grow: 1; display: flex; background: white; margin: 1.5rem; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); overflow: hidden; }
        .chat-sidebar { width: 300px; border-right: 1px solid #eee; display: flex; flex-direction: column; }
        .chat-main { flex-grow: 1; display: flex; flex-direction: column; }
        
        .contact-item { padding: 1.2rem; border-bottom: 1px solid #f8f9fa; cursor: pointer; transition: 0.2s; }
        .contact-item:hover { background: #f8f9fa; }
        .contact-item.active { background: rgba(255, 193, 7, 0.1); border-right: 3px solid var(--accent-yellow); }
        
        .chat-header { padding: 1rem 2rem; border-bottom: 1px solid #eee; display: flex; align-items: center; justify-content: space-between; }
        .chat-messages { flex-grow: 1; padding: 2rem; overflow-y: auto; background: #fdfdfd; }
        .chat-input-area { padding: 1.5rem; border-top: 1px solid #eee; }
        
        .message { margin-bottom: 1.5rem; max-width: 70%; padding: 1rem; border-radius: 15px; position: relative; }
        .msg-received { background: #eee; align-self: flex-start; border-bottom-left-radius: 2px; }
        .msg-sent { background: var(--primary-dark); color: white; align-self: flex-end; margin-left: auto; border-bottom-right-radius: 2px; }
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
            <a href="${pageContext.request.contextPath}/consultee/chat" class="menu-item active">
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
        <div class="chat-container">
            <!-- Chat Sidebar -->
            <div class="chat-sidebar">
                <div class="p-3 border-bottom">
                    <h5 class="fw-bold mb-0">Messages</h5>
                </div>
                <div class="overflow-auto">
                    <div class="contact-item active">
                        <div class="d-flex align-items-center gap-3">
                            <div style="width: 45px; height: 45px; background: #ffc107; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">SK</div>
                            <div class="flex-grow-1">
                                <h6 class="mb-0 fw-bold">Sarah Khan</h6>
                                <p class="mb-0 extra-small text-muted text-truncate">How is your project going?</p>
                            </div>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="d-flex align-items-center gap-3">
                            <div style="width: 45px; height: 45px; background: #eee; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">AM</div>
                            <div class="flex-grow-1">
                                <h6 class="mb-0 fw-bold">Aman Verma</h6>
                                <p class="mb-0 extra-small text-muted text-truncate">Shared the roadmap document.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Chat Main -->
            <div class="chat-main">
                <div class="chat-header">
                    <div class="d-flex align-items-center gap-2">
                        <button id="sidebarToggle" class="mobile-toggle m-0">
                            <i class="bi bi-list"></i>
                        </button>
                        <div style="width: 40px; height: 40px; background: #ffc107; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">SK</div>
                        <div>
                            <h6 class="mb-0 fw-bold">Sarah Khan</h6>
                            <span class="text-success extra-small fw-bold">Online</span>
                        </div>
                    </div>
                    <div class="d-flex gap-3 text-muted">
                        <i class="bi bi-camera-video"></i>
                        <i class="bi bi-telephone"></i>
                        <i class="bi bi-three-dots-vertical"></i>
                    </div>
                </div>

                <div class="chat-messages">
                    <div class="message msg-received">
                        Hi ${user.name}! I saw your recent progress on the React module. Great job!
                        <div class="extra-small text-muted mt-1" style="font-size: 0.7rem;">10:05 AM</div>
                    </div>
                    <div class="message msg-sent">
                        Thanks Sarah! I'm currently working on the API integration part.
                        <div class="extra-small opacity-75 mt-1" style="font-size: 0.7rem;">10:08 AM</div>
                    </div>
                    <div class="message msg-received">
                        How is your project going? Do you need any help with the Redux setup?
                        <div class="extra-small text-muted mt-1" style="font-size: 0.7rem;">10:10 AM</div>
                    </div>
                </div>

                <div class="chat-input-area">
                    <div class="input-group">
                        <button class="btn btn-outline-secondary" type="button"><i class="bi bi-plus-lg"></i></button>
                        <input type="text" class="form-control" placeholder="Type your message here...">
                        <button class="btn btn-warning fw-bold" type="button">Send <i class="bi bi-send-fill ms-1"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
