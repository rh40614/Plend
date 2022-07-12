package three.people.controller;

import java.io.UnsupportedEncodingException;
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

import three.people.service.GoogleService;
import three.people.service.KakaoService;
import three.people.service.NaverService;
import three.people.vo.SnsVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Autowired
	private NaverService naverservice;
	@Autowired
	private KakaoService kakaoService;
	@Autowired
	private GoogleService googleService;
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		SnsVO navervo = naverservice.loginApiURL(); 
		session.setAttribute("state",navervo.getState()); 
		model.addAttribute("navervo", navervo);
		model.addAttribute("serverTime", formattedDate );
		
		SnsVO kakaovo = kakaoService.loginApiURL();
		model.addAttribute("kakaovo", kakaovo);
		
		return "home";
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

	
	
	@RequestMapping(value="login.do")
	public String Login() {
		return "common/login";
	}
	


	@RequestMapping(value="insertPlace.do")
	public String insertPlace() {
		return "host/insertPlace";
	}


}


