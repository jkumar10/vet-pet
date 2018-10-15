<%@ page import="java.sql.*,com.jndi.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "javax.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Email Test</title>
</head>
<body>

<%
//registration completes; send an email confirmation to the email address
    
   
    OTPGen ob=new OTPGen();
    String answer=ob.getOtp().trim();
    int otp=Integer.parseInt(answer); 
 
	String from = "hmsatiu@gmail.com";
	String host = "smtp.gmail.com";
	String pwd = "vetpetsys";
	String port = "465";
	String email= request.getParameter("emailInput");
	String to=email.trim();
	String subject = "Hello from VetPet"; //email subject
	String content = "Your OTP for password reset is " + otp; // email content
	String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	boolean sessionDebug = true;
	
	// Get system properties 
	Properties props = System.getProperties();
	props.put("mail.host", host);
	props.put("mail.transport.protocol.", "smtp");
	props.put("mail.smtp.auth", "true");
	//props.put("mail.smtp.", "true");
	props.put("mail.smtp.port", port);
	props.put("mail.smtp.socketFactory.fallback", "true"); // was false, now set it true to test
	props.put("mail.smtp.ssl.enable", "true");
	//props.put("mail.smtp.socketFactory.class", SSL_FACTORY); // old style
	//props.put("mail.smtp.socketFactory.port", port); // old style
	
	// set msg properties
	/* Session mailSession = Session.getDefaultInstance(props, 
			new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                	return new PasswordAuthentication(from,pwd);
                }
	}); */
	Session mailSession = Session.getDefaultInstance(props, null);
	mailSession.setDebug(sessionDebug); 
	Message msg = new MimeMessage(mailSession); 
	msg.setFrom(new InternetAddress(from)); 
	msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
	msg.setSubject(subject); 
	msg.setContent(content, "text/html;charset=utf-8"); 
	
	//set transport properties
	Transport transport = mailSession.getTransport("smtp");
    //System.setProperty("javax.net.ssl.trustStore", "conf/jssecacerts");
    //System.setProperty("javax.net.ssl.trustStorePassword", "admin");
    //System.setProperty("javax.net.debug", "ssl");
    transport.connect(host, 465, from, pwd); 
    
    //System.out.println("before trying"); 
 
	// Transport: send emails 
	try {
		//Transport.send(msg);
		transport.sendMessage(msg, msg.getAllRecipients());
		out.println("sent");
	} catch (Exception err) {
		out.println("Error" + err.getMessage());
	}
	transport.close();
%>

</body>
</html>