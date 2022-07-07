package three.people.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import oracle.net.resolver.NavServiceAlias;
import three.people.api.ApiExamMemberProfile;
import three.people.service.NaverService;
import three.people.vo.NaverProfileVO;
import three.people.vo.NaverVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	NaverService naverservice;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	


	@RequestMapping(value="test.do")
	public String test(Model model, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		
		 session = request.getSession();
		 
		 NaverVO navervo = naverservice.loginApiURL(); 
		 session.setAttribute("state",navervo.getState()); 
		 model.addAttribute("navervo", navervo);
		  
		return "test";
	}

	@RequestMapping(value="testGet.do")
	public String testGet(){
		return "redirect:http://www.naver.com";
	}
	
	@RequestMapping(value="callback.do")
	public String callback(NaverVO navervo, Model model, HttpServletRequest request) throws IOException {
		System.out.println("callback success");
		navervo = naverservice.getAccessToken(navervo);
		NaverProfileVO nprofile = naverservice.getProfile(navervo);
		return "callback";
	}

	@RequestMapping(value="headerWithCate.do")
	public String headerWithCate() {
		return "developerHeader";
	}
	
	@RequestMapping(value="signUp.do")
	public String signUp() {
		
		return "signUp";
	}
	

	
	
	@RequestMapping(value="login.do")
	public String Login() {
		return "common/login";
	}
	



}










