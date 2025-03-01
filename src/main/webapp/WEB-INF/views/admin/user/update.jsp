<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <title>Update User</title>
            </head>

            <body>
                <div class="container mt-5 vh-100">
                    <div class="row">
                        <div class="col-md-6 col-12 offset-md-3">
                            <h1>Update User</h1>
                            <form:form action="/admin/user/update" method="post" modelAttribute="user">
                                <!-- Hidden ID field for submission -->
                                <form:hidden path="id" />

                                <div class="mb-3">
                                    <label for="id" class="form-label">ID</label>
                                    <input type="text" class="form-control" id="id" value="${user.id}" disabled
                                        readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input type="email" class="form-control" id="email" path="email"
                                        required="true" />
                                    <form:errors path="email" cssClass="text-danger" />
                                </div>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full name</label>
                                    <form:input type="text" class="form-control" id="fullName" path="fullName"
                                        required="true" />
                                    <form:errors path="fullName" cssClass="text-danger" />
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <form:input type="text" class="form-control" id="address" path="address" />
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <form:input type="tel" class="form-control" id="phone" path="phone"
                                        pattern="[0-9]{10,}" />
                                    <form:errors path="phone" cssClass="text-danger" />
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>