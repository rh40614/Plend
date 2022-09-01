package three.people.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
		//김하진 임시 비밀번호 조합 로직
		public String tempPassword(){
			int index = 0;
			char[] charSet = new char[] {
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
					'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
					'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
			};	//배열안의 문자 숫자는 원하는대로
	
			StringBuffer password = new StringBuffer();
			Random random = new Random();
	
			for (int i = 0; i < 6 ; i++) {
				double rd = random.nextDouble();
				index = (int) (charSet.length * rd);
				
				password.append(charSet[index]);
				
			}
			
			return password.toString(); 
		    //StringBuffer를 String으로 변환해서 return 하려면 toString()을 사용하면 된다.
		}
		
		public void makeRandomNumber() {
			// 난수의 범위 111111 ~ 999999 (6자리 난수)
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			authNumber = checkNum;
		}
			
		public String TempPwdEmail(String email) {
			String tempPassword = tempPassword();
			String setFrom = "kkyymm1545@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "Plend 임시 비밀번호 입니다."; // 이메일 제목 
			String content = 
					"Plend 임시 비밀번호를 발급해드립니다." + 	//html 형식으로 작성 ! 
	                "<br><br>" + 
				    "임시 비밀번호는 " + tempPassword + " 입니다." + 
				    "<br>" + 
				    "로그인 후 마이페이지에서 비밀번호를 변경해주세요."+
				    "<br>"+
				    "<div style='background-color: #7dbae5; border-radius: 15px; width: 250px; text-align: center;'>" + //이메일 내용 삽입
				    "<a href='http://jjezen.cafe24.com/plend/common/signIn.do' style='color: white;'>로그인 페이지로 이동하기</a>" +
				    "</div>";
			mailSend(setFrom, toMail, title, content);
			return tempPassword;
		}
		
		//이메일 전송 메소드
		public void mailSend(String setFrom, String toMail, String title, String content) { 
			MimeMessage message = mailSender.createMimeMessage();
			// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
			
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
				helper.setText(content,true);
				mailSender.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
	
}
