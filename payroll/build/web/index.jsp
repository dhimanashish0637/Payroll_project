<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Payroll System</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/site.css" />
        <link href="https://fonts.googleapis.com/css?family=Yellowtail&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet">
    </head>
    <body>        
        <div class="container">
            <main role="main" class="pb-3">
                <%
                    String username = session.getAttribute("username") != null ? session.getAttribute("username").toString() : "";
                    session.removeAttribute("username");

                %>

                <h1 class="text-center">Payroll System</h1>
                <hr />
                <div class="row">
                    <div class="col-12">
                        <form id="account" class="form-signin" method="post" action="check_login">
                            <img class="mb-4 ml-4" src="images/person.png" alt="" width="72" height="72">
                            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>

                            <label for="username" class="sr-only">User Name</label>
                            <input type="text" name="username" value="<%= username %>" id="username" class="form-control" placeholder="User Name" />

                            <label for="password" class="sr-only">Password</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password" />



                            <button type="submit" class="btn btn-lg btn-primary  btn-block">Log in</button>

                            <hr />

                            <%
                                if (session.getAttribute("message") != null) {
                                    String classname = "alert-danger";
                            %>
                            <div class="alert <%= classname%>">
                                <%= session.getAttribute("message").toString()%>
                            </div>
                            <%
                                    session.removeAttribute("message");
                                }
                            %>
                        </form>
                    </div>
                </div>
            </main>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/site.js" asp-append-version="true"></script>

    </body>
</html>
