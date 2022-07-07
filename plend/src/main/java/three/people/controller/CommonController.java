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

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonParseException;

import three.people.service.KakaoAPI;
import three.people.service.UserService;
import three.people.vo.GoogleInfoVO;
import three.people.vo.KakaoVO;
import three.people.vo.UserVO;


@RequestMapping(value="/common")
@Controller
public class CommonController {
	
	// ���� ��ü���� �ޱ�
	@Autowired 
    private KakaoAPI kakaoService;
	@Autowired
	UserService userService;

	//카카오 로그인 
	@RequestMapping(value="/kakaoLogin")
	public String login(@RequestParam("code") String code , HttpServletRequest request, HttpSession session) throws IOException {
		
		//��ū �߱�
		String access_Token = kakaoService.getAccessToken(code);
		
		//����� ���� ��������
		//HashMap<String, Object> userInfo = kakaoService.userInfo(access_Token);
		KakaoVO userInfo = kakaoService.userInfo(access_Token);
		
		
		session = request.getSession();
		
		System.out.println("accessToken: "+access_Token);
		System.out.println("code:"+ code);
		System.out.println("Common Controller:"+ userInfo);
		System.out.println("�г���: "+ userInfo.getNickname());
		System.out.println("�̸���: "+ userInfo.getAccount_email());
		System.out.println("����: "+ userInfo.getGender());
		
		
		//Ŭ���̾�Ʈ�� �г����� �����ϸ� ���ǿ� �г��Ӱ� ��ū ���
		if (userInfo.getNickname() != null) {
		     session.setAttribute("nickname", userInfo.getNickname());
		     session.setAttribute("access_Token", access_Token);
		     session.setAttribute("kakaoId", userInfo.getKakaoId());
		   }
		
		
		return "common/kakao";
	}
	
	
	
	//�α׾ƿ�
	@RequestMapping(value="/logout")
	public String logout(HttpSession session ) throws IOException {
		//ȸ�� ���̵� ���������� - �̷����ϸ� ������ ���°� �ƴ϶� ���� ����� �Ǵ� ��
		//KakaoVO id = new KakaoVO();
		//Long KakaoId = id.getKakaoId();
		
		//System.out.println(session.getAttribute("access_Token"));
		//System.out.println(KakaoId);
		
		//����� ������ ���� ���ǿ� id�� ���(�Ѱ��ֱ� ����)
		Long kakaoId = (Long)session.getAttribute("kakaoId");
		
		//�α׾ƿ�
		kakaoService.logout((String)session.getAttribute("access_Token"), kakaoId);
		session.removeAttribute("access_Token");
		session.removeAttribute("nickname");
		session.removeAttribute("kakaoId");
				
		return "redirect:/";
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
	public String googleloginGo(@RequestParam("credential") String token,GoogleInfoVO vo, HttpSession session, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		
		session = request.getSession();
		
		System.out.println("token = " + token);
		
		String[] chunks = token.split("\\.");
		
		Base64.Decoder decoder = Base64.getUrlDecoder();
		//"UTF-8"�� �־��־�� ���ڰ� ������ ����
		String header = new String (decoder.decode(chunks[0]),"UTF-8");
		String payload = new String (decoder.decode(chunks[1]),"UTF-8");
		//json parse �Ǵ��� �˾ƺ���
		//objectmapper �̸��� ������ ��ü�� �־��ִ°� �˾ƺ���
		System.out.println("payload = " + payload );
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		
		vo = mapper.readValue(payload, GoogleInfoVO.class);
		
		GoogleInfoVO info = new GoogleInfoVO();
		
		info.setAud(vo.getAud());
		info.setEmail(vo.getEmail());
		info.setName(vo.getName());
		info.setSub(vo.getSub());
		
		session.setAttribute("info", info);
		
		System.out.println("vo = " + vo);
		
		
		return "common/googleloginGo";
	
	}
}
