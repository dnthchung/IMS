<%-- 
    Document : offer-list 
    Created on : Apr 6, 2024, 4:09:46 PM 
    Author : chun 
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offer List</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/offer-list.css">
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
                    <!-- content-card -->
                    <div class="card mt-3 my-card">
                        <div class="content">
                            <div>
                                <h4>Offer list</h4>
                                <div>
                                    <div class="row mt-5">
                                        <form action="offer-list" method="POST">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <!-- Search Area -->
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <input type="text" class="form-control" value="${requestScope.searchedValue}" name="searchValue" placeholder="Search">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">
                                                                <i data-lucide="search"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="dept">
                                                            <option <c:if test="${deptSelected.isEmpty() || deptSelected == ''}">selected
                                                                                                                                 </c:if>>Department</option>
                                                            <c:forEach var="dept" items="${requestScope.departments}">
                                                                <option value="${dept.departmentId}" 
                                                                        <c:if test="${deptSelected == dept.departmentId && !deptSelected.isEmpty()}">selected
                                                                        </c:if>>${dept.departmentName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group" style="padding: 0px !important;">
                                                        <select class="form-select" name="status">
                                                            <option <c:if test="${statusSelected.isEmpty() || statusSelected == ''}">selected
                                                                                                                                     </c:if>>Status</option>
                                                            <c:forEach var="offerStatus" items="${requestScope.offerStatuses}">
                                                                <option value="${offerStatus.offerStatusId}" 
                                                                        <c:if test="${statusSelected == offerStatus.offerStatusId && !statusSelected.isEmpty()}">selected
                                                                        </c:if>
                                                                        >${offerStatus.statusName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group" style="padding: 0px !important; max-height: 38px ">
                                                        <button type="submit" class="button3 btn btn-secondary">Search</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${requestScope.isEmptySearch == true}">
                                                <div class="row">
                                                    <span>No item matches with your search data.</span>
                                                </div>
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="me-auto p-2 "></div>
                                <div class="p-2 mt-3">
                                    <a href="create-offer" style="text-decoration: none;" type="button" class="button3">
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
                                    <button class="button31" data-toggle="modal" id="openExportModalBtn" data-target="#exportOfferModal">
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
                                                <c:forEach var="offer" items="${requestScope.offers}">
                                                    <tr>
                                                        <td>${offer.candidateName}</td>
                                                        <td>${offer.email}</td>
                                                        <td>${offer.approverName}</td>
                                                        <td>${offer.departmentName}</td>
                                                        <c:if test="${offer.note.isEmpty()}">
                                                            <td>N/A</td>
                                                        </c:if>
                                                        <c:if test="${!offer.note.isEmpty()}">
                                                            <td>${offer.note}</td>
                                                        </c:if>
                                                        <td>${offer.statusName}</td>
                                                        <td>
                                                            <a style="margin-right: 5px;text-decoration: none; color: black; "
                                                               href="offer-details?offerId=${offer.offerId}" class="icon-button">
                                                                <i data-lucide="eye"></i>
                                                            </a>
                                                            <c:if test="${sessionScope.loggedInUser != null && offer.statusName == 'Waiting for Approval'}">
                                                                <a style="margin-right: 5px;text-decoration: none; color: black;"
                                                                   href="edit-offer?offerId=${offer.offerId}" class="icon-button">
                                                                    <i data-lucide="file-pen-line"></i>
                                                                </a>
                                                            </c:if>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="container-fluid row">
                                            <div class="col-md-10">
                                                <!-- Your content -->
                                            </div>
                                            <div class="col-md-2">
                                                <form action="offer-list" method="POST">
                                                    <input type="hidden" value="${requestScope.searchedValue}" name="searchValue">
                                                    <input type="hidden" value="${requestScope.deptSelected}" name="dept">
                                                    <input type="hidden" value="${requestScope.statusSelected}" name="status">
                                                    <input type="hidden" value="${requestScope.currentPage}" name="currentPage">
                                                    <!-- Pagination -->
                                                    <ul id="pagination">
                                                        <li>
                                                            <span>
                                                                <span>Page ${requestScope.currentPage}</span> / <span>${requestScope.totalPage}</span>
                                                            </span>
                                                        </li>
                                                        <li><button <c:if test="${requestScope.currentPage == 1}">disabled=""</c:if> style="border: 0px" type="submit" value="prev" name="btnPage" />&lt;</button></li>
                                                        <li><button <c:if test="${requestScope.totalPage == requestScope.currentPage}">disabled=""</c:if> style="border: 0px" type="submit" value="next" name="btnPage"/>&gt;</button></li>
                                                        </ul>
                                                    </form>
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

            <div class="modal fade" id="exportOfferModal" tabindex="-1" role="dialog" aria-labelledby="exportOfferModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content rounded-0" style="background-color: #F1F6FA">
                        <form action="export-offer" method="POST" id="exportOfferForm">
                            <div class="modal-body">
                                <h3 class="modal-title text-center" id="exampleModalLabel">Export offer</h3>
                                <div class="row mt-5">
                                    <div class="col-md-12 d-flex justify-content-center">
                                        <div>
                                            <div class="d-flex">
                                                <span style="margin-right: 10px;margin-top: 5px;">From </span>
                                                <div class="cs-form col-md-5" style="margin-right: 10px">
                                                    <input type="date" id="inp-start-date" name="fromDate" class="form-control" required="" placeholder="DD/MM/YYYY"/>
                                                </div>
                                                <span style="margin-right: 10px;margin-top: 5px;">To </span>
                                                <div class="cs-form col-md-5">
                                                    <input type="date" id="inp-end-date" name="toDate" class="form-control" required="" placeholder="DD/MM/YYYY" />
                                                </div>
                                            </div>
                                            <div class="mt-2 text-center">
                                                <p class="mwrong-msg" id="invalidDate"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-md-12 d-flex justify-content-center">
                                        <button style="margin-right: 50px; border-radius: 0px" type="button" id="submitBtn" class="btn btn-secondary">Submit</button>
                                        <button style="border-radius: 0px" type="button" id="closeModalBtn" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Start of Toast Container -->
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
            <!-- End of Toast Container -->



            <!-- jQuery -->
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

            <script>
                flatpickr("#inp-start-date", {
                    dateFormat: "d/m/Y"
                });

            </script>

            <script>
                flatpickr("#inp-end-date", {
                    dateFormat: "d/m/Y"
                });

            </script>


            <!-- Script to trigger the toast -->
            <input type="hidden" id="toastMessage" value="${requestScope.toastMsg}" />
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

        <script>
            // Function to check date validity
            function checkDateValidity() {

                var paragraph = document.getElementById("invalidDate");
                if (paragraph) {
                    paragraph.innerHTML = "";
                }

                var startDateStr = document.getElementById('inp-start-date').value;
                var endDateStr = document.getElementById('inp-end-date').value;

                // Convert string dates to Date objects
                var startDateArr = startDateStr.split('/');
                var endDateArr = endDateStr.split('/');
                var startDate = new Date(startDateArr[2], startDateArr[1] - 1, startDateArr[0]); // Year, Month (0-indexed), Day
                var endDate = new Date(endDateArr[2], endDateArr[1] - 1, endDateArr[0]);

                if (startDate < endDate) {
                    // Dates are valid, enable submit button
                    document.getElementById('submitBtn').disabled = false;
                } else {
                    document.getElementById('submitBtn').disabled = true;
                    paragraph.innerHTML = "From Date needs to be earlier than To date";
                }
            }

            // Attach change event listeners to input fields
            document.getElementById('inp-start-date').addEventListener('change', checkDateValidity);
            document.getElementById('inp-end-date').addEventListener('change', checkDateValidity);

            document.getElementById('submitBtn').disabled = true;
        </script>


        <script>
            document.getElementById('submitBtn').addEventListener('click', function () {

                var paragraph = document.getElementById("invalidDate");
                if (paragraph) {
                    paragraph.innerHTML = "";
                }

                var startDateStr = document.getElementById('inp-start-date').value;
                var endDateStr = document.getElementById('inp-end-date').value;

                // Convert string dates to Date objects
                var startDateArr = startDateStr.split('/');
                var endDateArr = endDateStr.split('/');
                var startDate = new Date(startDateArr[2], startDateArr[1] - 1, startDateArr[0]);
                var endDate = new Date(endDateArr[2], endDateArr[1] - 1, endDateArr[0]);

                if (startDate < endDate) {
                    document.getElementById('exportOfferForm').submit();
                    var button = document.getElementById("closeModalBtn");
                    button.click();
                } else {
                    paragraph.innerHTML = "From Date needs to be earlier than To date";
                }
            });
        </script>
    </body>

</html>