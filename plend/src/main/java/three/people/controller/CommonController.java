package three.people.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.service.GoogleService;
import three.people.service.KakaoAPI;
import three.people.service.KakaoService;
import three.people.service.SnsService;
import three.people.service.UserService;
import three.people.vo.GoogleInfoVO;
import three.people.vo.KakaoVO;
import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;
import three.people.vo.UserVO;


@RequestMapping(value="/common")
@Controller
public class CommonController {
	
	@Autowired
	private KakaoService kakaoService;
	@Autowired
	private GoogleService googleService;
	
	@RequestMapping(value="/kakaoLogin")
	public String login(SnsVO snsvo , HttpServletRequest request, HttpSession session) throws IOException {
		
		snsvo = kakaoService.getAccessToken(snsvo);

		SnsProfileVO snsProfile = kakaoService.getUserProfile(snsvo);
	
		System.out.println("accessToken: "+snsvo.getAccess_token());
		System.out.println("refresh_token: "+snsvo.getRefresh_token());
		System.out.println("code:"+ snsvo.getCode());
		System.out.println("name: "+ snsProfile.getName() );
		System.out.println("gender: "+ snsProfile.getGender());
		System.out.println("birtday: "+ snsProfile.getBirthday());
		System.out.println("age_range: "+ snsProfile.getAge_range());
		System.out.println("email: "+ snsProfile.getEmail());
		System.out.println("id: "+ snsProfile.getId());
		System.out.println("nickname: "+snsProfile.getNickname());
		
		
		return "common/kakao";
	}
	
	
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session ) throws IOException {
		//KakaoVO id = new KakaoVO();
		//Long KakaoId = id.getKakaoId();
		
		//System.out.println(session.getAttribute("access_Token"));
		//System.out.println(KakaoId);
		
		Long kakaoId = (Long)session.getAttribute("kakaoId");
		
//		kakaoService.logout((String)session.getAttribute("access_Token"), kakaoId);
		session.removeAttribute("access_Token");
		session.removeAttribute("nickname");
		session.removeAttribute("kakaoId");
				
		return "redirect:/";
	}
	
	@Autowired
	UserService userService;

	@RequestMapping(value= "/join.do", method = RequestMethod.GET)
	public String join() {
		return "common/join";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(UserVO vo) {
		int result = userService.insertUser(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/googleLogin.do")
	public String google() {
		
		return "common/googleLogin";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "common/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest request, HttpSession session) {
		
		UserVO user = userService.login(vo);
		
		if (user != null) {
			session = request.getSession();
			
			UserVO login = new UserVO();
			login.setId(user.getId());
			login.setPassword(user.getPassword());
			
			session.setAttribute("login", login);
			return "redirect:/";
					
		} else {
			return "common/login";
		}
		
		
	}
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) {
		
		request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/googleloginGo.do") 
	public String googleloginGo(SnsVO snsvo, HttpSession session, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		
		SnsProfileVO snsProfile =  googleService.getUserProfile(snsvo);
		System.out.println("aud: "+snsProfile.getAud());
		System.out.println("sub: "+snsProfile.getSub());
		System.out.println("name: "+snsProfile.getName());
		System.out.println("email: "+snsProfile.getEmail());
			
		return "common/googleloginGo";
	}

}
