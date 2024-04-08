<%-- 
    Document   : side-bar
    Created on : Apr 7, 2024, 9:38:51 PM
    Author     : Vanhle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sidebar</title>
           
    </head>
    <body>
        <div class="d-flex flex-column flex-shrink-0 sidebar-wrap" id="sidebar">
            <a href="#" class="text-decoration-none logo-wrap">
                <div class="icon-wrap">
                    <img src="Image/Logo/ims-logo.png" class="mlogo" />
                </div>
                <span style="font-weight: bolder ;font-size: 20px; color: #000;">ISM</span>
            </a>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto mt-5">
                <li class="nav-item">
                    <a href="#" class="nav-link " aria-current="page">
                        <div class="icon-wrap">
                            <i data-lucide="home"></i>
                        </div>
                        <span> Home</span>
                    </a>
                </li>
                <li>
                    <a href="candidate-list.jsp" class="nav-link">
                        <div class="icon-wrap">
                            <i data-lucide="users"></i>
                        </div>
                        <span>Candidate</span>
                    </a>
                </li>
                <li>
                    <a href="job-list.jsp" class="nav-link">
                        <div class="icon-wrap">
                            <i data-lucide="briefcase-business"></i>
                        </div>
                        <span>Job</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link">
                        <div class="icon-wrap">
                            <i data-lucide="message-circle-code"></i>
                        </div>
                        <span>Interview</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link">
                        <div class="icon-wrap">
                            <i data-lucide="file-check-2"></i>
                        </div>
                        <span>Offer</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link">
                        <div class="icon-wrap">
                            <i data-lucide="user-plus"></i>
                        </div>
                        <span>User</span>
                    </a>
                </li>
            </ul>
            <hr>
        </div>
    </body>
</html>
