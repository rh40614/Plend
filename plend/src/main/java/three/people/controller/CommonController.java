package three.people.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonParseException;

import ch.qos.logback.classic.Logger;
import three.people.service.KakaoAPI;
import three.people.service.UserService;
import three.people.vo.GoogleInfoVO;
import three.people.vo.KakaoVO;
import three.people.vo.UserVO;


@RequestMapping(value="/common")
@Controller
public class CommonController {
	
	// 占쏙옙占쏙옙 占쏙옙체占쏙옙占쏙옙 占쌨깍옙
	@Autowired 
    private KakaoAPI kakaoService;
	@Autowired
	UserService userService;

	@RequestMapping(value="signUp.do", method = RequestMethod.GET)
	public String signUp() {
		
		return "common/signUp";
	}
	
	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String signUp(UserVO vo) {
		int result = userService.insertUser(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String id) {
			
		int count = 0;
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = userService.idCheck(id);
		
	
		map.put("cnt", count);
		
		return map;
	}
	
	@RequestMapping(value = "/nickNameCheck.do")
	@ResponseBody
	public Map<Object, Object> nickNameCheck(@RequestBody String nickName){
		
		int count = 0;
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = userService.nickNameCheck(nickName);

		map.put("cnt2", count);
		
		return map;
	}
	
	
	@RequestMapping(value = "signIn.do", method = RequestMethod.GET)
	public String signIn() {
		
		return "common/signIn";
	}
	
	@RequestMapping(value = "signIn.do", method = RequestMethod.POST)
	public String signIn(UserVO vo, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		UserVO user = userService.login(vo);
		
		if (user != null) {
			
			session = request.getSession();
			
			UserVO login = new UserVO();
			login.setUidx(user.getUidx());
			login.setId(user.getId());
			login.setPassword(user.getPassword());
			
			session.setAttribute("login", login);
			
			return "redirect:/";
		} else {
			out.println("<script>alert('로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.')</script>");
			out.flush();
			return "common/signIn";
			
		}
		
	}
	
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(UserVO vo) {
		int result = userService.insertUser(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/searchId.do", method = RequestMethod.GET)
	public String searchId() {
		
		return "common/searchId";
	}
	
	@RequestMapping(value = "/searchId.do", method = RequestMethod.POST)
	@ResponseBody
	public String searchId(@RequestParam("name") String name, @RequestParam("email") String email,UserVO vo) {
		System.out.println("name = " +name);
		System.out.println("email = " + email);
		
		if (userService.searchID(vo) == null) {
			return null;
		} else {
			return userService.searchID(vo).getId();
		}
		
		
	}
	
	@RequestMapping(value = "/searchPwd.do", method = RequestMethod.GET)
	public String searchPwd() {
		
		return "common/searchPwd";
	}
	
	@RequestMapping(value = "/searchPwd.do", method = RequestMethod.POST)
	
	public String searchPwd(UserVO vo, Model model) {
		
		
		
		return "common/searchPwd";
	}
		
	//�뼱�뼡 留먯쓣�븯怨좎떢�뼱�븯�뀭�뒗吏�; 
	//移댁뭅�삤 濡쒓렇�씤 
	@RequestMapping(value="/kakaoLogin")
	public String login(@RequestParam("code") String code , HttpServletRequest request, HttpSession session) throws IOException {
		
		//占쏙옙큰 占쌩깍옙
		String access_Token = kakaoService.getAccessToken(code);
		
		//占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
		//HashMap<String, Object> userInfo = kakaoService.userInfo(access_Token);
		KakaoVO userInfo = kakaoService.userInfo(access_Token);
		
		
		session = request.getSession();
		
		System.out.println("accessToken: "+access_Token);
		System.out.println("code:"+ code);
		System.out.println("Common Controller:"+ userInfo);
		System.out.println("占싻놂옙占쏙옙: "+ userInfo.getNickname());
		System.out.println("占싱몌옙占쏙옙: "+ userInfo.getAccount_email());
		System.out.println("占쏙옙占쏙옙: "+ userInfo.getGender());
		
		
		//클占쏙옙占싱억옙트占쏙옙 占싻놂옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹몌옙 占쏙옙占실울옙 占싻놂옙占쌈곤옙 占쏙옙큰 占쏙옙占�
		if (userInfo.getNickname() != null) {
		     session.setAttribute("nickname", userInfo.getNickname());
		     session.setAttribute("access_Token", access_Token);
		     session.setAttribute("kakaoId", userInfo.getKakaoId());
		   }
		
		
		return "common/kakao";
	}
	
	
	
	//占싸그아울옙
	@RequestMapping(value="/logout")
	public String logout(HttpSession session ) throws IOException {
		//회占쏙옙 占쏙옙占싱듸옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 - 占싱뤄옙占쏙옙占싹몌옙 占쏙옙占쏙옙占쏙옙 占쏙옙占승곤옙 占싣니띰옙 占쏙옙占쏙옙 占쏙옙占쏙옙占� 占실댐옙 占쏙옙
		//KakaoVO id = new KakaoVO();
		//Long KakaoId = id.getKakaoId();
		
		//System.out.println(session.getAttribute("access_Token"));
		//System.out.println(KakaoId);
		
		//占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占실울옙 id占쏙옙 占쏙옙占�(占싼곤옙占쌍깍옙 占쏙옙占쏙옙)
		Long kakaoId = (Long)session.getAttribute("kakaoId");
		
		//占싸그아울옙
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
	@RequestMapping(value = "/signOut.do")
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
		//"UTF-8"占쏙옙 占쌍억옙占쌍억옙占� 占쏙옙占쌘곤옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		String header = new String (decoder.decode(chunks[0]),"UTF-8");
		String payload = new String (decoder.decode(chunks[1]),"UTF-8");
		//json parse 占실댐옙占쏙옙 占싯아븝옙占쏙옙
		//objectmapper 占싱몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙체占쏙옙 占쌍억옙占쌍는곤옙 占싯아븝옙占쏙옙
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
