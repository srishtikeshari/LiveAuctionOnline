package controller;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class sendEmail
 */

public class SendEmail {
	
	private String fromAddress = "onlineauctionooad@gmail.com";
	private String password = "Fast&Curious";
	
	public SendEmail(String toAddress, String mailSubject, String mailBody)
	{
		Properties props = new Properties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.user", fromAddress);
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.port", "587");
        
        Session mailSession = Session.getInstance(props, new Authenticator()
        		
        		{
        	@Override
        	protected PasswordAuthentication getPasswordAuthentication()
        	{
        		return new PasswordAuthentication(fromAddress,password);
        	}
        		} );
        
        MimeMessage message=new MimeMessage(mailSession);
        
        try {
        message.setRecipient (Message.RecipientType.TO, new InternetAddress (toAddress));
        message.setFrom (new InternetAddress (fromAddress));
        message.setSubject (mailSubject);
        message.setContent (mailBody, "text/html");
        Transport.send (message);
        }
        catch (MessagingException ae) {
            ae.printStackTrace();
        }
	}
}
