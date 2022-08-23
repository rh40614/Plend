package three.people.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.service.CommonService;
import three.people.service.GoogleService;
import three.people.service.KakaoService;
import three.people.service.MailSendService;
import three.people.service.NaverService;

import three.people.service.UserService;
import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;
import three.people.vo.UserVO;


@RequestMapping(value="/common")
@Controller
@Configuration
@EnableWebSecurity
public class CommonController  {


	@Autowired
	private KakaoService kakaoService;
	@Autowired
	private GoogleService googleService;
	@Autowired
	private NaverService naverService;
	@Autowired
	private CommonService commonService;
	@Autowired
	UserService userService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private MailSendService mailSend;
	
	
	@RequestMapping(value="/naverLogin.do")
	public String naverLogin(SnsVO snsvo, Model model, HttpServletRequest request, HttpSession session) throws IOException {
		System.out.println("naver 로그인 들어옴");
		SnsProfileVO snsProfile = new SnsProfileVO();

		snsvo = naverService.getAccessToken(snsvo);
		snsProfile = naverService.getUserProfile(snsvo);
		UserVO userVO = new UserVO();
		userVO.setNaver_id(snsProfile.getId());
		userVO = commonService.snsIdCheck(userVO);
		if(userVO == null) {
			System.out.println("null");
			model.addAttribute("userProfile", snsProfile);
			model.addAttribute("snsId", snsProfile);
			//정보 동의 취소 누를시 메인화면으로 이동
			if(snsProfile.getMessage() != null && snsProfile.getMessage().contains("Authentication failed")) {
				return "redirect:/";
			}
			model.addAttribute("access_token",snsvo.getAccess_token());
			model.addAttribute("user_type","naver");
			model.addAttribute("state", snsvo.getState());
			return "common/snsSignUp";
		}else {
			System.out.println("not null");
			
			UserVO login = new UserVO(); 
			login.setNaver_id(snsProfile.getId());
			System.out.println("snsId: "+snsProfile.getId());
			login = commonService.selectSnsUser(login);
			session.setMaxInactiveInterval(1800);
			session.setAttribute("login", login);
		}

		return "redirect:/";
	}
	 
	
	@RequestMapping(value="/kakaoLogin")
	public String login(SnsVO snsvo , HttpServletRequest request, HttpSession session,Model model, RedirectAttributes rttr) throws IOException {
		SnsProfileVO snsProfile = new SnsProfileVO();
		
		snsvo = kakaoService.getAccessToken(snsvo);
		snsProfile.setAccess_token(snsvo.getAccess_token());
		UserVO userVO = kakaoService.userCheck(snsProfile);
		SnsProfileVO snsId = kakaoService.getUserId(snsProfile);
		if(userVO == null) {
			System.out.println("null");
			model.addAttribute("userProfile", kakaoService.getUserProfile(snsvo));
			model.addAttribute("snsId", snsId);
			model.addAttribute("access_token",snsProfile.getAccess_token());
			model.addAttribute("user_type","kakao");
			return "common/snsSignUp";
		}else {
			System.out.println("not null");
			session = request.getSession();
			
			UserVO login = new UserVO(); 
			login.setKakao_id(snsId.getId());
			System.out.println("snsId: "+snsId.getId());
			login = commonService.selectSnsUser(login);
			session.setMaxInactiveInterval(1800);
			session.setAttribute("login", login);
			rttr.addFlashAttribute("msg", "로그인 되셨습니다.");
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/googleloginGo.do") 
	public String googleloginGo(SnsVO snsvo, HttpSession session, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		
		session = request.getSession();		
		SnsProfileVO snsProfile =  googleService.getUserProfile(snsvo);
		session.setAttribute("sub", snsProfile.getSub());
		
		return "common/googleloginGo";
	}
	
	//sns 로그인 연결 끊기
	@RequestMapping(value="/cancelSnsSignUp.do")
	public String cancelSnsSignUp(SnsProfileVO snsProfileVO, UserVO userVO) throws IOException {
		if(userVO.getUser_type().equals("kakao")) {
			kakaoService.snsUnlink(snsProfileVO);
		}else if(userVO.getUser_type().equals("naver")) {
			System.out.println("at: "+snsProfileVO.getAccess_token());
			
			naverService.snsUnlink(snsProfileVO);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/signUp.do", method = RequestMethod.GET)
	public String signUp(Model model) throws UnsupportedEncodingException {
		model.addAttribute("kakao", kakaoService.loginApiURL());
		model.addAttribute("naver", naverService.loginApiURL());
		return "common/signUp";
	}

	@RequestMapping(value="/signUp.do", method = RequestMethod.POST)
	public String signUp(UserVO vo, SnsVO snsVO, Model model, HttpServletRequest request, HttpSession session,RedirectAttributes rttr) throws IOException {
		if(vo.getUser_type() == null) {
			String encodedPassword = passwordEncoder.encode(vo.getPassword());
			vo.setPassword(encodedPassword);
			int result = userService.insertUser(vo);
		}else {
			System.out.println("naver_id: "+vo.getNaver_id());
			Date now =new Date();
			SimpleDateFormat simple = new SimpleDateFormat("SSS");
			String distinct = simple.format(now);
			if(vo.getUser_type().equals("kakao")) {
				vo.setId(vo.getKakao_id()+distinct);
				commonService.insertSnsUser(vo);
				snsVO = kakaoService.loginApiURL();
				return "redirect:" + snsVO.getApiURL();
			}else {
				vo.setId(vo.getNaver_id()+distinct);
				int result = commonService.insertSnsUser(vo);
				if(result == 1) {
					UserVO login = commonService.selectSnsUser(vo);
					session = request.getSession();
					session.setMaxInactiveInterval(1800);
					session.setAttribute("login", login);
					rttr.addFlashAttribute("msg", "회원가입 되셨습니다.");
				}
			}
		}
		
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
	public String signIn(Model model) throws UnsupportedEncodingException {
		model.addAttribute("kakao", kakaoService.loginApiURL());
		model.addAttribute("naver", naverService.loginApiURL());
		return "common/signIn";
	}

	@RequestMapping(value = "signIn.do", method = RequestMethod.POST)
	public String signIn(String password, UserVO vo, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO id = userService.selectID(vo);
		UserVO user = userService.login(vo);

		if (user != null && encoder.matches(password, id.getPassword())) {
			session = request.getSession();

			UserVO login = new UserVO();
			login.setUidx(user.getUidx());
			System.out.println(user.getUidx());
			login.setId(user.getId());
			login.setRole(user.getRole());
			login.setNickName(user.getNickName());
			
			//System.out.println("role ="+user.getRole());
			//System.out.println("nickname = "+user.getNickName());
			
			//자동 로그아웃 시간 30분
			//움직이지 않고 가만히 있을 경우 식ㄴ이 흘러 30분이 경과됐을 때 자동 로그아웃
			session.setMaxInactiveInterval(1800);
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
	public String searchId(UserVO vo) {
		
		vo = userService.searchID(vo);
		
		if (vo == null) {
			return "";
		}else if(vo.getUser_type() != null) {
			return vo.getUser_type();
		}else {
			return vo.getId();
		}


	}

	@RequestMapping(value = "/searchPwd.do", method = RequestMethod.GET)
	public String searchPwd() {

		return "common/searchPwd";
	}

	@RequestMapping(value = "/searchPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public String searchPwd(UserVO vo, Model model,@RequestParam("email") String email, @RequestParam("name") String name,@RequestParam("id") String id) {

		int being = userService.selectPwd(vo);
		
		if (being == 1) {
			String pwd = mailSend.TempPwdEmail(email);
			System.out.println("임시 비밀번호 : "+pwd);
			String encodedPassword = passwordEncoder.encode(pwd);
			vo.setPassword(encodedPassword);
			int result = userService.tempPwd(vo);
			if (result == 1) {
				return pwd;                     
			} else {
				return "";
			}
		} else if (being == 0) {
			return "";
		} else {
			return "";
		} 

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
	public String login(UserVO vo, HttpServletRequest request, HttpSession session,HttpServletResponse response) throws IOException {

		UserVO user = userService.login(vo);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();

		if (user != null) {
			session = request.getSession();

			UserVO login = new UserVO();
			login.setId(user.getId());
			login.setPassword(user.getPassword());
			login.setRole(user.getRole());
			login.setNickName(user.getNickName());
			
			//System.out.println("role = "+user.getRole());
			//System.out.println("nickname = "+user.getNickName());

			session.setAttribute("login", login);
			return "redirect:/";

		} else {
			pw.append("<script>alert('로그인에 실패하였습니다.');location.href = 'login.do'</script>");
			
			pw.flush();
			return "common/login";
		}


	}
	@RequestMapping(value = "/signOut.do")
	public String logout(HttpServletRequest request, HttpSession session) throws IOException {
		
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		if(login.getUser_type() != null && login.getUser_type().equals("kakao")) {
			SnsVO snsVO = new SnsVO();
			snsVO = kakaoService.getAccessToken(snsVO);
			kakaoService.snsLogOut(snsVO);
		}else if(login.getUser_type() != null && login.getUser_type().equals("naver")) {
			
		}
		session.invalidate();

		return "redirect:/";
	}

	
}
