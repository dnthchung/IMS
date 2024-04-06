<%-- 
    Document   : candidate-create
    Created on : Apr 6, 2024, 4:46:35 PM
    Author     : chun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Create</title>
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
        <link rel="stylesheet" href="CSS/candidate-create.css">

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
                            <h2 class="" style="color: black;">Candidate</h2>
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
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb" style="margin-left: 1em">
                            <li class="breadcrumb-item"><a href="#">Candidate List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a  href="candidate-create.jsp">Create Candidate</a>
                            </li>
                        </ol>
                    </nav>
                    <!-- content-card -->
                    <div class="card mt-3 my-card">
                        <div class="content">
                            <!-- class="content-1" -->
                            <div class="content-1">

                            </div>
                            <!-- class="content-2" -->
                            <div class="card mt-3">
                                <div class="card-body">
                                    <form action="">

                                        <h5 style="font-weight: bold;">I. Personal information</h5>
                                        <div class="part1 mt-3">
                                            <!-- row1 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Full name <span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <!-- full name -->
                                                            <input type="text" class="form-control"
                                                                   placeholder="type a name" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Gmail <span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <!-- gmail -->
                                                            <input type="text" class="form-control"
                                                                   placeholder="type an email..." required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row2 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        D.O.B
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input type="date" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Address
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input type="text" class="form-control"
                                                                   placeholder="type an address...">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row3 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Phone number
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input type="text" class="form-control"
                                                                   placeholder="type a number...">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Gender <span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;"
                                                             required>
                                                            <select class="form-select">
                                                                <option selected disabled>Status</option>
                                                                <option value="1">Active</option>
                                                                <option value="2">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <h5 style="font-weight: bold;">II. Professional information</h5>
                                        <div class="part2 mt-3">
                                            <!-- row1 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        CV attachment
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <!-- CV -->
                                                            <input type="file" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Note
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <!-- note -->
                                                            <input type="text" class="form-control" placeholder="N/A">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row2 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Position <span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select">
                                                                <option selected disabled style="font-size: small;">
                                                                    Select a position...
                                                                    ex:
                                                                    Backend developer, ...
                                                                </option>
                                                                <option value="1">Active</option>
                                                                <option value="2">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Status <span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select">
                                                                <option selected disabled>Select a status</option>
                                                                <option value="1">Active</option>
                                                                <option value="2">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row3 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Skills <span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select"
                                                                    data-placeholder="Choose skills ..."
                                                                    id="small-select2-options-multiple-field" multiple>
                                                                <option>Java</option>
                                                                <option>JavaScript</option>
                                                                <option>Python</option>
                                                                <option>C++</option>
                                                                <option>HTML</option>
                                                                <option>CSS</option>
                                                                <option>PHP</option>
                                                                <option>Ruby</option>
                                                                <option>Swift</option>
                                                                <option>Kotlin</option>
                                                                <option>SQL</option>
                                                                <option>Go</option>
                                                                <option>C#</option>
                                                                <option>Perl</option>
                                                                <option>Objective-C</option>
                                                                <option>Assembly</option>
                                                                <option>TypeScript</option>
                                                                <option>Rust</option>
                                                                <option>Shell</option>
                                                                <option>Scala</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div id="selectedSkills"></div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Year of Experience
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input type="number" min="0" class="form-control"
                                                                   placeholder="type a number...">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row4 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Recruiter <span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select">
                                                                <option selected disabled style="font-size: small;">
                                                                    Recruiter name
                                                                </option>
                                                                <option value="1">Active</option>
                                                                <option value="2">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div id="selectedSkills"></div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Highest level<span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select">
                                                                <option selected disabled style="font-size: small;">
                                                                    Select hightest
                                                                    level...
                                                                </option>
                                                                <option value="1">Active</option>
                                                                <option value="2">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-2">
                                                    <button
                                                        style="border: none; background-color: #ffffff; text-decoration: underline;">
                                                        Assign me
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <br><br>
                                        <div class="d-flex justify-content-center">
                                            <button class="button-2"
                                                    style="background-color: #ABDF75; color: #fff;">Submit</button>
                                            <button class="button-2"
                                                    style="background-color: #EFA9AE; color: #fff; margin-left: 3em;">Cancel</button>
                                        </div>

                                    </form>
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
