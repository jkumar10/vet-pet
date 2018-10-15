<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
</style>
<link rel="stylesheet" type="text/css" href="../style/home.css">
</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="viewProfile.jsp">My Profile</a>
  <a href="searchDoctors.html">Search Doctors</a>
  <a href="appointment.html">Schedule appointment</a>
  <a href="#">Search Provider</a>
  <a href="#">Emergency</a>
  <a href="Locator.html">Hospital Locator</a>
  <a href="#">Contact Us</a>
  <a href="#">Log Out</a>
</div>

<h2><center>Welcome to Vet Pet</center></h2>

<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
     
</body>
</html> 
 