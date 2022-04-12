package poly.service.impl;

import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.service.IMailService;
import poly.util.CmmUtil;


@Service("MailService")
public class MailService implements IMailService {
	
	//메일발송을 위한 자바 겍체 가져옴
	@Resource(name="MailService")
	private IMailService mailService;
	
	private Logger log = Logger.getLogger(this.getClass());
	final String host = "smtp.naver.com";
	final String user ="네이버 아이디";
	final String password = "네이버 비밀번호";
	



	
	
	@Override
	public int doSendMail(MailDTO pDTO){
		log.info(this.getClass().getName() + ".doSendMail start!");
		
		int res= 1;
		
		if(pDTO == null) {
			pDTO = new MailDTO();
		}
		
		String toMail = CmmUtil.nvl(pDTO.getToMail());
		
		Properties props = new Properties();
		props.put("mail.smtp.host",host);
		props.put("mail.smtp.auth","true");
		
		Session sesstion = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
			protected  javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(user, password);
			}
		});
		
		
		
		try {
			MimeMessage message = new MimeMessage(sesstion);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
			
			message.setSubject(CmmUtil.nvl(pDTO.getTitle()));
			message.setText(CmmUtil.nvl(pDTO.getContents()));
			
			
			Transport.send(message);
		}
		catch(MessagingException e){
			res =0;
			log.info("[ERROR]"+this.getClass().getName()+".dooSendMail:"+ e);
		}catch (Exception e) {
			res= 0;
			log.info("[ERROR]"+this.getClass().getName()+".dooSendMail:"+ e);
		}
		
		log.info(getClass().getName() + ".doSendMail end!");
		return res;
	}

}
