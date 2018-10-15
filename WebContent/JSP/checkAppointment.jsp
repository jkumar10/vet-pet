<%@ page import="java.sql.*,com.jndi.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
String doctorID=request.getParameter("doctor_id");
String formdate=request.getParameter("date");
String formtime=request.getParameter("time");
PreparedStatement ps;
ps=con.prepareStatement("SELECT date,TIME_FORMAT(start_time, '%H:%i') from appointment where doctor_id_fk=?");
ps.setInt(1,Integer.valueOf(doctorID));
ResultSet res=ps.executeQuery();
if(res.next())
{   out.println("Going inside if");
    String date=res.getString(1);
    String start_time=res.getString(2);
    if (formdate.equals(date))
    {
    	out.println("True");
    	ps=con.prepareStatement("SELECT start_time from book where date=? and doctor_id=?");
    	ps.setString(1, formdate.trim());
    	ps.setString(2, doctorID.trim());
    	ResultSet res2=ps.executeQuery();
    	if (res2.next())
    	{%>
		echo ("<script>
		alert("Docotor time slot not available");
		window.location.href='http://localhost:8080/HMS/JSP/searchDoctors.html';
		</script>");
	```<%}
    	else
    	{
    		
    		ps=con.prepareStatement("insert into book (doctor_id,start_time,date) values(?,?,?)");
	        ps.setString(1,doctorID.trim());
	        ps.setString(2,formtime.trim());
	        ps.setString(3, formdate.trim());
	        ps.executeUpdate();
    	}
    	
    	
    }
    else
    {
    	out.println("False");
    }
}

}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>