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
	
	// 서비스 객체주입 받기
	@Autowired 
    private KakaoAPI kakaoService;

	//주소창에 있는 code 파라미터 값 가져와서 토큰발급받기
	@RequestMapping(value="/kakaoLogin")
	public String login(@RequestParam("code") String code , HttpServletRequest request, HttpSession session) throws IOException {
		
		//토큰 발급
		String access_Token = kakaoService.getAccessToken(code);
		
		//사용자 정보 가져오기
		//HashMap<String, Object> userInfo = kakaoService.userInfo(access_Token);
		KakaoVO userInfo = kakaoService.userInfo(access_Token);
		
		
		session = request.getSession();
		
		System.out.println("accessToken: "+access_Token);
		System.out.println("code:"+ code);
		System.out.println("Common Controller:"+ userInfo);
		System.out.println("닉네임: "+ userInfo.getNickname());
		System.out.println("이메일: "+ userInfo.getAccount_email());
		System.out.println("성별: "+ userInfo.getGender());
		
		
		//클라이언트의 닉네임이 존재하면 세션에 닉네임과 토큰 등록
		if (userInfo.getNickname() != null) {
		     session.setAttribute("nickname", userInfo.getNickname());
		     session.setAttribute("access_Token", access_Token);
		     session.setAttribute("kakaoId", userInfo.getKakaoId());
		   }
		
		
		return "common/kakao";
	}
	
	
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session ) throws IOException {
		//회원 아이디 가지고오기 - 이렇게하면 가지고 오는게 아니라 새로 만들게 되는 것
		//KakaoVO id = new KakaoVO();
		//Long KakaoId = id.getKakaoId();
		
		//System.out.println(session.getAttribute("access_Token"));
		//System.out.println(KakaoId);
		
		//사용자 정보를 볼때 세션에 id도 담기(넘겨주기 위해)
		Long kakaoId = (Long)session.getAttribute("kakaoId");
		
		//로그아웃
		kakaoService.logout((String)session.getAttribute("access_Token"), kakaoId);
		session.removeAttribute("access_Token");
		session.removeAttribute("nickname");
		session.removeAttribute("kakaoId");
				
		return "redirect:/";
	}
	
	
	
}
