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
String emailInput=request.getParameter("emailInput");
String passwordInput=request.getParameter("passwordInput");
String accountTypeInput=request.getParameter("accountTypeInput");


	if (accountTypeInput.trim().equals("Doctor"))
	{   
		PreparedStatement ps;
		ps=con.prepareStatement("Select doctor_password from doctors where doctor_email=?");
		ps.setString(1, emailInput.trim());
		ResultSet res=ps.executeQuery();
		if(res.next())
		{
		    String passwordDatabase=res.getString(1);
		    passwordDatabase=passwordDatabase.trim();
		    passwordInput=passwordInput.trim();
		    if(passwordInput.equals(passwordDatabase)&& (!emailInput.equals("admin")))
		    {
		       
		        String site = new String("home.jsp");
		        session.setAttribute("username",emailInput);
		        session.setAttribute("accountTypeInput",accountTypeInput);
		        response.setStatus(response.SC_MOVED_TEMPORARILY);
		        response.setHeader("Location", site); 
		    }
		    else
		    {%>
		    	echo ("<script>
		    	alert("Invalid Password");
		    	window.location.href='http://localhost:8080/HMS/JSP/loginForm.html';
		    	</script>");
		    <%}
		}
		else
		{%>
			echo ("<script>
			alert("Invalid Username");
			window.location.href='http://localhost:8080/HMS/JSP/loginForm.html';
			</script>");
		<%}
		
		con.close();
	}
	if (accountTypeInput.trim().equals("Patient"))
	{
		PreparedStatement ps;
		ps=con.prepareStatement("Select patient_password from patients where patient_email=?");
		ps.setString(1, emailInput.trim());
		ResultSet res=ps.executeQuery();
		if(res.next())
		{
		    String passwordDatabase=res.getString(1);
		    passwordDatabase=passwordDatabase.trim();
		    passwordInput=passwordInput.trim();
		    if(passwordInput.equals(passwordDatabase)&& (!emailInput.equals("admin")))
		    {
		    	
		    	String site = new String("home.jsp");
		        session.setAttribute("username",emailInput);
		        session.setAttribute("accountTypeInput",accountTypeInput);
		        response.setStatus(response.SC_MOVED_TEMPORARILY);
		        response.setHeader("Location", site); 
		    }
		    else
		    {%>
		    	echo ("<script>
		    	alert("Invalid Password");
		    	window.location.href='http://localhost:8080/HMS/JSP/loginForm.html';
		    	</script>");
		    <%}
		}
		else
		{%>
			echo ("<script>
			alert("Invalid Username");
			window.location.href='http://localhost:8080/HMS/JSP/loginForm.html';
			</script>");
		<%}
		
		con.close();
	}
	if (accountTypeInput.trim().equals("Insurance Provider"))
	{
		System.out.println(emailInput);
		PreparedStatement ps;
		ps=con.prepareStatement("Select provider_password from insurance_providers where provider_email=?");
		ps.setString(1, emailInput.trim());
		ResultSet res=ps.executeQuery();
		if(res.next())
		{
		    String passwordDatabase=res.getString(1);
		    passwordDatabase=passwordDatabase.trim();
		    passwordInput=passwordInput.trim();
		    if(passwordInput.equals(passwordDatabase)&& (!emailInput.equals("admin")))
		    {
		        
		        String site = new String("home.jsp");
		        session.setAttribute("username",emailInput);
		        session.setAttribute("accountTypeInput",accountTypeInput);
		        response.setStatus(response.SC_MOVED_TEMPORARILY);
		        response.setHeader("Location", site); 
		    }
		    else
		    {%>
		    	echo ("<script>
		    	alert("Invalid Password");
		    	window.location.href='http://localhost:8080/HMS/JSP/loginForm.html';
		    	</script>");
		    <%}
		}
		else
		{%>
			echo ("<script>
			alert("Invalid Username");
			window.location.href='http://localhost:8080/HMS/JSP/loginForm.html';
			</script>");
		<%}
		
		con.close();
	}
}
catch (Exception e)
{
	e.printStackTrace();
}
	


%>

</body>
</html>