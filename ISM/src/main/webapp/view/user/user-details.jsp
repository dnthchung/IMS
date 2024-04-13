<%-- 
    Document   : user-details
    Created on : Apr 7, 2024, 6:21:22 PM
    Author     : chun
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Details</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/user-details.css">
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
                    <nav aria-label="breadcrumb" style="margin-left: 1em">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="user-list">User List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a href="user-details?userId=${user.userId}">User Details</a>
                            </li>
                        </ol>
                    </nav>
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
                                        <span class="button-text">Activate User</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-check">
                                            <path d="M20 6 9 17l-5-5"/>
                                            </svg>
                                        </span>
                                    </button>
<!--                                    <button class="button33orange" style="margin-right: 10px; width: 180px !important">
                                        <span class="button-text">Declined Offer</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x">
                                            <path d="M18 6 6 18"/>
                                            <path d="m6 6 12 12"/>
                                            </svg>
                                        </span>
                                    </button>-->
                                    <!--user-->
<!--                                    <button class="button32" style="width: 170px !important">
                                        <span class="button-text">Cancel Offer</span>
                                        <span class="button-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                 stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                 class="lucide lucide-ban">
                                            <circle cx="12" cy="12" r="10" />
                                            <path d="m4.9 4.9 14.2 14.2" />
                                            </svg>
                                        </span>
                                    </button>-->
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
                                                        <td class="part-title">Full Name</td>
                                                        <td>${user.fullName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">D.O.B</td>
                                                        <td>${user.dob}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Phone Number</td>
                                                        <td>${user.phoneNumber}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Role</td>
                                                        <c:forEach items="${userRole}" var="role">
                                                            <c:if test="${user.userRoleId == role.userRoleId}">
                                                                <td>${role.roleName}</td>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Status</td>
                                                        <c:forEach items="${userStatus}" var="status">
                                                            <c:if test="${user.userStatusId == status.userStatusId}">
                                                                <td>${status.statusName}</td>
                                                            </c:if>
                                                        </c:forEach>
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
                                                        <td class="part-title">Email</td>
                                                        <td>
                                                            <p>${user.email}</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Address</td>
                                                        <td>
                                                            ${user.address}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Gender</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${user.gender == 1}">
                                                                    <p>Male</p>
                                                                </c:when>
                                                                <c:when test="${user.gender == 2}">
                                                                    <p>Female</p>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <p>Unknown</p>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Department</td>
                                                        <c:forEach items="${departmentList}" var="department">
                                                            <c:if test="${department.departmentId == user.departmentId}">
                                                                <td>
                                                                    <p>${department.departmentName}</p>
                                                                </td>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tr>
                                                    <tr>
                                                        <td class="part-title">Note</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty user.note}">
                                                                    ${user.note}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    N/A
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mt-5">
                                        <a type="button" href="user-edit?userId=${user.userId}&flag=1" class="button-2" style="background-color: #1e96fc; color: #fff; margin-right: 2em">Edit</a>
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
