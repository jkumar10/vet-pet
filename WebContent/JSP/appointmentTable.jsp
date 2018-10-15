<%@ page import="java.sql.*,com.jndi.*,java.util.Date,java.text.SimpleDateFormat" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
DataAccessLayer ob=new DataAccessLayer();
Connection con = ob.getConnection();
PreparedStatement ps;
ps=con.prepareStatement("select start_time,end_time from appointment where doctor_id_fk=?");
ps.setString(1,"15");
ResultSet res=ps.executeQuery();%>

<%
if (res.next()==true)
{
out.println("<table id=customers>");
out.println("<th>Start Time</th>");
out.println("<th>End Time</th>");
res.previous();

long difference=0;
while(res.next())
{
	
String time1=res.getString(1);
String time2=res.getString(2);
    out.println("<tr>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td class='non-selectable'>"+time1+"</td>");
    out.println("<td class='non-selectable'>"+time2+"</td>");
    out.println("</tr>");
           
}
out.println("</tbody>");
out.println("</table>");

out.println("<p>"+difference+"</p>");

}
else
{
	out.println("<p id=customers><font size=3 color =red>Doctor's schedule is not yet available.</font></p>");
}
}
catch(Exception e)
{
	
}

%>
</body>
</html>