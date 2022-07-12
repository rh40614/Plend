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


}
