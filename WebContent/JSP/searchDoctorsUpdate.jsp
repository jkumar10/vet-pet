<%@ page import="java.sql.*,com.jndi.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
  <a href="#">Hospital Locator</a>
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

<form class="center-block-element account-form" action="SearchDoctorUpdate.jsp" method="post">     
<div class=middle>
<p>Select Pet Type</p>
<select name="pettype">
  <option value="Dog">Dog</option>
  <option value="Cat">Cat</option>
</select>
<p>Select Speciality</p>
<select name="speciality">
  <option value="Anaesthesiology">Anaesthesiology</option>
  <option value="AnimalBehavior">Animal Behavior</option>
  <option value="Cardiology">Cardiology</option>
  <option value="ClinicalPathology">Clinical Pathology</option>
  <option value="Dentistry">Dentistry</option>
  <option value="DiagnosticImaging">Diagnostic Imaging</option>
  <option value="Emergency">Emergency and Critical Care</option>
  <option value="InternalMedicine">Internal Medicine</option>
  <option value="Nutrition">Nutrition</option>
  <option value="Orthopaedics">Orthopaedics</option>
  <option value="Radiology">Radiology</option>
  <option value="Toxicology">Toxicology</option>
  <option value="Dermatology">Dermatology Skin Diseases</option>
  <option value="Surgery">Surgery</option> 
</select><br>
<input type="submit" value="Search">
</form>
</div>

<%
try
{
DataAccessLayer ob=new DataAccessLayer();
Connection con = ob.getConnection();
String specialisation=request.getParameter("specialisation");
String pettype=request.getParameter("pettype");
PreparedStatement ps;
ps=con.prepareStatement("select doctor_first_name, doctor_last_name, doctor_address, doctor_specialisation from doctors where doctor_specialisation=?");
ps.setString(1, specialisation.trim());
ResultSet res=ps.executeQuery();%>

<%
if (res.next())
{
out.println("<table id=customers>");
out.println("<th>Name</th>");
out.println("<th>Address</th>");
out.println("<th>Specialisation</th>");

while(res.next())
{
	 
    out.println("<tr>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td>"+"Dr. "+res.getString(1)+" "+res.getString(2)+"</td>");
    out.println("<td>"+res.getString(3)+"</td>");
    out.println("<td>"+res.getString(4)+"</td>");
    out.println("</tr>");
           
}
out.println("</tbody>");
out.println("</table>");
}
else
{
	out.println("<p id=customers><font size=3 color =red>No doctors exist with selected speciality.</font></p>");
}
}
catch(Exception e)
{
	
}

%>

</div>     
</body>
</html> 