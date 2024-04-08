<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="icon" type="image/x-icon" href="Image/Logo/ims-logo.png">
        <link rel="stylesheet" href="CSS/home.css">
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

                    <!-- content -->

                </div>
            </div>
        </div>       
    </body>
</html>
