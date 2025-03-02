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
                <title>Create user</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">User</li>
                                </ol>
                                <div class="container mt-5 vh-100">
                                    <div class="row">
                                        <div class="col-md-6 col-12 offset-md-3">
                                            <h1>Create User</h1>
                                            <form:form action="/admin/user/create" method="post"
                                                modelAttribute="newUser" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="email" class="form-label">Email</label>
                                                            <form:input type="email" class="form-control" id="email"
                                                                path="email" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="password" class="form-label">Password</label>
                                                            <form:input type="password" class="form-control"
                                                                id="password" path="password" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="fullName" class="form-label">Full name</label>
                                                            <form:input type="text" class="form-control" id="fullName"
                                                                path="fullName" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="phone" class="form-label">Phone</label>
                                                            <form:input type="text" class="form-control" id="phone"
                                                                path="phone" />
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="address" class="form-label">Address</label>
                                                        <form:input type="text" class="form-control" id="address"
                                                            path="address" />
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="role" class="form-label">Role</label>
                                                            <form:select class="form-select"
                                                                aria-label="Default select example" path="role.name">
                                                                <form:option value="ADMIN">Admin</form:option>
                                                                <form:option value="USER">User</form:option>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3">
                                                            <label for="formFile" class="form-label">Avatar</label>
                                                            <input class="form-control" type="file" id="avatarFile"
                                                                accept=".png, .jpg, .jpeg" path="avatarFile"
                                                                name="dinhminhFile" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <img id="avatarPreview" src="" alt="avatar preview"
                                                        style="max-height: 250px; display: none;">
                                                </div>

                                                <button type="submit" class="btn btn-primary">Submit</button>
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
                <script src="/js/scripts.js"></script>
            </body>

            </html>