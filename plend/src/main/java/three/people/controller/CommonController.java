package three.people.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import three.people.service.GoogleService;
import three.people.service.KakaoService;
import three.people.service.NaverService;
import three.people.service.UserService;
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
	@Autowired
	private NaverService naverService;
	@Autowired
	UserService userService;

	
	@RequestMapping(value="/naverLogin.do")
	public String naverLogin(SnsVO snsvo, Model model, HttpServletRequest request) throws IOException {
		System.out.println("callback success");
		snsvo = naverService.getAccessToken(snsvo);
		SnsProfileVO snsProfile = naverService.getUserProfile(snsvo);
		return "common/naverCallback";
	}
	 
	
	@RequestMapping(value="/kakaoLogin")
	public String login(SnsVO snsvo , HttpServletRequest request, HttpSession session) throws IOException {
		
		snsvo = kakaoService.getAccessToken(snsvo);
		SnsProfileVO snsProfile = kakaoService.getUserProfile(snsvo);
	
		return "common/kakao";
	}
	
	@RequestMapping(value = "/googleloginGo.do") 
	public String googleloginGo(SnsVO snsvo, HttpSession session, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		
		session = request.getSession();		
		SnsProfileVO snsProfile =  googleService.getUserProfile(snsvo);
		session.setAttribute("sub", snsProfile.getSub());
		
		return "common/googleloginGo";
	}

	@RequestMapping(value= "/join.do", method = RequestMethod.GET)
	public String join() {
		return "common/join";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(UserVO vo) {
		int result = userService.insertUser(vo);
		return "redirect:/";
	}
	
	/*
	 * @RequestMapping(value="/logout") public String logout(HttpSession session )
	 * throws IOException { //KakaoVO id = new KakaoVO(); //Long KakaoId =
	 * id.getKakaoId();
	 * 
	 * //System.out.println(session.getAttribute("access_Token"));
	 * //System.out.println(KakaoId);
	 * 
	 * Long kakaoId = (Long)session.getAttribute("kakaoId");
	 * 
	 * // kakaoService.logout((String)session.getAttribute("access_Token"),
	 * kakaoId); session.removeAttribute("access_Token");
	 * session.removeAttribute("nickname"); session.removeAttribute("kakaoId");
	 * 
	 * return "redirect:/"; }
	 */

}
