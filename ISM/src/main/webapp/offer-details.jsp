<%-- 
    Document   : offer-details
    Created on : Apr 7, 2024, 6:21:22 PM
    Author     : chun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offer Details</title>
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
        <link rel="stylesheet" href="CSS/offer-details.css">

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
            <!-- navigation bar + main content-->
            <div class="main-content">
                <!-- navigation bar -->
                <nav class="navbar navbar-expand-sm ">
                    <div class="container-fluid">
                        <div class="mpage-name" href="#">
                            <h2 class="" style="color: black;">Offer</h2>
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
                            <li class="breadcrumb-item"><a href="#">Offer List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a href="#">Offer Details</a>
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
                            <div class="row mb-3">
                                <div class="col-md-6">
                                </div>
                                <div class="col-md-6">
                                    <!--manager-->
<!--                                    <button class="button323" style="margin-right: 10px">
                                        <span class="button-text">Approve</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-check">
                                            <path d="M20 6 9 17l-5-5"/>
                                            </svg>
                                        </span>
                                    </button>
                                    <button class="button32" style="margin-right: 10px">
                                        <span class="button-text">Reject</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x">
                                            <path d="M18 6 6 18"/>
                                            <path d="m6 6 12 12"/>
                                            </svg>
                                        </span>
                                    </button>-->
<!--                                    <button class="button33blue" style="margin-right: 10px">
                                        <span class="button-text">Mark as Sent to Candidate</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-send">
                                            <path d="m22 2-7 20-4-9-9-4Z"/>
                                            <path d="M22 2 11 13"/>
                                            </svg>
                                        </span>
                                    </button>-->
                                    <button class="button33blue" style="margin-right: 10px; width: 180px !important">
                                        <span class="button-text">Accepted Offer</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-check">
                                            <path d="M20 6 9 17l-5-5"/>
                                            </svg>
                                        </span>
                                    </button>
                                    <button class="button33orange" style="margin-right: 10px; width: 180px !important">
                                        <span class="button-text">Declined Offer</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x">
                                            <path d="M18 6 6 18"/>
                                            <path d="m6 6 12 12"/>
                                            </svg>
                                        </span>
                                    </button>
                                    <!--user-->
                                    <button class="button32" style="width: 170px !important">
                                        <span class="button-text">Cancel Offer</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                 stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                 class="lucide lucide-ban">
                                            <circle cx="12" cy="12" r="10" />
                                            <path d="m4.9 4.9 14.2 14.2" />
                                            </svg>
                                        </span>
                                    </button>
                                </div>
                            </div>
                            <form action="">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <table class="table table-striped">
                                                <thead>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="part-title">Candidate</td>
                                                        <td>Nguyen Xuan Pi</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Position</td>
                                                        <td>Developer</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Approver</td>
                                                        <td>Đoàn Chung</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Interview Info</td>
                                                        <td>
                                                            <p>Interview SBA</p>
                                                            <p>Interviewer: ThuyNT, HaNN2</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Contract Period</td>
                                                        <td>
                                                            <div class="d-flex ">
                                                                <p style="margin-right: 10px">From</p>
                                                                <p class="me-auto">
                                                                    <strong>12/02/2022</strong>
                                                                </p>
                                                                <p style="margin-right: 10px">To</p>
                                                                <p>
                                                                    <strong>12/02/2023</strong>
                                                                </p>
                                                            </div>
                                                        </td>
                                                    <tr>
                                                        <td class="part-title">Interview Notes</td>
                                                        <td>
                                                            <p>Candidate is fully-match with
                                                                5 years experiences in IT
                                                                industry</p>
                                                        </td>
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
                                                        <td class="part-title">Contract Type</td>
                                                        <td>
                                                            <p>Full-time</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Level</td>
                                                        <td>
                                                            Senior
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Department</td>
                                                        <td>
                                                            <p>IT</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Recruiter Owner</td>
                                                        <td>
                                                            <p>hi</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Due Date</td>
                                                        <td>
                                                            <p>25/12/2021</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Basic Salary</td>
                                                        <td>
                                                            <p>25.000.000<span> VND</span></p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Note</td>
                                                        <td>
                                                            <p>N/A</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mt-5">
                                        <a type="button" href="offer-edit.jsp" class="button-2" style="background-color: #1e96fc; color: #fff; margin-right: 2em">Edit</a>
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
