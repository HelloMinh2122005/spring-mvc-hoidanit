<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <link rel="stylesheet" href="/css/demo.css">
                <title>Document</title>
            </head>

            <body>
                <div class="container mt-5 vh-100">
                    <div class="row">
                        <div class="col-md-6 col-12 offset-md-3">
                            <h1>Create User</h1>
                            <form:form action="/admin/user/create" method="post" modelAttribute="newUser">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input type="email" class="form-control" id="email" path="email" />
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <form:input type="password" class="form-control" id="password" path="password" />
                                </div>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full name</label>
                                    <form:input type="text" class="form-control" id="fullName" path="fullName" />
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <form:input type="text" class="form-control" id="address" path="address" />
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <form:input type="text" class="form-control" id="phone" path="phone" />
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>