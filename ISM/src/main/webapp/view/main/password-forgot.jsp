<%-- 
    Document   : password-forgot
    Created on : Apr 6, 2024, 12:04:29 AM
    Author     : chun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">

        <!-- Bootstrap 5  -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- multi select -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />
        <!-- link to css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/password-forgot.css">

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
            <form>
                <div class="">
                    <div class="mb-3">
                        <div class="">
                            <p class="mnoti">
                                <span class="d-flex justify-content-center">Please enter your email </span>
                                <span>and we'll send you a link to get back your account.</span>
                            </p>
                        </div>
                        <!-- user input -->
                        <div>
                            <label for="username" class="form-label">Email:</label>
                            <input type="text" class="form-control" id="username" placeholder="email">
                            <div>
                                <p class="mwrong-email">
                                    wrong username
                                </p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-evenly">
                            <button class="button-2">Send</button>
                            <button class="button-2" style="background-color: #EFA9AE; color: #fff">Cancel</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>
