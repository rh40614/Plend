package three.people.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

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

import three.people.service.GoogleService;
import three.people.service.KakaoService;
import three.people.service.MailSendService;
import three.people.service.NaverService;
import three.people.service.PlaceService;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;
import three.people.vo.SnsVO;


@Controller
public class HomeController {
	
	@Autowired
	PlaceService placeservice;
	
	@Autowired
	private MailSendService mailSend;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(SearchVO searchVO, Model model, HttpServletRequest request, HttpSession session) {
		
		List<PlaceVO> placeList = placeservice.selectPlace();
		
		List<PlaceVO> randomList = new ArrayList<PlaceVO>(); 
		
		Random random = new Random(placeList.size());
		System.out.println("placeList: "+placeList);
			if(placeList.size() > 0) {
				
				for(int i=0; i<9; i++) {
					int idx = random.nextInt(placeList.size());		
					PlaceVO randomPlace = placeList.get(idx);
					System.out.println("randomPlace: "+randomPlace);
					randomList.add(randomPlace);
					System.out.println(randomPlace.getPidx());
				}
			
			}
		
			//사진도 가지고 가기 지금 하드코딩 되어있음
			
			
			
			
		model.addAttribute("list", randomList);
		
		return "home";
	}
	

	
	@RequestMapping(value="emailCheck.do")
	@ResponseBody
	public void emailCheck(String email) {
		System.out.println("email: "+email);
		String result = mailSend.joinEmail(email);
		System.out.println(result);
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










