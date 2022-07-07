package three.people.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.java8.Base64;
import three.people.service.UserService;
import three.people.vo.GoogleInfoVO;
import three.people.vo.UserVO;

@RequestMapping(value = "/common")
@Controller

public class CommonController {
	
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
	public String googleloginGo(@RequestParam("credential") String token,GoogleInfoVO vo, HttpSession session, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		
		session = request.getSession();
		
		System.out.println("token = " + token);
		
		String[] chunks = token.split("\\.");
		
		Base64.Decoder decoder = Base64.getUrlDecoder();
		//"UTF-8"을 넣어주어야 글자가 깨지지 않음
		String header = new String (decoder.decode(chunks[0]),"UTF-8");
		String payload = new String (decoder.decode(chunks[1]),"UTF-8");
		//json parse 되는지 알아보기
		//objectmapper 이름이 맞으면 객체로 넣어주는것 알아보기
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
