<%-- 
    Document   : offer-edit
    Created on : Apr 7, 2024, 6:12:21 PM
    Author     : chun
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Offer</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/offer-edit.css">
        <!--Flatpickr-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
                            <li class="breadcrumb-item"><a href="offer-list">Offer List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a  href="#">Edit Offer</a>
                            </li>
                        </ol>
                    </nav>
                    <!-- content-card -->
                    <div class="card my-card">
                        <div class="content">
                            <!-- class="content-1" -->
                            <div class="content-1">

                            </div>
                            <!-- class="content-2" -->
                            <div class="card-body">
                                <form action="edit-offer" method="POST">
                                    <input type="hidden" name="offerId" value="${updatingOffer.offerId}">
                                    <div class="part1 mt-3">
                                        <!-- row1 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Candidate<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" id="candidateSelect" name="candidateId" required="">
                                                            <c:forEach var="candidate" items="${requestScope.offerableCandidate}">
                                                                <option value="${candidate.candidateId}" 
                                                                        <c:if test="${candidate.candidateId == requestScope.updatingOffer.candidateId}">selected</c:if>
                                                                        >${candidate.fullName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-6 row">
                                                <div class="col-md-3 part-title">
                                                    Contract Type<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="contractTypeID" required="">
                                                            <c:forEach var="contractType" items="${sessionScope.contractTypes}">
                                                                <option value="${contractType.getContractTypeID()}" 
                                                                        <c:if test="${contractType.getContractTypeID() == requestScope.updatingOffer.contractTypeId}">selected</c:if>
                                                                        >${contractType.getTypeName()}</option>
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
                                                    Position<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="positionId" required="">
                                                            <c:forEach var="position" items="${sessionScope.positions}">
                                                                <option value="${position.positionId}" 
                                                                        <c:if test="${position.positionId == requestScope.updatingOffer.positionId}">selected</c:if>
                                                                        >${position.positionName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-6 row">
                                                <div class="col-md-3 part-title">
                                                    Level<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="levelId" required="">
                                                            <c:forEach var="level" items="${sessionScope.levels}">
                                                                <option value="${level.levelId}" 
                                                                        <c:if test="${level.levelId == requestScope.updatingOffer.levelId}">selected</c:if>
                                                                        >${level.levelName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- row3 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Approver<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="approverId" required="">
                                                            <c:forEach var="manager" items="${requestScope.activeManagers}">
                                                                <option value="${manager.userId}" 
                                                                        <c:if test="${manager.userId == requestScope.updatingOffer.appover}">selected</c:if>
                                                                        >${manager.fullName} - ${manager.useName}</option>
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
                                                        <select class="form-select" name="departmentId" required="">
                                                            <c:forEach var="dept" items="${sessionScope.departments}">
                                                                <option value="${dept.departmentId}" 
                                                                        <c:if test="${dept.departmentId == requestScope.updatingOffer.departmentId}">selected</c:if>
                                                                        >${dept.departmentName}</option>
                                                            </c:forEach>
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
                                                    Interview Info<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" id="interviewSelect" name="interviewScheduleId" required="">
                                                            <c:forEach var="interview" items="${requestScope.interviewSchedules}">
                                                                <option value="${interview.interviewScheduleId}" 
                                                                        <c:if test="${interview.interviewScheduleId == requestScope.updatingOffer.interviewScheduleId}">selected</c:if>
                                                                        >${interview.scheduleTitle}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-6 row">
                                                <div class="col-md-3 part-title">
                                                    Recruiter Owner<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="recruiterId" required="">
                                                            <c:forEach var="recru" items="${requestScope.activeRecuiters}">
                                                                <option value="${recru.userId}" 
                                                                        <c:if test="${recru.userId == requestScope.updatingOffer.recuiterOwner}">selected</c:if>
                                                                        >${recru.fullName} - ${recru.useName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <c:if test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.userRoleId == 2}">
                                                    <div class="col-md-12">
                                                        <div style="margin-top: 15px; margin-left: 175px">
                                                            <a href="#" style="color: #000">Assigned to me</a>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <!-- row2 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Contract Period<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8 d-flex">
                                                    <span style="margin-right: 10px;margin-top: 5px;">From </span>
                                                    <div class="cs-form col-md-5" style="margin-right: 10px">
                                                        <input type="date" id="inp-start-date" name="startDate" class="form-control"  required="" placeholder="DD/MM/YYYY"/>
                                                    </div>
                                                    <span style="margin-right: 10px;margin-top: 5px;">To </span>
                                                    <div class="cs-form col-md-5">
                                                        <input type="date" id="inp-end-date" name="endDate" class="form-control" required="" placeholder="DD/MM/YYYY" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-6 row">
                                                <div class="col-md-3 part-title">
                                                    Due Date<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <input type="date" id="inp-due-date" name="dueDate" class="form-control" required="" placeholder="DD/MM/YYYY">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- row3 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Interview Notes<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <c:forEach var="intw" items="${requestScope.interviewSchedules}">
                                                            <c:if test="${intw.interviewScheduleId == requestScope.updatingOffer.interviewScheduleId}">
                                                                <p id="interviewNotes">${intw.notes}</p>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-6 row">
                                                <div class="col-md-3 part-title">
                                                    Basic Salary<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <input type="text" name="salary" class="form-control" placeholder="Enter basic salary ..." required="" value="${updatingOffer.getFormatedSalary()}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- row4 -->
                                        <div class="row mb-3">
                                            <div class="col-md-6 row">
                                            </div>
                                            <div class="col-md-6 row">
                                                <div class="col-md-3 part-title">
                                                    Notes
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="form-floating" style="padding: 0px !important;">
                                                        <textarea style="height: 200px" name="note" class="form-control" placeholder="Type description" id="floatingTextarea">${updatingOffer.note}</textarea>
                                                        <label for="floatingTextarea">Comments</label>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="d-flex justify-content-center">
                                        <button class="button-2"
                                                style="background-color: #ABDF75; color: #fff;">Submit</button>
                                        <a href="offer-list" class="button-2"
                                           style="background-color: #EFA9AE; color: #fff; margin-left: 3em;">Cancel</a>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>
            //icon lucide
            lucide.createIcons();
        </script>

        <input type="hidden" id="start-date-input" value="${updatingOffer.getFormatedDate(updatingOffer.contractFrom)}">
        <script>
            var existedVal = document.getElementById('start-date-input').value;
            flatpickr("#inp-start-date", {
                dateFormat: "d/m/Y",
                defaultDate: existedVal
            });
        </script>

        <input type="hidden" id="end-date-input" value="${updatingOffer.getFormatedDate(updatingOffer.contractTo)}">
        <script>
            var existedVal = document.getElementById('end-date-input').value;
            flatpickr("#inp-end-date", {
                dateFormat: "d/m/Y",
                defaultDate: existedVal
            });
        </script>

        <input type="hidden" id="due-date-input" value="${updatingOffer.getFormatedDate(updatingOffer.dueDate)}">
        <script>
            var existedVal = document.getElementById('due-date-input').value;
            flatpickr("#inp-due-date", {
                dateFormat: "d/m/Y",
                defaultDate: existedVal
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#candidateSelect').change(function () {
                    var selectedOption = $(this).val();
                    $.ajax({
                        url: 'offer-api',
                        type: 'GET',
                        data: {candidateId: selectedOption},
                        success: function (response) { 
                            $('#interviewSelect').empty();
                            var note = response.notes;
                            var scheduleId = response.interviewScheduleId;
                            var scheduleTitle = response.scheduleTitle;
                            $('#interviewSelect').append('<option value="' + scheduleId + '" selected>' + scheduleTitle + '</option>');
                            $("#interviewNotes").text(note);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
