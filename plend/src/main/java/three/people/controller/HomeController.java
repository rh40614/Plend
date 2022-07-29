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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import three.people.service.MailSendService;
import three.people.service.PlaceService;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;


@Controller
public class HomeController {
	
	@Autowired
	PlaceService placeService;
	
	@Autowired
	private MailSendService mailSend;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mains(SearchVO searchVO, Model model, HttpServletRequest request, HttpSession session) {
		//장소리스트 //이벤트 리스트 
		List<PlaceVO> placeList = placeService.selectPlace();
		List<PlaceVO> eventList = placeService.eventPlace();
		
		//1. 장소 랜덤
		List<PlaceVO> randomPlaceList = new ArrayList<PlaceVO>(); 
		
		//화면 초기에 장소가 3개이하이면 랜덤없이 그냥 장소가지고 오기
		if(placeList.size()<3) {
			randomPlaceList = placeList;
			
		}else {
			//랜덤으로 뽑기
			int[] idx = placeService.RandomPlace(placeList);
			//인덱스 배열이 완성되면 장소 가지고 오기
			for(int i:idx) {
				//장소 가지고 오기
				PlaceVO randomPlace = placeList.get(i);
				
				//장소 사진 가지고 오기
				ImageVO imageOne = placeService.selectImageOne(randomPlace);
				String file = imageOne.getOriginFileName();
				randomPlace.setPlaceImg(file);
				//넣기
				randomPlaceList.add(randomPlace);
				
			}
		}		
			
			
			
		//2. 이벤트 랜덤
		List<PlaceVO> randomEventList = new ArrayList<PlaceVO>(); 
		
		if(placeList.size()<3) {
			randomEventList = eventList;
			
		}else {
			//랜덤으로 뽑기
			int[] idx2 = placeService.RandomPlace(eventList);
			//인덱스 배열이 완성되면 장소 가지고 오기
			for(int i:idx2) {
				//장소 가지고 오기
				PlaceVO randomPlace = eventList.get(i);
				//사진가지고오기
				ImageVO imageOne = placeService.selectImageOne(randomPlace);
				String file = imageOne.getOriginFileName();
				randomPlace.setPlaceImg(file);
				//넣기
				randomEventList.add(randomPlace);
			}
		}
		//3. 리뷰 랜덤
		
		
		//4.화면단 이동
		model.addAttribute("list", randomPlaceList);
		model.addAttribute("list2", randomEventList);
		
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










