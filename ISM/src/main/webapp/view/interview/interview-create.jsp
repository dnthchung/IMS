<%-- 
    Document   : interview-create
    Created on : Apr 7, 2024, 2:23:21 PM
    Author     : chun
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Job</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/interview-create.css">
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
                            <li class="breadcrumb-item">
                                <a href="#">Interview Schedule List</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a  href="#">New Interview Schedule</a>
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
                                <form action="interview-create" method="post">
                                    <div class="part1 mt-3">
                                        <!-- row1 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-4 part-title">
                                                    Schedule title<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <input type="text" class="form-control" name="scheduleTitle" placeholder="Type a title..." required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Job<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="jobName"
                                                                data-placeholder="Select a job ...">
                                                            <option selected disabled>Select a job...</option>
                                                            <c:forEach var="i" items="${job}">
                                                                <option value="${i.jobId}">${i.jobTitle}</option>
                                                         
                                                            </c:forEach>
                                                        </select> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- row2 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-4 part-title">
                                                    Candidate name<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="candidate-name" placeholder="Select candidate ...">
                                                            <option selected disabled>Select candidate...</option>
                                                            <c:forEach var="candidate" items="${candidateList}">
                                                                <option value="${candidate.candidateId}">${candidate.fullName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Interviewer<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="interviewName"
                                                                data-placeholder="Choose benefits ..."
                                                                id="small-select2-options-multiple-field-interviews" multiple>
                                                            <c:forEach var="h" items="${isl}">
                                                            <option value="${h.interviewStatusId}">${h.statusName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- row3 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-4 part-title">
                                                    Schedule Time<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group"  style="padding: 0px !important;">
                                                        <input name="dateSchedule" type="date" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-12 d-flex mt-3">
                                                    <span style="margin-right: 10px;margin-left: 182px;margin-top: 5px;">From </span>
                                                    <div class="cs-form col-md-3" style="margin-right: 10px">
                                                        <input name="timeStart" type="time" class="form-control" />
                                                    </div>
                                                    <span style="margin-right: 10px;margin-top: 5px;">To </span>
                                                    <div class="cs-form col-md-3">
                                                        <input name="timeEnd" type="time" class="form-control" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Location
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <input type="text" name="location" class="form-control" placeholder="Type a location...">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="part2 mt-3">
                                        <!-- row1 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                                <div class="col-md-4 part-title">
                                                    Notes
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="form-floating" style="padding: 0px !important;">
                                                        <textarea style="height: 200px" class="form-control" placeholder="Type description" name="notes" id="floatingTextarea"></textarea>
                                                        <label for="floatingTextarea">Type schedule note ...</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5 row">
                                                <div class="col-md-3 part-title">
                                                    Recruiter owner<span style="color: red;">*</span>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <input type="text" class="form-control" placeholder="">
                                                    </div>
                                                    <div style="margin-top: 15px">
                                                        <a href="#" style="color: #000">Assign me</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 row">
                                                    <div class="col-md-3 part-title">
                                                        Meeting ID
                                                    </div>
                                                    <div class="col-md-8" >
                                                        <div class="input-group" style="margin-left: 5px;padding: 0px !important;">
                                                            <input type="text" class="form-control" name="meetingID" placeholder="">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- row2 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">

                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5 row">

                                            </div>
                                        </div>
                                        <!-- row3 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5 row">

                                            </div>
                                        </div>
                                        <!-- row4 -->
                                        <div class="row mb-3">
                                            <div class="col-md-5 row">

                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5 row">

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
            //interviews multi choice
            $('#small-select2-options-multiple-field-interviews').select2({
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
