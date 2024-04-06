<%-- 
    Document   : job-details
    Created on : Apr 7, 2024, 1:21:22 AM
    Author     : chun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Details</title>
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
        <link rel="stylesheet" href="CSS/job-details.css">

    </head>
    <body>
        <!-- side bar -->
        <div class="d-flex flex-row">
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
            <!-- navgation bar + main content-->
            <div class="main-content">
                <!-- navgation bar -->
                <nav class="navbar navbar-expand-sm ">
                    <div class="container-fluid">
                        <div class="mpage-name" href="#">
                            <h2 class="" style="color: black;">Job</h2>
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
                                    <a href="#" style="text-decoration: none; color: #000;">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- body -->
                <div class="container-fluid mt-3">
                    <nav aria-label="breadcrumb" style="margin-left: 1em">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Job List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a href="#">Job Details</a>
                            </li>
                        </ol>
                    </nav>
                    <div class="d-flex justify-content-end" style="margin-right: 1em">
                        <p><i>Created on <strong>22/02/2022</strong> , last updated by <strong>chungdt1</strong> today</i></p>
                    </div>
                    <!-- content-card -->
                    <div class="card my-card">
                        <div class="content">
                            <!-- class="content-1" -->
                            <!-- class="content-2" -->
                            <form action="">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <table class="table table-striped">
                                                <thead>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="part-title">Job title</td>
                                                        <td>Business Analyst</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Start Date</td>
                                                        <td>20/06/2003</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Salary Range</td>
                                                        <td class="">
                                                            <div class="d-flex justify-content-between">
                                                                <p>From</p>
                                                                <p>
                                                                    <strong>5.000.000</strong>
                                                                    <span> VND</span>
                                                                </p>
                                                                <p>To</p>
                                                                <p>
                                                                    <strong>5.000.000</strong>
                                                                    <span>VND</span>
                                                                </p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Working address</td>
                                                        <td>FPT Tower</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Status</td>
                                                        <td>Draft</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-1"></div>
                                        <div class="col-md-5">
                                            <table class="table table-striped">
                                                <thead>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="part-title">Skills</td>
                                                        <td>
                                                            <div class="d-flex flex-wrap-limit justify-content-between">
                                                                <span class="badge text-bg-success">Java</span>
                                                                <span class="badge text-bg-success">Kotlin</span>
                                                                <span class="badge text-bg-success">HTML</span>
                                                                <span class="badge text-bg-success">CSS</span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">End Date</td>
                                                        <td>
                                                            23/04/2022
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Benefits</td>
                                                        <td>
                                                            <div class="d-flex flex-wrap-limit justify-content-between">
                                                                <span class="badge text-bg-success">Travel</span>
                                                                <span class="badge text-bg-success">25 leave-off</span>
                                                                <span class="badge text-bg-success">Lunch</span>
                                                                <span class="badge text-bg-success">YEP</span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Level</td>
                                                        <td>
                                                            <div
                                                                class="d-flex flex-wrap-limit justify-content-between">
                                                                <span class="badge text-bg-success">Junior</span>
                                                                <span class="badge text-bg-success">Fresher</span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Description</td>
                                                        <td>
                                                            <p>N/A</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
 
                                    <div class="d-flex justify-content-center mt-5">
                                        <a type="button" href="job-edit.jsp" class="button-2" style="background-color: #1e96fc; color: #fff; margin-right: 2em">Edit</a>
                                        <button class="button-2" style="background-color: #EFA9AE; color: #fff">Cancel</button>
                                    </div>
                                </div>
                            </form>
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
