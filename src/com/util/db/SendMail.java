package com.util.db;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class SendMail
{
	public static void send(String emailID, String subj, String message) throws Exception
	{
		String host = "smtp.gmail.com", user = "cloudkarad@gmail.com", pass = "passkey";
		String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		String to = emailID;
		String from = user;
		String subject = subj;
		String messageText = message;
		boolean sessionDebug = true;

		Properties props = System.getProperties();
		props.put("mail.host", host); //Specify SMTP Server
		props.put("mail.transport.protocol.", "smtp");  //specify protocol used for session. For sending mail use smtp or smtps
		props.put("mail.smtp.auth", "true");  ///specify whether authentication required for log in to SMTP Server
		props.put("mail.smtp.", "true"); //set true to all boolean properties under mail.smtp.
		props.put("mail.smtp.port", "465"); //specify SMTP Server portno
		props.put("mail.smtp.socketFactory.fallback", "false"); //wait forever for response
		props.put("mail.smtp.socketFactory.class", SSL_FACTORY);

		Session mailSession = Session.getDefaultInstance(props, null); //Get Mail Session
		mailSession.setDebug(sessionDebug);

		//Multimedia Internal Mail Extension[Mime]
		Message msg = new MimeMessage(mailSession);
		msg.setFrom(new InternetAddress(from));
		InternetAddress[] address = {new InternetAddress(to)};
		msg.setRecipients(Message.RecipientType.TO, address);
		msg.setSubject(subject);
		msg.setContent(messageText, "text/html");

		Transport transport = mailSession.getTransport("smtp");
		transport.connect(host, user, pass);

		try
		{
			transport.sendMessage(msg, msg.getAllRecipients());
		}
		catch (Exception e)
		{
			System.out.println("Error" + e.getMessage());
		}
		transport.close();
	}
}