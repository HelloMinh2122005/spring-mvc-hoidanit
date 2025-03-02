<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ page contentType="text/html;charset=UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                                <div class="container mt-5 vh-100">
                                    <div class="row">
                                        <div class="col-md-6 col-12 offset-md-3">
                                            <h1>Update User</h1>
                                            <form:form action="/admin/user/update" method="post" modelAttribute="user">
                                                <!-- Hidden ID field for submission -->
                                                <form:hidden path="id" />

                                                <div class="mb-3">
                                                    <label for="id" class="form-label">ID</label>
                                                    <input type="text" class="form-control" id="id" value="${user.id}"
                                                        disabled readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="email" class="form-label">Email</label>
                                                    <form:input type="email" class="form-control" id="email"
                                                        path="email" required="true" />
                                                    <form:errors path="email" cssClass="text-danger" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="fullName" class="form-label">Full name</label>
                                                    <form:input type="text" class="form-control" id="fullName"
                                                        path="fullName" required="true" />
                                                    <form:errors path="fullName" cssClass="text-danger" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="address" class="form-label">Address</label>
                                                    <form:input type="text" class="form-control" id="address"
                                                        path="address" />
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
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>