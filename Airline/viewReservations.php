<?php
session_start();
error_reporting(E_ERROR | E_PARSE);

$username = $_SESSION['username'];
	$link = mysqli_connect('localhost', 'root', '', 'Airline');

if(isset($_POST))
{
	if(isset($_POST['del'])){
		$sql = "Delete from seats_reservation where ReservationId='".$_POST['id']."';";
		if ($link->query($sql) === FALSE) {
			echo '<script>alert("Ticket cancellation failed")</script>';
			die();
		}
		$sql = "Delete from passenger_reservation where ReservationId='".$_POST['id']."';";
		if ($link->query($sql) === FALSE) {
			echo '<script>alert("Ticket cancellation failed")</script>';
			die();
		}
		$sql = "Delete from reservation where ReservationId='".$_POST['id']."'";
		if ($link->query($sql) === TRUE) {
			echo '<script>alert("Ticket cancelled")</script>';
		}
		else
			echo '<script>alert("Ticket '.$_POST["id"].' cancellation failed")</script>';
}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>JustFly | Reservations</title>
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
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

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
        <li><a href="ViewFlights.php">FLIGHTS</a></li> 
		<?php
		if(isset($_SESSION['user_fname']))
		{
			echo("<li><a href='viewReservations.php'>RESERVATIONS</a></li>");
			echo("<li><a href='logout.php'>LOG OUT</a></li>");			
		}
		else
		{
			echo('<li><a href="loginPage.php">LOG IN</a></li>');
			echo('<li><a href="signUp.html">SIGN UP</a></li>');
		}
		?>
      </ul>
    </div>
  </div>
</nav>

<!--Signup-->
<div class="jumbotron text-center">
<h1>Reservations</h1>
 </div>   
</div>
<!--List reservations-->
<div id="services" class="container-fluid text-center">
	<form method="post" action="#">
 <?php
  if(isset($_SESSION['username']))
  {
	echo ("<h3>Hi ". $_SESSION['user_lname']. "!</h3>");
	
	//check if user with same username exists in db
	$sql = "SELECT r.ReservationId, f.flight_no, fi.DepartTime, fi.DepartureDate, fa.CityName, ta.CityName, fi.ArriveTime, fi.ArrivalDate, r.ReturnInstanceId, fi.Status FROM reservation r JOIN user u ON r.UserName = u.UserName JOIN flight_instance fi ON r.InstanceId = fi.InstanceId JOIN flight f ON fi.Flight_no = f.flight_no JOIN airport fa ON f.From_Airport_id = fa.AirportId JOIN airport ta ON f.To_Airport_id = ta.AirportId WHERE u.UserName = '".$username."';";
	$result = mysqli_query($link,$sql);

	if (mysqli_num_rows($result)>0)
	{
		echo("<table class='table table-hover' >");
		echo("<thead><th>Reservation ID</th><th>Flight Number</th><th>Time</th><th>Date</th><th>From</th><th>To</th></thead><tbody>");
	$i=0;
	while(($row = mysqli_fetch_row($result))!=null)
	{
		$flightStatus = $row[9];
		if($flightStatus == 0)
		{
			echo("<tr><td colspan = '6'><strong>Flight: $row[1] This flight has been cancelled. Please contact Haaru Way for further information</strong></td></tr>");
		}
		else
		{
		echo("<tr data-toggle='collapse' data-target='#accordion$i' class='clickable'><td>".$row[0]. "</td><td> " . $row[1]. "</td><td> ". $row[2]. "</td><td> ". $row[3]."</td><td>". $row[4]. "</td><td>". $row[5]. "</td><td><input type='submit' value='Delete' name='del'><input type='text' name='id' value='".$row[0]."' hidden> </td></tr>");
		echo("<tr>
            <td colspan='6'>
                <div id='accordion$i' class='collapse'>Arrival at destination:<br/> Time: ". $row[6]. " Date:   ". $row[7]);
		$i++;
		$returnInstanceId = $row[8];
		if($returnInstanceId!=null)
		{
			$sql1 = "SELECT Flight_no, DepartTime, DepartureDate, ArriveTime, ArrivalDate, Status FROM Flight_instance WHERE InstanceId = '$returnInstanceId';";
			$result1 = mysqli_query($link,$sql1);
			if ( mysqli_num_rows($result1)>0)
			{
				$row1 = mysqli_fetch_row($result1);
				$retFlightStatus = $row1[5];
				if($retFlightStatus == 0)
				{
				  echo("<strong>Flight: $row1[0] This flight has been cancelled. Please contact Haaru Way for further information</strong>");
				}
				else
				{
					echo("<br />Return Flight: $row1[0] <br/>Depart Time: ". $row1[1]. " Depart Date:   ". $row1[2]. " <br/>Arrive Time: ". $row1[3]. " Arrive Date:   ". $row1[4]);
				}
			}
		}
		echo("<br/></div></td></tr>");
		}
	}
		echo("</tbody></table>");
	}
	else
	{
		echo("Currently you have no reservations.");
		//echo ($sql);
	}
  }
  else{
	  header("Location: home.php");
  }
  ?>
</form>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>&copy; JustFly. All Rights Reserved </p>
</footer>


</body>
</html>

