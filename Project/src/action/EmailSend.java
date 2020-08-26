package action;


import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class EmailSend implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
   		
		String member_id = request.getParameter("member_id");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String sender = "qhsgnl91@naver.com";
		String receiver = member_id;
		String subject = "비밀번호";
		String content = request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		
		try {
			Properties props = System.getProperties();
			 props.put("mail.debug", "true");
	         props.put("mail.smtp.starttls.enable", "true");
	         props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	         props.put("mail.smtp.host", "smtp.gmail.com");
	         props.put("mail.smtp.auth", "true");
	         props.put("mail.smtp.port", "465");
	         props.put("mail.smtp.ssl.enable", "true");
	         props.put("mail.transport.protocol","smtp");

			javax.mail.Authenticator auth = new GoogleAuthentication();
			Session s = Session.getDefaultInstance(props, auth);
			Message message = new MimeMessage(s);
			Address sender_address = new InternetAddress(sender);
			Address receiver_address = new InternetAddress(receiver);
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message);
			
			forward.setPath("memberMain.do");
		} catch(Exception e) {
			out.println("문제있음");
			e.printStackTrace();
		}
		return forward;
	}
}
