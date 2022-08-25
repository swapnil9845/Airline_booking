<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  
  <title>JustFly | Error</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href="css/home.css">
  <script src = "js/home.js"></script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60"class="shortPage">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.php"><img src="images/logo.png" alt="JustFly"/></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="home.php">HOME</a></li>
        <li><a href="#services">FLIGHTS</a></li>
        <li><a href="viewReservations.php">RESERVATIONS</a></li>
        <li><a href="loginPage.php">LOG IN</a></li>
        <li><a href="signUp.html">SIGN UP</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
<h1>Error </h1>
  <?php
  if(isset($_SESSION['error_msg']))
  {
	  $error_message = $_SESSION['error_msg'];
  }
  else
	  $error_message = "An error occured on the previous page";
  echo "<h3>". $error_message. "</h3>";
  ?>
 </div>   
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>&copy; JustFly. All Rights Reserved </p>
</footer>

</body>
</html>
