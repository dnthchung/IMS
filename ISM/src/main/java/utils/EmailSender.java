///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package utils;
//
//import java.io.UnsupportedEncodingException;
//import java.util.Date;
//import java.util.Properties;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.mail.Authenticator;
//import javax.mail.BodyPart;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Multipart;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeBodyPart;
//import javax.mail.internet.MimeMessage;
//import javax.mail.internet.MimeMultipart;
//
///**
// *
// * @author tranh
// */
//public class EmailSender extends Thread{
//    private String to;
//    private String subject;
//    private String content;
//
//    public void setTo(String to) {
//        this.to = to;
//    }
//
//    public void setSubject(String subject) {
//        this.subject = subject;
//    }
//
//    public void setContent(String content) {
//        this.content = content;
//    }
//
//    @Override
//    public void run() {
//        sendContentToEmail(to, subject, content);
//    }
//    
//    static String from = "g5investment.swp391@gmail.com";
//    static String password = "defedzafuvvrruyw";
//
//    public static boolean sendContentToEmail(String email, String subject, String content) {
//
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.socketFactory.port", "465");
//        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.port", "465");
//
//        // Create Authenticator
//        Authenticator auth = new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(from, password);
//            }
//        };
//
//        Session session = Session.getInstance(props, auth);
//        MimeMessage msg = new MimeMessage(session);
//        String senderName = "IMS";
//        // Create the text part of the message
//        Multipart multipart = new MimeMultipart();
//        BodyPart textBodyPart = new MimeBodyPart();
//        try {
//            textBodyPart.setText(content);
//        } catch (MessagingException ex) {
//            Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
//            System.out.println(ex);
//        }
//        try {
//            multipart.addBodyPart(textBodyPart);
//        } catch (MessagingException ex) {
//            Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
//            System.out.println(ex);
//        }
//        try {
//            msg.addHeader("Content-type", "text/HTML; charset = UTF-8");
//            try {
//                msg.setFrom(new InternetAddress(from, senderName));
//            } catch (UnsupportedEncodingException ex) {
//                Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
//                System.out.println(ex);
//            }
//            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
//            msg.setSubject(subject);
//            msg.setSentDate(new Date());
//            msg.setContent(content, "text/html;charset=UTF-8");
//            Transport.send(msg);
//            return true;
//        } catch (MessagingException e) {
//            System.out.println(e);
//        }
//        return false;
//    }
//}
