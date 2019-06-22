package com.viva.util;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class MailSender extends Thread {

	String to;
	String subject;
	String body;
	String senderMailId="businessvaluetracker@gmail.com";
	String password="Password@123";
	
	public static void sendNotification(String to, String subject, String body) {
		new MailSender(to, subject, body).start();
	}
	
	private MailSender(String to, String subject, String body) {
		super();
		this.to = to;
		this.subject = subject;
		this.body = body;
	}

	public void sendMail() {
		
        Properties props = new Properties();
        props.put("mail.smtp.host", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        //Establishing a session with required user details
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderMailId,password);
            }
        });
        try {
        	
        	System.out.println("Sending to  ::::::::::::::::::::::::::::: " + this.to);
        	System.out.println("Subject ::::::::::::::::::::::::::::::::: " + this.subject);
        	System.out.println("Message content ::::::::::::::::::::::::: " + this.body);
        	
            MimeMessage msg = new MimeMessage(session);
            InternetAddress[] address = InternetAddress.parse(to, true);
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setText(body);
            msg.setHeader("XPriority", "1");
            Transport.send(msg);
            System.err.println("Mail has been sent successfully :::::::::::::");
        } catch (MessagingException mex) {
            System.err.println("Unable to send an email :::::::::::::::::::::" + mex);
        }
    }
	
	public static void main(String[] args) {
		System.out.println("Mail sending started........................................................");
		sendNotification("businessvaluetracker@gmail.com", "Test Mail", "Test mail for VIVA Reporting");
	}

	public void run() {
		sendMail();	
	}
}