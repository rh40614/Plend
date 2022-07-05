package three.people.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/common")
@Controller
public class CommonController {
	
	@RequestMapping(value="/kakaoLogin.do")
	public String kakaologin() {
		return "common/kakao";
	}
	
	public String getToken(@RequestParam("code") ) {
		
	}

}
