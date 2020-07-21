<%
    if(session.getAttribute("hr")==null){
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Payroll System</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="robots" content="all,follow">
  <!-- Bootstrap CSS-->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Custom stylesheet - for your changes-->
  <link rel="stylesheet" href="css/custom.css">
  <!-- Tweaks for older IEs-->
  <!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
   <!-- navbar-->
   <nav class="navbar navbar-light navbar-expand-lg shadow-sm bg-white"><a href="hr_home.jsp" class="navbar-brand">HR Zone</a>
    <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span class="navbar-toggler-icon"></span></button>
    <div id="navbarSupportedContent" class="collapse navbar-collapse">
      <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="addemployee.jsp" class="nav-link">Add New Employee</a></li>
          <li class="nav-item"><a href="viewemployee.jsp" class="nav-link">View Employee</a></li>
          <li class="nav-item"><a href="markattendance.jsp" class="nav-link">Mark Attendance</a></li>
      </ul>
      <div class="navbar-text ml-lg-3">
          <a href="../signout.jsp" class="btn btn-primary text-white shadow">Sign Out</a>
      </div>
    </div>
  </nav>
  