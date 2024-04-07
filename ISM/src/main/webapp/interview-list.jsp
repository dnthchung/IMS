<%-- 
    Document : candidate-list 
    Created on : Apr 6, 2024, 12:47:46 AM 
    Author : chun 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Interview Schedule List</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <!-- multi select -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />
        <!-- link to css -->
        <link rel="stylesheet" href="CSS/interview-list.css">

    </head>

    <body>
        <div class="d-flex flex-row">
            <!-- side bar -->
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
                        <a href="#" class="nav-link">
                            <div class="icon-wrap">
                                <i data-lucide="users"></i>
                            </div>
                            <span>Candidate</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link">
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
            <!-- navigation bar + main content-->
            <div class="main-content">
                <!-- navigation bar -->
                <nav class="navbar navbar-expand-sm ">
                    <div class="container-fluid">
                        <div class="mpage-name" href="#">
                            <h2 class="" style="color: black;">Interview Schedule</h2>
                        </div>

                        <div class="collapse navbar-collapse" id="mynavbar">
                            <ul class="navbar-nav me-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="#"></a>
                                </li>
                            </ul>
                            <!-- <div class="d-flex user-area">
                            <div class="user-info d-flex flex-column align-items-center">
                                <span class="username">@chungdth</span>
                                <p>HR Department</p>
                            </div>
                            <div style="padding: 15px;">
                                <i style="height: 20px;" data-lucide="user"></i>
                            </div>
                            <div class="d-flex align-items-center">
                                <a href="#" style="font-style: italic; color: black; margin-right: 20px;">Logout</a>
                            </div>
                        </div> -->
                            <div class="d-flex" style="gap: 25px;">
                                <div class="button-2">
                                    <a href="login.jsp" style="text-decoration: none; color: #000;">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- body -->
                <div class="container-fluid mt-3">
                    <!-- content-card -->
                    <div class="card mt-3 my-card">
                        <div class="content">
                            <div>
                                <h4>Interview Schedule list</h4>
                                <div>
                                    <div class="row mt-5">
                                        <div class="col-md-8">
                                            <div class="col-md-3">
                                                <!-- Search Area -->
                                                <div class="input-group" style="padding: 0px !important;">
                                                    <input type="text" class="form-control" placeholder="Search">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">
                                                            <i data-lucide="search"></i> <!-- Icon kính lúp -->
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-10"></div>
                                            <div class="col-md-3 mt-3">
                                                <div class="input-group" style="padding: 0px !important;">
                                                    <select class="form-select">
                                                        <option selected>Status</option>
                                                        <option value="1">Active</option>
                                                        <option value="2">Inactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-10"></div>
                                            <div class="col-md-3 mt-3">
                                                <div class="input-group" style="padding: 0px !important; ; ">
                                                    <button class="button-2" style="background-color: #1E96FC; color: #fff">Search</button>
                                                </div>
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                        <div class="col-md-1"></div>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-6"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="me-auto p-2 "></div>
                                <div class="p-2 mt-3">
                                    <!--hr, manager-->
                                    <a href="job-create.jsp" style="text-decoration: none;" type="button" class="button3">
                                        <span class="button-text">Add New</span>
                                        <span class="button-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                       viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round"
                                                                       stroke-linecap="round" stroke="currentColor" height="24" fill="none"
                                                                       class="svg">
                                            <line y2="19" y1="5" x2="12" x1="12"></line>
                                            <line y2="12" y1="12" x2="19" x1="5"></line>
                                            </svg>
                                        </span>
                                    </a>
                                </div>
                            </div>

                            <div class="card mt-3">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table text-center table-striped">
                                            <thead>
                                                <tr>
                                                    <th scope="col"> <strong>Title</strong> </th>
                                                    <th scope="col"> <strong>Candidate Name</strong> </th>
                                                    <th scope="col"> <strong>Interview</strong> </th>
                                                    <th scope="col"> <strong>Schedule</strong> </th>
                                                    <th scope="col"> <strong>Result</strong> </th>
                                                    <th scope="col"> <strong>Status</strong> </th>
                                                    <th scope="col"> <strong>Job</strong> </th>
                                                    <th scope="col"> <strong>Action</strong> </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!--  table data rows  -->
                                                <tr>
                                                    <td>Interview Senior Backend Developer</td>
                                                    <td>Doan Thanh Chung</td>
                                                    <td>Le Viet Anh</td>
                                                    <td>
                                                        <span>22/05/2022</span>
                                                        <strong>09:00</strong>
                                                        -
                                                        <strong>10:30</strong>
                                                    </td>
                                                    <td>N/A</td>
                                                    <td>New</td>                                                    
                                                    <td>Account Manager</td>
                                                    <td>
                                                        <a style="margin-right: 5px;text-decoration: none; color: black; "
                                                           href="#" class="icon-button">
                                                            <i data-lucide="eye"></i>
                                                        </a>
                                                        <!--button edit : hr, manager-->
                                                        <a style="margin-right: 5px;text-decoration: none; color: black;"
                                                           href="#" class="icon-button">
                                                            <i data-lucide="file-pen-line"></i>
                                                        </a>
                                                        <!--button submit result : interview-->
                                                        <a style="text-decoration: none; color: black;" href="#"
                                                           class="icon-button">
                                                            <i data-lucide="circle-check-big"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="container row">
                                            <div class="col-md-10">
                                                <!-- Your content -->
                                            </div>
                                            <div class="col-md-2">
                                                <!-- Pagination -->
                                                <ul id="pagination">
                                                    <li>
                                                        <span>
                                                            <span>06</span>
                                                            /
                                                            <span>60</span>
                                                        </span>
                                                        <span>
                                                            rows
                                                        </span>
                                                    </li>
                                                    <li><a class="" href="#">&lt;</a></li>
                                                    <li><a href="#">&gt;</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

        <script src="https://unpkg.com/lucide@latest"></script>
        <script>
            //icon lucide
            lucide.createIcons();
        </script>
        <script>
            //skill multi choice
            $('#small-select2-options-multiple-field').select2({
                theme: "bootstrap-5",
                width: $(this).data('width') ? $(this).data('width') : $(this).hasClass('w-100') ? '100%' : 'style',
                placeholder: $(this).data('placeholder'),
                closeOnSelect: true,
                selectionCssClass: 'select2--small',
                dropdownCssClass: 'select2--small'
            });
        </script>
    </body>

</html>