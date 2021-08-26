package org.sob.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.sob.domain.JoinVO;
import org.sob.domain.UserVO;
import org.sob.mapper.LoginMapper;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
	
	private LoginMapper mapper;
	
	@Inject
	private JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입

	@Override
	public String sendMail(String email) {
		
		// 인증코드 생성
		String authCode = null;
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		authCode = temp.toString();
		
		// 이메일 전송
		 try {
	            // 이메일 객체
	            MimeMessage msg = mailSender.createMimeMessage();
	 
	            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	            msg.addRecipient(RecipientType.TO, new InternetAddress(email));
	 
	            /*
	             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
	             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
	             * 수신자 이메일 주소
	             */
	 
	            // 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
	            msg.addFrom(new InternetAddress[] { new InternetAddress("testemailaddressSOB@gmail.com", "SOB") });
	 
	            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setSubject("[Sea Of Bottle] 이메일 인증번호 입니다.", "utf-8");
	            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setText("인증번호: " + authCode, "utf-8");
	 
//	            html로 보낼 경우            
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper 
//	            = new MimeMessageHelper(message, true);
//	            helper.setTo("test@host.com");
//	            helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
	 
	            // 이메일 보내기
	            mailSender.send(msg);
	            
	            return authCode;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "error 발생";
	        }

	}
	
	@Override
	public UserVO getUserIdToGoogle(String googleId) {
		log.info("googleId --- 변환 중 ---> userId");
		return mapper.getUserIdToGoogle(googleId);
	}
	
	@Override
	public UserVO getUserIdToEmail(String email, String pw) {
		// TODO Auto-generated method stub
		return mapper.getUserIdToEmail(email, pw);
	}
	
	@Override
	public void joinUser(JoinVO join) {
		mapper.joinUser(join);
	}
	
	@Override
	public String dupleCheck(String emailId) {
		log.info("------- 중복 체크 중 -----------");
		UserVO user = mapper.dupleCheck(emailId);
		if (user != null) {
			return (user.getGoogleid() != null)?user.getNick() + "/" + user.getGoogleid():"unuseable/plain";
		}else {
			return "useable";
		}
	}
	
	@Override
	public void modifyUser(JoinVO join) {
		mapper.modifyUser(join);
	}
	
}
