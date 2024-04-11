<%-- 
    Document   : user-create
    Created on : Apr 7, 2024, 4:30:21 PM
    Author     : chun
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Create</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/user-create.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    </head>
    <body>
        <!-- side bar -->
        <div class="d-flex flex-row">
            <%@include file="../../Component/side-bar.jsp" %>
            <!-- navigation bar + main content-->
            <div class="main-content">
                <!-- navigation bar -->
                <%@include file="../../Component/nav-bar.jsp" %>
                <!-- body -->
                <div class="container-fluid mt-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb" style="margin-left: 1em">
                            <li class="breadcrumb-item"><a href="user-list">User List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a  href="user-create">Create User</a>
                            </li>
                        </ol>
                    </nav>
                    <!-- content-card -->
                    <div class="card my-card">
                        <form id="blogForm" action="user-create" method="post">
                            <div class="content">
                                <!-- class="content-1" -->
                                <div class="content-1">

                                </div>
                                <!-- class="content-2" -->
                                <div class="card-body">
                                    <form action="">
                                        <div class="part1 mt-3">
                                            <!-- row1 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Full Name<span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input name="fullNameSelected" type="text" class="form-control" placeholder="Type a name..." required/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-6 row">
                                                    <div class="col-md-3 part-title">
                                                        Email<span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input name="emailSelected" type="text" class="form-control" placeholder="Type an email..." required/>
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
                                                            <input name="dateSelected" type="date" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-6 row">
                                                    <div class="col-md-3 part-title">
                                                        Address
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input name="addressSelected" type="text" class="form-control" placeholder="Type an address..."/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row3 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Phone Number
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input name="phoneSelected" type="text" class="form-control" placeholder="Type a number..."/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-6 row">
                                                    <div class="col-md-3 part-title">
                                                        Gender<span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select" name="genderSelected">
                                                                <option selected disabled>Select a gender</option>
                                                                <option value="1">Male</option>
                                                                <option value="2">Female</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="part2 mt-3">
                                            <!-- row1 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Role<span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select" name="userRoleSelected">
                                                                <option selected disabled>Select a role... </option>
                                                                <c:forEach items="${userRole}" var="userRole">
                                                                    <option value="${userRole.userRoleId}">${userRole.roleName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-6 row">
                                                    <div class="col-md-3 part-title">
                                                        Department<span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select" name="departmentSelected">
                                                                <option selected disabled> Type a department </option>
                                                                <c:forEach items="${departmentList}" var="departmentList">
                                                                    <option value="${departmentList.departmentId}">${departmentList.departmentName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row2 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">
                                                    <div class="col-md-3 part-title">
                                                        Status<span style="color: red;">*</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <select class="form-select" name="statusSelected">
                                                                <option  disabled>Select a status</option>
                                                                <c:forEach items="${userStatus}" var="userStatus">
                                                                    <c:if test="${userStatus.userStatusId == 1}">
                                                                        <option selected value="${userStatus.userStatusId}">${userStatus.statusName}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-6 row">
                                                    <div class="col-md-3 part-title">
                                                        Note
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-group" style="padding: 0px !important;">
                                                            <input name="noteSelected" type="text" class="form-control" placeholder="N/A">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- row3 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">

                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-6 row">

                                                </div>
                                            </div>
                                            <!-- row4 -->
                                            <div class="row mb-3">
                                                <div class="col-md-5 row">

                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-6 row">

                                                </div>
                                            </div>
                                        </div>
                                        <br><br>
                                        <div class="d-flex justify-content-center">
                                            <button class="button-2" type="submit"
                                                    style="background-color: #ABDF75; color: #fff;" >Submit</button>
                                            <button class="button-2"
                                                    style="background-color: #EFA9AE; color: #fff; margin-left: 3em;">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>        
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
            
            //benefits multi choice
            $('#small-select2-options-multiple-field-benefits').select2({
                theme: "bootstrap-5",
                width: $(this).data('width') ? $(this).data('width') : $(this).hasClass('w-100') ? '100%' : 'style',
                placeholder: $(this).data('placeholder'),
                closeOnSelect: false,
                selectionCssClass: 'select2--small',
                dropdownCssClass: 'select2--small'
            });
            
            //levels multi choice
            $('#small-select2-options-multiple-field-levels').select2({
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