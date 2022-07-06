package three.people.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import three.people.service.KakaoAPI;
import three.people.vo.KakaoVO;


@RequestMapping(value="/common")
@Controller
public class CommonController {
	
	// ���� ��ü���� �ޱ�
	@Autowired 
    private KakaoAPI kakaoService;

	//�ּ�â(?)�� �ߴ� �Ķ�̴�
	@RequestMapping(value="/kakaoLogin")
	public String login(@RequestParam("code") String code , HttpServletRequest request, HttpSession session) throws IOException {
		
		
		String access_Token = kakaoService.getAccessToken(code);
		HashMap<String, Object> userInfo = kakaoService.userInfo(access_Token);
		
		session = request.getSession();
		
		System.out.println("accessToken: "+access_Token);
		System.out.println("code:"+ code);
		System.out.println("Common Controller:"+ userInfo);
		
		//Ŭ���̾�Ʈ�� �г����� �����ϸ� ���ǿ� �г��Ӱ� ��ū ���
		if (userInfo.get("nickname") != null) {
		     session.setAttribute("nickname", userInfo.get("nickname"));
		     session.setAttribute("access_Token", access_Token);
		   }
		
		
		
		return "common/kakao";
	}
	
	
	//�α׾ƿ�
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws IOException {
		
		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("nickname");
				
		return "redirect:/";
	}
	
	
	
}
