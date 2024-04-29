<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : Apr 5, 2024, 11:47:23 PM
    Author     : chun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- multi select -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/login.css">

    </head>
    <body>
        <div class="card">
            <div class="card-title d-flex justify-content-center ">
                <div class="d-flex align-items-center">
                    <img src="Image/Logo/ims-logo.png" class="logo" />
                    <p class="mbrand-name">IMS Recruitment</p>
                </div>
            </div>
            <hr>
            <div class="">
                <div class="col-md-12">
                    <div class="mb-3">
                        <form action="login" method="POST">
                            <!-- user input -->
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username" value="${requestScope.username}">
                                <p id="emptyUsername" class="mwrong-password" hidden>Username cannot be empty!</p>
                            </div>
                            <!-- password input -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password">
                                <p id="emptyPassword" class="mwrong-password" hidden>Password cannot be empty!</p>
                            </div>
                            <div>
                                <c:if test="${requestScope.isLoginError != null}">
                                    <p class="mwrong-password">
                                        ${requestScope.isLoginError}
                                    </p>
                                </c:if>
                            </div>
                            <div class="moption">
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">Remember me?</label>
                                </div>
                                <div class="mb-3">
                                    <a href="forgot-password" style="color: black">Forgot Password?</a>
                                </div>
                            </div>
                            <div class="center">
                                <input type="hidden" name="continueUrl" value="${requestScope.continueUrl}">
                                <button type="submit" class="btn btn-secondary">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="toast-container position-absolute bottom-50 top-0 p-3">
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
        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

        <input type="hidden" id="toastMessage" value="${requestScope.isResetPasswordSuccess}" />
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
            document.addEventListener('DOMContentLoaded', function () {
                const form = document.querySelector('form[action="login"]');
                const usernameInput = document.getElementById('username');
                const passwordInput = document.getElementById('password');
                const loginButton = document.querySelector('button[type="submit"]');

                // Add input event listeners to username and password inputs
                usernameInput.addEventListener('input', handleInputChange);
                passwordInput.addEventListener('input', handleInputChange);

                function handleInputChange() {
                    const usernameValue = usernameInput.value.trim();
                    const passwordValue = passwordInput.value.trim();

                    // Check if either username or password is empty
                    if (usernameValue === '' || passwordValue === '') {
                        // Disable login button
                        loginButton.disabled = true;

                        // Show error messages if input is empty
                        if (usernameValue === '') {
                            document.getElementById('emptyUsername').removeAttribute('hidden');
                        } else {
                            document.getElementById('emptyUsername').setAttribute('hidden', true);
                        }

                        if (passwordValue === '') {
                            document.getElementById('emptyPassword').removeAttribute('hidden');
                        } else {
                            document.getElementById('emptyPassword').setAttribute('hidden', true);
                        }
                    } else {
                        // Enable login button if both username and password are not empty
                        loginButton.disabled = false;

                        // Hide error messages
                        document.getElementById('emptyUsername').setAttribute('hidden', true);
                        document.getElementById('emptyPassword').setAttribute('hidden', true);
                    }
                }

                form.addEventListener('submit', function (event) {
                    if (usernameInput.value.trim() === '') {
                        event.preventDefault(); // Prevent form submission
                        document.getElementById('emptyUsername').removeAttribute('hidden');
                        loginButton.disabled = true;
                    } else {
                        document.getElementById('emptyUsername').setAttribute('hidden', true);
                    }

                    if (passwordInput.value.trim() === '') {
                        event.preventDefault(); // Prevent form submission
                        document.getElementById('emptyPassword').removeAttribute('hidden');
                        loginButton.disabled = true;
                    } else {
                        document.getElementById('emptyPassword').setAttribute('hidden', true);
                    }
                });
            });
        </script>


    </body>
</html>
