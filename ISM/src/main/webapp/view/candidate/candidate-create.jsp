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
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/candidate-create.css">
    </head>
    <body>
        <!-- side bar -->
        <div class="d-flex flex-row">
            <%@include file="Component/side-bar.jsp" %>
            <!-- navigation bar + main content-->
            <div class="main-content">
                <!-- navigation bar -->
                <%@include file="Component/nav-bar.jsp" %>
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
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" required>
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
                                                                id="small-select2-options-multiple-field-skills" multiple>
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
            $('#small-select2-options-multiple-field-skills').select2({
                theme: "bootstrap-5",
                width: $(this).data('width') ? $(this).data('width') : $(this).hasClass('w-100') ? '100%' : 'style',
                placeholder: $(this).data('placeholder'),
                closeOnSelect: false,
                selectionCssClass: 'select2--small',
                dropdownCssClass: 'select2--small'
            });
        </script>
    </body>
</html>
