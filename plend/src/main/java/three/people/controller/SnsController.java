package three.people.controller;

import java.util.Base64;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping(value="/sns")
@Controller
public class SnsController {

	@RequestMapping(value="/redirect.do")
	public String kakaoRedirect() {
		
		return "kakao";
	}
	
	@RequestMapping(value="/googleRedirect.do")
	public String googleRedirect(@RequestParam("credential") String token) {
		String[] check = token.split("\\.");
		
		Base64.Decoder decoder = Base64.getUrlDecoder();

		String header = new String(decoder.decode(check[0]));
		String payload = new String(decoder.decode(check[1]));
		System.out.println(token);
		System.out.println(header);
		System.out.println(payload);
		return "googleRedirect";
	}
	
	@RequestMapping(value="/googlelogin.do")
	public String googlelogin() {
		return "googlelogin";
	}
}
