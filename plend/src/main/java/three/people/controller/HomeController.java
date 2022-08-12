package three.people.controller;

import java.util.ArrayList;
import java.util.List;

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
import three.people.service.ReviewService;
import three.people.service.Scheduler;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;


@Controller
public class HomeController {

	@Autowired
	PlaceService placeService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	private MailSendService mailSend;
	@Autowired
	Scheduler scheduler;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mains(SearchVO searchVO, Model model, HttpServletRequest request, HttpSession session) {
		scheduler.autoUpdate();
		return "home";
	}



	@RequestMapping(value = "/recommendPlace", method = RequestMethod.GET)
	public String recommendPlace(SearchVO searchVO, Model model, HttpServletRequest request, HttpSession session) {

		//장소리스트
		List<PlaceVO> placeList = placeService.selectPlace();

		//1. 장소 랜덤
		List<PlaceVO> randomPlaceList = new ArrayList<PlaceVO>();
		//화면 초기에 장소가 3개이하이면 랜덤없이 그냥 장소가지고 오기
		if(placeList.size()<6) {
			for(PlaceVO p: placeList ) {
				//장소 사진 가지고 오기
				ImageVO imageOne = placeService.selectImageOne(p);
				String file = imageOne.getOriginFileName();
				p.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(p);
				p.setAvgRate(avgRate);
				//넣기
				randomPlaceList.add(p);
			}

		}else {
			//랜덤으로 뽑기
			int[] idx = placeService.RandomPlace(placeList);
			//인덱스 배열이 완성되면 장소 가지고 오기
			for(int i:idx) {
				//장소 가지고 오기
				PlaceVO randomPlace =  placeList.get(i);
				//장소 사진 가지고 오기
				ImageVO imageOne = placeService.selectImageOne(randomPlace);
				String file = imageOne.getOriginFileName();
				randomPlace.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(randomPlace);
				randomPlace.setAvgRate(avgRate);
				//넣기
				randomPlaceList.add(randomPlace);

			}
		}
		model.addAttribute("list", randomPlaceList);

		return "ajax/recommendPlace";
	}





	@RequestMapping(value = "/eventPlace", method = RequestMethod.GET)
	public String eventPlace(Model model, HttpServletRequest request, HttpSession session) {

		//이벤트 리스트
		List<PlaceVO> eventList = placeService.eventPlace();

		//2. 이벤트 랜덤
		List<PlaceVO> randomEventList = new ArrayList<PlaceVO>();

		if(eventList.size()<6) {
			for(PlaceVO e: eventList ) {
				//장소 사진 가지고 오기
				ImageVO imageOne = placeService.selectImageOne(e);
				String file = imageOne.getOriginFileName();
				e.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(e);
				e.setAvgRate(avgRate);
				//넣기
				randomEventList.add(e);
			}

		}else {
			//랜덤으로 뽑기
			int[] idx2 = placeService.RandomPlace(eventList);
			PlaceVO randomPlace;
			//인덱스 배열이 완성되면 장소 가지고 오기
			for(int i:idx2) {
				//장소 가지고 오기
				randomPlace = eventList.get(i);
				//사진가지고오기
				ImageVO imageOne = placeService.selectImageOne(randomPlace);
				String file = imageOne.getOriginFileName();
				randomPlace.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(randomPlace);
				randomPlace.setAvgRate(avgRate);
				//넣기
				randomEventList.add(randomPlace);
			}
		}

		model.addAttribute("list2", randomEventList);


	return "ajax/eventPlace";
	}




	@RequestMapping(value = "/randomReview", method = RequestMethod.GET)
	public String randomReview(Model model, HttpServletRequest request, HttpSession session) {

		List<ReviewVO> reviewList = reviewService.reviewAll();
		List<ReviewVO> randomReviewList = new ArrayList<ReviewVO>();

		//등록된 리뷰가 6개 이하 일 떄
		if(reviewList.size()<6) {

			for(ReviewVO r: reviewList ) {
				//장소 사진 가지고 오기
				ImageVO imageOne = reviewService.selectImageOne(r);
				String file = imageOne.getOriginFileName();
				r.setReviewImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(r);
				r.setAvgRate(avgRate);
				//넣기
				randomReviewList.add(r);
			}

		}else {
			//랜덤으로 뽑기
			int[] idx = reviewService.RandomReview(reviewList);
			ReviewVO random;
			for(int i:idx) {
				random = reviewList.get(i);
				//사진가지고오기
				ImageVO imageOne = reviewService.selectImageOne(random);
				String file = imageOne.getOriginFileName();
				random.setReviewImg(file);
				//넣기
				randomReviewList.add(random);
			}
		}

		model.addAttribute("list3", randomReviewList);


	return "ajax/randomReview";
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

	@RequestMapping(value="filter_search.do")
	public String filter_search(PlaceVO placeVO, Model model){
		System.out.println("검색: "+ placeVO.getAddress());
		List<PlaceVO> pl = placeService.filter_search(placeVO);

		model.addAttribute("list",pl);

		return "place/ajax/placeList";
	}







}
