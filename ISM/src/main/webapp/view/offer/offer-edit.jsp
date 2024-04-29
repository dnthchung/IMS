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

        <style>
            .mwrong-field {
                font-style: italic;
                font-weight: bold;
                font-size: smaller;
                color: #F4796B;
            }
        </style>
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
                            <li class="breadcrumb-item"><a style="text-decoration: none" href="offer-list">Offer List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a>Edit Offer</a>
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
                                                        <select id="candidateSelect" class="form-select" name="candidateId" title="Select a candidate">
                                                            <c:forEach var="candidate" items="${requestScope.offerableCandidate}">
                                                                <option value="${candidate.candidateId}" 
                                                                        <c:if test="${candidate.candidateId == requestScope.updatingOffer.candidateId}">selected</c:if>
                                                                        >${candidate.fullName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="candidateErr" class="mwrong-field" hidden="">Invalid candidate</p>
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
                                                        <select id="contractTypeSelect" class="form-select" name="contractTypeID" title="Select type of contract for this offer">
                                                            <c:forEach var="contractType" items="${sessionScope.contractTypes}">
                                                                <option value="${contractType.getContractTypeID()}" 
                                                                        <c:if test="${contractType.getContractTypeID() == requestScope.updatingOffer.contractTypeId}">selected</c:if>
                                                                        >${contractType.getTypeName()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="contractTypeErr" class="mwrong-field" hidden="">Invalid contract type</p>
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
                                                        <select id="positionSelect" class="form-select" name="positionId" title="Select a position for candidate">
                                                            <c:forEach var="position" items="${sessionScope.positions}">
                                                                <option value="${position.positionId}" 
                                                                        <c:if test="${position.positionId == requestScope.updatingOffer.positionId}">selected</c:if>
                                                                        >${position.positionName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="positionErr" class="mwrong-field" hidden="">Invalid position</p>
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
                                                        <select id="levelSelect" class="form-select" name="levelId" title="Select a level for candidate">
                                                            <c:forEach var="level" items="${sessionScope.levels}">
                                                                <option value="${level.levelId}" 
                                                                        <c:if test="${level.levelId == requestScope.updatingOffer.levelId}">selected</c:if>
                                                                        >${level.levelName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="levelErr" class="mwrong-field" hidden="">Invalid level</p>
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
                                                        <select id="approverSelect" class="form-select" name="approverId" title="Select a manager that can approve this offer">
                                                            <c:forEach var="manager" items="${requestScope.activeManagers}">
                                                                <option value="${manager.userId}" 
                                                                        <c:if test="${manager.userId == requestScope.updatingOffer.appover}">selected</c:if>
                                                                        >${manager.fullName} - ${manager.useName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="approverErr" class="mwrong-field" hidden="">Invalid approver</p>
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
                                                        <select id="departmentSelect" class="form-select" name="departmentId" title="Select a department for candidate">
                                                            <c:forEach var="dept" items="${sessionScope.departments}">
                                                                <option value="${dept.departmentId}" 
                                                                        <c:if test="${dept.departmentId == requestScope.updatingOffer.departmentId}">selected</c:if>
                                                                        >${dept.departmentName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="departmentErr" class="mwrong-field" hidden="">Invalid department</p>
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
                                                        <select id="interviewSelect" class="form-select" id="interviewSelect" name="interviewScheduleId" title="Interview schedule title will be loaded when choose a candidate">
                                                            <c:forEach var="interview" items="${requestScope.interviewSchedules}">
                                                                <option value="${interview.interviewScheduleId}" 
                                                                        <c:if test="${interview.interviewScheduleId == requestScope.updatingOffer.interviewScheduleId}">selected</c:if>
                                                                        >${interview.scheduleTitle}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="interviewErr" class="mwrong-field" hidden="">Invalid interview schedule title</p>
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
                                                        <select id="recruiterSelect" class="form-select" name="recruiterId" title="Select a recruiter for selected candidate">
                                                            <c:forEach var="recru" items="${requestScope.activeRecuiters}">
                                                                <option value="${recru.userId}" 
                                                                        <c:if test="${recru.userId == requestScope.updatingOffer.recuiterOwner}">selected</c:if>
                                                                        >${recru.fullName} - ${recru.useName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <p id="recruiterErr" class="mwrong-field" hidden="">Invalid recruiter</p>
                                                    </div>
                                                    <c:if test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.userRoleId == 2}">
                                                        <div style="margin-top: 5px;">
                                                            <a id="assignMeBtn" href="" style="color: #000">Assigned to me</a>
                                                        </div>
                                                    </c:if>
                                                </div>
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
                                                    <div>
                                                        <p id="dueDateErr" class="mwrong-field" hidden="">Please select a date</p>
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
                                                        <input id="salaryInp" type="text" name="salary" class="form-control" placeholder="Enter basic salary" onchange="formatCurrency(this)" value="${requestScope.updatingOffer.getFormatedSalary()}">
                                                    </div>
                                                    <div>
                                                        <p id="salaryErr" class="mwrong-field" hidden="">Min: 1.000.000 VND</p>
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
                                                        <label for="floatingTextarea">Type a note</label>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="d-flex justify-content-center">
                                        <button id="submitBtn" type="submit" class="button-2"
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

        <div class="toast-container position-absolute end-0 p-3" style="z-index: 11; bottom: 79.3%">
            <div id="myToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header" style="background-color: #ccdb9e">
                    <strong class="me-auto">IMS Notification</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body" style="background-color: #f6f9ed">
                    <span id="toastMessageContent"></span>
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

        <input type="hidden" id="toastMessage" value="${requestScope.isInvalidData}" />
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let toastMessageInput = document.getElementById("toastMessage");
                let toastMessageContent = document.getElementById("toastMessageContent");

                // Kiểm tra xem input hidden có nội dung không
                if (toastMessageInput && toastMessageInput.value) {
                    // Hiển thị nội dung của toast
                    toastMessageContent.innerText = toastMessageInput.value;

                    // Hiển thị toast
                    var myToast = new bootstrap.Toast(document.getElementById('myToast'));
                    myToast.show();
                }
            });
        </script>

        <input type="hidden" id="start-date-input" value="${updatingOffer.getFormatedDate(updatingOffer.contractFrom)}">
        <script>
            var existedVal = document.getElementById('start-date-input').value;
            var currentDate = new Date();
            currentDate.setHours(0, 0, 0, 0);
            flatpickr("#inp-start-date", {
                dateFormat: "d/m/Y",
                minDate: currentDate.setDate(currentDate.getDate() + 7),
                defaultDate: existedVal
            });
        </script>

        <input type="hidden" id="end-date-input" value="${updatingOffer.getFormatedDate(updatingOffer.contractTo)}">
        <script>
            var existedVal = document.getElementById('end-date-input').value;
            flatpickr("#inp-end-date", {
                dateFormat: "d/m/Y",
                defaultDate: existedVal,
                minDate: existedVal
            });
        </script>

        <input type="hidden" id="due-date-input" value="${updatingOffer.getFormatedDate(updatingOffer.dueDate)}">
        <script>
            var existedVal = document.getElementById('due-date-input').value;
            var existedStartVal = document.getElementById('start-date-input').value;
            var currentDateNow = new Date();
            currentDateNow.setHours(0, 0, 0, 0);
            var parts = existedStartVal.split("/");
            var day = parseInt(parts[0], 10);
            var month = parseInt(parts[1], 10) - 1; // Trừ đi 1 vì tháng trong JavaScript bắt đầu từ 0
            var year = parseInt(parts[2], 10);
            var maxDate = new Date(year, month, day);
            maxDate.setDate(maxDate.getDate() - 1); // Giảm một ngày để được ngày tối đa
            console.log(existedStartVal);
            console.log(existedVal);
            console.log(currentDateNow);
            console.log(maxDate);
            flatpickr("#inp-due-date", {
                dateFormat: "d/m/Y",
                defaultDate: existedVal,
                minDate: currentDateNow,
                maxDate: maxDate
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
                            if (typeof note === 'undefined') {
                                note = "N/A";
                            }
                            var scheduleId = response.interviewScheduleId;
                            var scheduleTitle = response.scheduleTitle;
                            $('#interviewSelect').append('<option value="' + scheduleId + '" selected>' + scheduleTitle + '</option>');
                            $("#interviewNotes").text(note);
                        }
                    });
                });
            });
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const form = document.querySelector('form[action="edit-offer"]');
                const submitBtn = document.querySelector('button[type="submit"]');

                const candidateSelect = document.getElementById('candidateSelect');
                candidateSelect.addEventListener('change', function () {
                    const candidateValue = candidateSelect.value;
                    if (candidateValue.includes('Select')) {
                        submitBtn.disabled = true;
                        document.getElementById('candidateErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('candidateErr').setAttribute('hidden', true);
                    }
                });

                const contractTypeSelect = document.getElementById('contractTypeSelect');
                contractTypeSelect.addEventListener('change', function () {
                    const contractTypeValue = contractTypeSelect.value;
                    if (contractTypeValue.includes('Select')) {
                        submitBtn.disabled = true;
                        document.getElementById('contractTypeErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('contractTypeErr').setAttribute('hidden', true);
                        var currentDate = new Date();

                        flatpickr("#inp-start-date", {
                            dateFormat: "d/m/Y",
                            minDate: currentDate.setDate(currentDate.getDate() + 7),
                            defaultDate: currentDate.setDate(currentDate.getDate() + 7)
                        });
                        var addMonths = 2;
                        switch (contractTypeValue) {
                            case '1':
                                addMonths = 2;
                                break;
                            case '2':
                                addMonths = 3;
                                break;
                            case '3':
                                addMonths = 12;
                                break;
                            case '4':
                                addMonths = 36;
                                break;
                            default:
                                addMonths = 2;
                        }
                        var endDate = new Date(currentDate);
                        // Add months to endDate
                        endDate.setMonth(currentDate.getMonth() + addMonths);

                        flatpickr("#inp-end-date", {
                            dateFormat: "d/m/Y",
                            minDate: endDate,
                            defaultDate: endDate
                        });
                    }
                });

                const positionSelect = document.getElementById('positionSelect');
                positionSelect.addEventListener('change', function () {
                    const positionValue = positionSelect.value;
                    if (positionValue.includes('Select')) {
                        submitBtn.disabled = true;
                        document.getElementById('positionErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('positionErr').setAttribute('hidden', true);
                    }
                });

                const levelSelect = document.getElementById('levelSelect');
                levelSelect.addEventListener('change', function () {
                    const levelValue = levelSelect.value;
                    if (levelValue.includes('Select')) {
                        submitBtn.disabled = true;
                        document.getElementById('levelErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('levelErr').setAttribute('hidden', true);
                    }
                });

                const approverSelect = document.getElementById('approverSelect');
                approverSelect.addEventListener('change', function () {
                    const approverValue = approverSelect.value;
                    if (approverValue.includes('Select')) {
                        submitBtn.disabled = true;
                        document.getElementById('approverErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('approverErr').setAttribute('hidden', true);
                    }
                });

                const departmentSelect = document.getElementById('departmentSelect');
                departmentSelect.addEventListener('change', function () {
                    const departmentValue = departmentSelect.value;
                    if (departmentValue.includes('Select')) {
                        submitBtn.disabled = true;
                        document.getElementById('departmentErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('departmentErr').setAttribute('hidden', true);
                    }
                });

                const recruiterSelect = document.getElementById('recruiterSelect');
                recruiterSelect.addEventListener('change', function () {
                    const recruiterValue = recruiterSelect.value;
                    if (recruiterValue.includes('Select')) {
                        submitBtn.disabled = true;
                        document.getElementById('recruiterErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('recruiterErr').setAttribute('hidden', true);
                    }
                });

                form.addEventListener('submit', function (event) {
                    if (candidateSelect.value.includes('Select')) {
                        event.preventDefault();
                        document.getElementById('candidateErr').removeAttribute('hidden');
                        submitBtn.disabled = true;
                    } else {
                        document.getElementById('candidateErr').setAttribute('hidden', true);
                    }

                    if (contractTypeSelect.value.includes('Select')) {
                        event.preventDefault();
                        document.getElementById('contractTypeErr').removeAttribute('hidden');
                        submitBtn.disabled = true;
                    } else {
                        document.getElementById('contractTypeErr').setAttribute('hidden', true);
                    }

                    if (positionSelect.value.includes('Select')) {
                        event.preventDefault();
                        document.getElementById('positionErr').removeAttribute('hidden');
                        submitBtn.disabled = true;
                    } else {
                        document.getElementById('positionErr').setAttribute('hidden', true);
                    }

                    if (levelSelect.value.includes('Select')) {
                        event.preventDefault();
                        document.getElementById('levelErr').removeAttribute('hidden');
                        submitBtn.disabled = true;
                    } else {
                        document.getElementById('levelErr').setAttribute('hidden', true);
                    }

                    if (approverSelect.value.includes('Select')) {
                        event.preventDefault();
                        document.getElementById('approverErr').removeAttribute('hidden');
                        submitBtn.disabled = true;
                    } else {
                        document.getElementById('approverErr').setAttribute('hidden', true);
                    }

                    if (departmentSelect.value.includes('Select')) {
                        event.preventDefault();
                        document.getElementById('departmentErr').removeAttribute('hidden');
                        submitBtn.disabled = true;
                    } else {
                        document.getElementById('departmentErr').setAttribute('hidden', true);
                    }

                    if (recruiterSelect.value.includes('Select')) {
                        event.preventDefault();
                        document.getElementById('recruiterErr').removeAttribute('hidden');
                        submitBtn.disabled = true;
                    } else {
                        document.getElementById('recruiterErr').setAttribute('hidden', true);
                    }

                    var basicSalaryInput = document.getElementById("salaryInp");
                    var basicSalary = basicSalaryInput.value.replace(/[^\d]/g, '');
                    console.log(basicSalary);

                    if (basicSalary < 1000000 || basicSalary === NaN) {
                        event.preventDefault();
                        submitBtn.disabled = true;
                        document.getElementById('salaryErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('salaryErr').setAttribute('hidden', true);
                    }

                    var dueDateInput = document.getElementById("inp-due-date");
                    if (dueDateInput.value === '') {
                        event.preventDefault();
                        submitBtn.disabled = true;
                        document.getElementById('dueDateErr').removeAttribute('hidden');
                    } else {
                        submitBtn.disabled = false;
                        document.getElementById('dueDateErr').setAttribute('hidden', true);
                    }

                });
            });
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                // Function to check date validity
                function checkDateValidity() {
                    var paragraph = document.getElementById("contractDateErr");
                    if (paragraph) {
                        paragraph.innerHTML = "";
                    }

                    var startDateStr = document.getElementById('inp-start-date').value;
                    var endDateStr = document.getElementById('inp-end-date').value;

                    // Convert string dates to Date objects
                    var startDateArr = startDateStr.split('/');
                    var endDateArr = endDateStr.split('/');
                    var startDate = new Date(startDateArr[2], startDateArr[1] - 1, startDateArr[0]); // Year, Month (0-indexed), Day
                    var endDate = new Date(startDate); // Make a copy of startDate

                    const contractTypeSelect = document.getElementById('contractTypeSelect');
                    var contractTypeValue = contractTypeSelect.value;
                    var addMonths = 2;
                    switch (contractTypeValue) {
                        case '1':
                            addMonths = 2;
                            break;
                        case '2':
                            addMonths = 3;
                            break;
                        case '3':
                            addMonths = 12;
                            break;
                        case '4':
                            addMonths = 36;
                            break;
                        default:
                            addMonths = 2;
                    }

                    // Add months to endDate
                    endDate.setMonth(endDate.getMonth() + addMonths);

                    flatpickr("#inp-end-date", {
                        dateFormat: "d/m/Y",
                        defaultDate: endDate // Set the default end date
                    });

                    flatpickr("#inp-due-date", {
                        dateFormat: "d/m/Y",
                        minDate: "today",
                        maxDate: startDate - 1
                    });

                    if (startDate >= endDate) {
                        console.log("Invalid date");
                        document.getElementById('submitBtn').disabled = true;
                        paragraph.innerHTML = "From Date needs to be earlier than To date";
                        paragraph.removeAttribute('hidden');
                    } else {
                        console.log("Valid date");
                        document.getElementById('submitBtn').disabled = false;
                        paragraph.setAttribute('hidden', true);
                    }

                    var dueDateStr = document.getElementById('inp-due-date').value;
                    if (dueDateStr === '') {
                        submitBtn.disabled = true;
                        document.getElementById('dueDateErr').removeAttribute('hidden');
                    } else {
                        flatpickr("#inp-due-date", {
                            dateFormat: "d/m/Y",
                            minDate: "today",
                            maxDate: startDate - 1,
                            defaultDate: dueDateStr
                        });
                        submitBtn.disabled = false;
                        document.getElementById('dueDateErr').setAttribute('hidden', true);
                    }

                }

                function checkDueDateValidity() {
                    var startDateStr = document.getElementById('inp-start-date').value;
                    var dueDateStr = document.getElementById('inp-due-date').value;
                    var startDateArr = startDateStr.split('/');
                    var startDate = new Date(startDateArr[2], startDateArr[1] - 1, startDateArr[0]); // Year, Month (0-indexed), Day
                    if (dueDateStr === '') {
                        submitBtn.disabled = true;
                        document.getElementById('dueDateErr').removeAttribute('hidden');
                    } else {
                        flatpickr("#inp-due-date", {
                            dateFormat: "d/m/Y",
                            minDate: "today",
                            maxDate: startDate - 1,
                            defaultDate: dueDateStr
                        });
                        submitBtn.disabled = false;
                        document.getElementById('dueDateErr').setAttribute('hidden', true);
                    }
                }

                // Attach change event listeners to input fields
                document.getElementById('inp-start-date').addEventListener('change', checkDateValidity);
                document.getElementById('inp-end-date').addEventListener('change', checkDateValidity);
                document.getElementById('inp-due-date').addEventListener('change', checkDueDateValidity);

            });
        </script>

        <script>
            function formatCurrency(input) {
                // Lấy giá trị nhập vào từ thẻ input
                let value = input.value;

                // Xóa các dấu phân cách và ký tự tiền tệ
                let number = value.replace(/[^\d]/g, '');

                // Định dạng số theo định dạng tiền tệ mong muốn
                let formattedValue = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND', currencyDisplay: 'symbol'}).format(number);

                // Thay thế ký hiệu tiền tệ mặc định thành 'VND'
                formattedValue = formattedValue.replace('₫', 'VND');

                // Gán lại giá trị đã định dạng vào thẻ input
                input.value = formattedValue;

                if (number < 1000000) {
                    document.getElementById('salaryErr').removeAttribute('hidden');
                    document.getElementById('submitBtn').disabled = true;
                } else {
                    document.getElementById('salaryErr').setAttribute('hidden', true);
                    document.getElementById('submitBtn').disabled = false;
                }
            }
        </script>

        <input type="hidden" id="userId" value="${sessionScope.loggedInUser.userId}">
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById('assignMeBtn').addEventListener("click", function (event) {
                    event.preventDefault();
                    var hiddenValue = document.getElementById("userId").value;
                    var selectElement = document.querySelector('select[name="recruiterId"]');
                    var options = selectElement.options;
                    for (var i = 0; i < options.length; i++) {
                        if (options[i].value === hiddenValue) {
                            options[i].selected = true;
                            break;
                        }
                    }
                });
            });
        </script>
    </body>
</html>
