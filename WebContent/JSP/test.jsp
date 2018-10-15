<%@ page import="java.sql.*,com.jndi.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
try
{
DataAccessLayer ob=new DataAccessLayer();
Connection con = ob.getConnection();
String specialisation=request.getParameter("specialisation");
String pettype=request.getParameter("pettype");
PreparedStatement ps;
ps=con.prepareStatement("select doctor_first_name, doctor_last_name, doctor_address, doctor_specialisation, doctor_id from doctors where doctor_specialisation=?");
ps.setString(1, specialisation.trim());
ResultSet res=ps.executeQuery();%>

<%
if (res.next()==true)
{
out.println("<div class=\'radio-group\'>");
out.println("<table id=customers>");
out.println("<th>Name</th>");
out.println("<th>Address</th>");
out.println("<th>Specialisation</th>");
res.previous();

while(res.next())
{ 
    out.println("<tr>");
    out.println("</tr>");
    out.println("<tr class='radio' data-radio_value='" + res.getString(5) + "'>");
    out.println("<td class='non-selectable'>"+"Dr. "+res.getString(1)+" "+res.getString(2)+"</td>");
    out.println("<td class='non-selectable'>"+res.getString(3)+"</td>");
    out.println("<td class='non-selectable'>"+res.getString(4)+"</td>");
    out.println("</tr>");
           
}
out.println("</tbody>");
out.println("</table>");

out.println("<input style='display:none;' name='doctor_id' type='text' class='radio-input'");
out.println("</div>");
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
<div id="customers">
<br>
<br>
<p>Book Appointment:<p>
<p>Select Date:</p>
<input type="date" name="date"><br><br>
<p>Select Time:</p>
<select name="time">
  <option value="09:00">9:00 - 9:30</option>
  <option value="09:30">9:30 - 10:00</option>
  <option value="10:00">10:00 - 10:30</option>
  <option value="10:30">10:30 - 11:00</option>
  <option value="11:00">11:00 - 11:30</option>
  <option value="11:30">11:30 - 12:00</option>
  <option value="12:00">12:00 - 12:30</option>
  <option value="12:30">12:30 - 13:00</option>
  <option value="13:00">13:00 - 13:30</option>
  <option value="13:30">13:30 - 14:00</option>
  <option value="14:00">14:00 - 14:30</option>
  <option value="14:30">14:30 - 15:00</option>
  <option value="15:00">15:00 - 15:30</option>
  <option value="15:30">15:30 - 16:00</option>
  <option value="16:00">16:00 - 16:30</option>
  <option value="16:30">16:30 - 17:00</option>
  <option value="17:00">17:00 - 17:30</option>
  <option value="17:30">17:30 - 18:00</option>
  <option value="18:00">18:00 - 18:30</option>
  <option value="18:30">18:30 - 19:00</option>
  <option value="19:00">19:00 - 19:30</option>
  <option value="19:30">19:30 - 20:00</option>
  <option value="20:00">20:00 - 20:30</option>
  <option value="20:30">20:30 - 21:00</option>
  
</select>
<br>
<br>
<input type="submit" value="Book Appointment">
</div>
