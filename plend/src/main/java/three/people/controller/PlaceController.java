package three.people.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import three.people.service.BookService;
import three.people.service.CommonService;
import three.people.service.HostService;
import three.people.service.PlaceService;
import three.people.service.ReviewService;
import three.people.vo.BookVO;
import three.people.vo.BootPayVO;
import three.people.vo.ImageVO;
import three.people.vo.HeartVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@RequestMapping(value="/place")
@Controller
public final class PlaceController {
	
	@Autowired
	PlaceService placeService;
	
	@Autowired
	BookService bookService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	CommonService commonService;
	

	
	// 한 장소의 상세보기 페이지
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(PlaceVO placevo, ReviewVO reviewVO, SearchVO searchVO, Model model, HttpServletRequest request,HttpSession session) {
		
		session = request.getSession();
		if(session.getAttribute("login") != null) {
			UserVO login = (UserVO) session.getAttribute("login");
			HeartVO heartvo = new HeartVO();
			heartvo.setUidx(login.getUidx());
			heartvo.setPidx(placevo.getPidx());
			
			model.addAttribute("heartList", placeService.selectHeart(heartvo));
		}
		
		if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		searchVO.setCntPerPage(5);
		searchVO.calPaging(reviewService.countPlaceReview(reviewVO));
		
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("searchVO", searchVO);
		hashMap.put("reviewVO", reviewVO);
		
		//08.18 김연희: 평균 별점 추가
		PlaceVO p = placeService.placeOne(placevo);
		p.setCntHeart(placeService.countHeart(placevo));
		int avgRate = reviewService.avgRevew(p);
		p.setAvgRate(avgRate);
		//08.26 김연희: 리뷰이미지
		List<ImageVO> hasImgs = new ArrayList<ImageVO>();
		
		List<ReviewVO> reviewlistAll = reviewService.placeReviewAll(hashMap);
			for(ReviewVO review: reviewlistAll) {
				List<ImageVO> imgs = reviewService.reviewImg(review);
				
				for(int i=0; i<imgs.size();i++) {
					 if(imgs.get(i) != null) {
						 hasImgs.add(imgs.get(i));
					 }
				}
			}
			//System.out.println("afterimgs: "+hasImgs);
			
		model.addAttribute("pagination", searchVO);
		model.addAttribute("reviewList", reviewService.selectPlaceReview(hashMap));
		model.addAttribute("imageList", placeService.selectImage(placevo));
		model.addAttribute("placeOne", p);
		model.addAttribute("QnaList", placeService.selectQnA(placevo));
		model.addAttribute("reviewImgs", hasImgs);
		
		return "place/placeDetail";
	}
	
	
	// qna 질문하기 버튼
	@RequestMapping(value="/question.do", method=RequestMethod.POST)
	public String qna(QnaVO qnavo) {
		placeService.insertQnA(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
	
	// qna 답변하기 등록 눌럿을 때 들어오는 매핑
	@RequestMapping(value="/answer.do", method=RequestMethod.POST)
	public String answer(QnaVO qnavo) {
		// qna 답변이라 depth 1 셋팅
		qnavo.setDepth(1);
		
		placeService.insertQnA(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
	// qna 질문 수정하기
	@RequestMapping(value="/questionModify.do", method=RequestMethod.POST)
	public String questionModify(QnaVO qnavo) {
		placeService.qnaModify(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
	//qna 질문 삭제하기
	@RequestMapping(value="/deleteQna.do", method=RequestMethod.GET)
	public String deleteQna(QnaVO qnavo) {
		placeService.deleteQnA(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
	// 예약하기
	@RequestMapping(value="/book.do", method=RequestMethod.POST)
	public String book(BookVO bookvo, Model model) {
		model.addAttribute("bookvo", bookvo);
		model.addAttribute("placeOne", placeService.placeOne(bookvo));
		
		return "place/beforeBookDetail";
	}
	
	//찜목록 등록, 삭제
	@ResponseBody
	@RequestMapping(value="/heart.do", method=RequestMethod.GET, produces="application/json; utf-8")
	public int like(HeartVO hvo, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		hvo.setUidx(login.getUidx());
		
		// like의 값에 따라 다른 sql구문 전송
		if(hvo.getLike().equals("add")) {
			return placeService.likeAdd(hvo);
		}else if(hvo.getLike().equals("delete")) {
			return placeService.likeDelete(hvo);
		}else {
			return 0;
		}
		
	}
	
	@RequestMapping(value="/placeList.do", method = RequestMethod.GET)
	public String placeList(PlaceVO placeVO, Model model, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		
		//로그인 했을 경우 
		if(session.getAttribute("login") != null) {
			UserVO login = (UserVO) session.getAttribute("login");
			int uidx = login.getUidx();
			PlaceVO heart = new PlaceVO();
			heart.setUidx(uidx);
			heart.setCategory(placeVO.getCategory());
			
			//카테고리에 해당하는 장소 리스트
			List<PlaceVO> list = placeService.categoryPlace(heart);
			
				for(PlaceVO place: list) {
					int pidx = place.getPidx();
					//사진을 pidx 값으로 찾기 때문에 설정
					placeVO.setPidx(pidx);
					//사진도 list에 담기 
					ImageVO imageOne = placeService.selectImageOne(place);
					String file = imageOne.getRealFileName();
					place.setPlaceImg(file);
					//평균 별점
					int avgRate = reviewService.avgRevew(place);
					place.setAvgRate(avgRate);
					//찜한 사람 수 
					place.setCntHeart(placeService.countHeart(place));
				}
			
			model.addAttribute("list", list);
		}else {
			//로그인 정보가 없을 경우 
			//카테고리에 해당하는 장소 리스트
			List<PlaceVO> list = placeService.categoryPlace(placeVO);
			
				for(PlaceVO place: list) {
					int pidx = place.getPidx();
					//사진을 pidx 값으로 찾기 때문에 설정
					placeVO.setPidx(pidx);
					//사진도 list에 담기 
					ImageVO imageOne = placeService.selectImageOne(place);
					String file = imageOne.getRealFileName();
					place.setPlaceImg(file);
					//평균 별점
					int avgRate = reviewService.avgRevew(place);
					place.setAvgRate(avgRate);
					//찜한 사람 수 
					place.setCntHeart(placeService.countHeart(place));
				}
			model.addAttribute("list", list);
		}
		//헤더 카테고리 나타내기 
		model.addAttribute("category", placeVO);
		
		return"place/placeList";
	}
	
	


	@RequestMapping(value="/filter_search.do", method = RequestMethod.GET)
	public String filter_search(PlaceVO placeVO, Model model, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		
		//로그인 했을 경우 
		if(session.getAttribute("login") != null) {
			UserVO login = (UserVO) session.getAttribute("login");
			int uidx = login.getUidx();
			PlaceVO heart = new PlaceVO();
			heart.setUidx(uidx);
			heart.setCategory(placeVO.getCategory());
			heart.setAddress(placeVO.getAddress());
			heart.setCntPeople(placeVO.getCntPeople());
			
			List<PlaceVO> list = placeService.filter_search(heart);
			
			for(PlaceVO place: list) {
				int pidx = place.getPidx();
				placeVO.setPidx(pidx);
				ImageVO imageOne = placeService.selectImageOne(place);
				String file = imageOne.getRealFileName();
				place.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(place);
				place.setAvgRate(avgRate);
				//찜한 사람 수 
				place.setCntHeart(placeService.countHeart(place));
			}
			model.addAttribute("list", list);
			
		}else {
		
			List<PlaceVO> list = placeService.filter_search(placeVO);
			System.out.println("검색 결과 : " + list);
			
			for(PlaceVO place: list) {
				int pidx = place.getPidx();
				placeVO.setPidx(pidx);
				ImageVO imageOne = placeService.selectImageOne(place);
				String file = imageOne.getRealFileName();
				place.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(place);
				place.setAvgRate(avgRate);
				//찜한 사람 수 
				place.setCntHeart(placeService.countHeart(place));
			}
			model.addAttribute("list", list);
		}
		return "place/ajax/placeList";
	}
	
	
	//예약완료
	@ResponseBody
	@RequestMapping(value="/bookDetail.do", method = RequestMethod.POST)
	public BootPayVO bookDetail(BootPayVO bootpayVO , Model model) {
		System.out.println("boot: "+bootpayVO.getPrice());
		System.out.println("when: "+ bootpayVO.getRequested_at());
	
		//결제 정보 VO로로 받아오기(잭슨이 있으므로 스프링에서 알아서 json데이터를vo 짝맞추어가지고옴)
		model.addAttribute("boot",bootpayVO);
		
		return bootpayVO;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertBook.do", method = RequestMethod.POST)
	public int insertBook(BookVO bookVO, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		session.getAttribute("login");
		UserVO login = (UserVO)session.getAttribute("login");
		bookVO.setUidx(login.getUidx());
		System.out.println("price: "+ bookVO.getTotalPrice());
		int result = bookService.insertBook(bookVO);
		return result;
	}

	@RequestMapping(value="/searchPlace.do", method=RequestMethod.GET)
	public String searchPlace(SearchVO searchVO, Model model, HttpServletRequest request, HttpSession session, @RequestParam("originSearchValue") String originSearchValue) {
		model.addAttribute("searchValue", searchVO.getSearchValue());
		model.addAttribute("originSearchValue",originSearchValue);
		
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("searchValue", searchVO.getSearchValue());
		session = request.getSession();
		
		//로그인 했을 경우 
		//searchValue랑 로그인한 사람의 uidx
		if(session.getAttribute("login") != null) {
			UserVO login = (UserVO) session.getAttribute("login");
			int uidx = login.getUidx();
			search.put("uidx", uidx);
			
			List<PlaceVO> list = placeService.searchPlace(search);
			
			for(PlaceVO place: list) {
				int pidx = place.getPidx();
				//사진을 pidx 값으로 찾기 때문에 설정
				place.setPidx(pidx);
				//사진도 list에 담기 
				ImageVO imageOne = placeService.selectImageOne(place);
				String file = imageOne.getRealFileName();
				place.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(place);
				place.setAvgRate(avgRate);
				//찜한 사람 수 
				place.setCntHeart(placeService.countHeart(place));
			}
			model.addAttribute("list", list);
			model.addAttribute("searchValue",searchVO.getSearchValue());
		}else {
			
			List<PlaceVO> list = placeService.searchPlace(search);
			
			for(PlaceVO place: list) {
				int pidx = place.getPidx();
				//사진을 pidx 값으로 찾기 때문에 설정
				place.setPidx(pidx);
				//사진도 list에 담기 
				ImageVO imageOne = placeService.selectImageOne(place);
				String file = imageOne.getRealFileName();
				place.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(place);
				place.setAvgRate(avgRate);
				//찜한 사람 수 
				place.setCntHeart(placeService.countHeart(place));
			}
			model.addAttribute("list", list);
			

		}
		
		return "place/searchPlace";
	}


	@RequestMapping(value="/host.do")
	public String host(Model model, PlaceVO placeVO,  HttpServletRequest request, HttpSession session) {
		
		HashMap<String, Object> page = new HashMap<String, Object>();
		//호스트의 uidx
		page.put("placeVO", placeVO);
		
		session = request.getSession();
		//로그인 했을 때 
		if(session.getAttribute("login") != null) {
			UserVO login = (UserVO) session.getAttribute("login");
			page.put("userVO", login);
			
			List<PlaceVO> list = placeService.selectPlaceAll(page);
			
			for(PlaceVO p : list) {
				ImageVO image = placeService.selectImageOne(p);
				String file =image.getRealFileName();
				p.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(p);
				p.setAvgRate(avgRate);
				//찜한 사람 수 
				p.setCntHeart(placeService.countHeart(p));
			}
			
			model.addAttribute("list", list);
			
		}else {
		//로그인 안했을 때  
			List<PlaceVO> list = placeService.selectPlaceAll(page);
			
			for(PlaceVO p : list) {
				ImageVO image = placeService.selectImageOne(p);
				String file =image.getRealFileName();
				p.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(p);
				p.setAvgRate(avgRate);
				//찜한 사람 수 
				p.setCntHeart(placeService.countHeart(p));
			}
			System.out.println("asdf : "+ list);
			model.addAttribute("list", list);
		}
		//경로로 받은 호스트의 uidx
		int uidx = placeVO.getUidx();
		model.addAttribute("host",commonService.userInfoByUidx(uidx));
		
		return "place/hostPlaceList" ;
	}
	
	//동일한 해쉬태그가 있을경우 추천
	@RequestMapping(value="/hashList.do", method=RequestMethod.GET)
	public String hashlist(PlaceVO placeVO, Model model, HttpServletRequest request, HttpSession session) {
		
		String tagAll = placeVO.getTag();
		System.out.println("tag: "+placeVO.getTag());
		List<PlaceVO> hashList = new ArrayList<PlaceVO>();
		
		String[] tag = tagAll.split(",");
		//태그 일치하는 리스트
		List<PlaceVO> list = placeService.hashList(tag);
			for(PlaceVO place: list) {
				//사진
				ImageVO image = placeService.selectImageOne(place);
				String file =image.getRealFileName();
				place.setPlaceImg(file);
				//평균 별점
				int avgRate = reviewService.avgRevew(place);
				place.setAvgRate(avgRate);
				//찜한 사람 수 
				place.setCntHeart(placeService.countHeart(place));
				hashList.add(place);
			}

		model.addAttribute("hashList", hashList);
		return "place/ajax/hashList";
	}


	
	
	
	
	
	

}
