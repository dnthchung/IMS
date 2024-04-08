<%-- 
    Document : user-list 
    Created on : Apr 6, 2024, 4:09:46 PM 
    Author : chun 
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offer List</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">
        <!-- link to css -->
        <link rel="stylesheet" href="CSS/user-list.css">
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
                    <!-- content-card -->
                    <div class="card mt-3 my-card">
                        <div class="content">
                            <div>
                                <h4>Offer list</h4>
                                <div>
                                    <div class="row mt-5">
                                        <div class="col-md-8">
                                            <div class="col-md-3">
                                                <!-- Search Area -->
                                                <div class="input-group" style="padding: 0px !important;">
                                                    <input type="text" class="form-control" placeholder="Search">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">
                                                            <i data-lucide="search"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-10"></div>
                                            <div class="col-md-3 mt-3">
                                                <div class="input-group" style="padding: 0px !important;">
                                                    <select class="form-select">
                                                        <option selected>Department</option>
                                                        <option value="1">Active</option>
                                                        <option value="2">Inactive</option>
                                                    </select>
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
                                <div class="p-2 mt-3"> 
                                    <button class="button31">
                                        <span class="button-text">Export</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-up-to-line">
                                            <path d="M5 3h14"/>
                                            <path d="m18 13-6-6-6 6"/>
                                            <path d="M12 7v14"/>
                                            </svg>

                                        </span>
                                    </button>
                                </div>
                            </div>

                            <div class="card mt-3">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table text-center table-striped">
                                            <thead>
                                                <tr>
                                                    <th scope="col"> <strong>Candidate Name</strong> </th>
                                                    <th scope="col"> <strong>Email</strong> </th>
                                                    <th scope="col"> <strong>Approver</strong> </th>
                                                    <th scope="col"> <strong>Department</strong> </th>
                                                    <th scope="col"> <strong>Notes</strong> </th>
                                                    <th scope="col"> <strong>Status</strong> </th>
                                                    <th scope="col"> <strong>Action</strong> </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!--  table data rows  -->
                                                <tr>
                                                    <td>Doan Thanh Chung</td>
                                                    <td>chungdthe176077@fpt.edu.vn</td>
                                                    <td>Lê Việt Anh</td>
                                                    <td>Product Policy</td>
                                                    <td>Approved by CS head</td>
                                                    <td>Waiting for Approval</td>
                                                    <td>
                                                        <a style="margin-right: 5px;text-decoration: none; color: black; "
                                                           href="#" class="icon-button">
                                                            <i data-lucide="eye"></i>
                                                        </a>
                                                        <a style="margin-right: 5px;text-decoration: none; color: black;"
                                                           href="#" class="icon-button">
                                                            <i data-lucide="file-pen-line"></i>
                                                        </a>
                                                        <a style="text-decoration: none; color: black;" href="#"
                                                           class="icon-button">
                                                            <i data-lucide="trash-2"></i>
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