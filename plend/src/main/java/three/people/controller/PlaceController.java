package three.people.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import three.people.service.BookService;
import three.people.service.PlaceService;
import three.people.vo.BookVO;
import three.people.vo.BootPayVO;
import three.people.vo.ImageVO;
import three.people.vo.HeartVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.UserVO;

@RequestMapping(value="/place")
@Controller
public final class PlaceController {
	
	@Autowired
	PlaceService placeService;
	
	@Autowired
	BookService bookService;
	
	// 한 장소의 상세보기 페이지
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(PlaceVO placevo, Model model, HttpServletRequest request,HttpSession session) {
		
		session = request.getSession();
		if(session.getAttribute("login") != null) {
			UserVO login = (UserVO) session.getAttribute("login");
			HeartVO heartvo = new HeartVO();
			heartvo.setUidx(login.getUidx());
			heartvo.setPidx(placevo.getPidx());
			
			model.addAttribute("heartList", placeService.selectHeart(heartvo));
		}
		
		
		model.addAttribute("imageList", placeService.selectImage(placevo));
		model.addAttribute("placeOne", placeService.placeOne(placevo));
		model.addAttribute("QnaList", placeService.selectQnA(placevo));
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
	@RequestMapping(value="/heart.do", method=RequestMethod.GET)
	@ResponseBody
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
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public String test() {
		return "place/test";
	}




	
	
	
	
	
	
	
	@RequestMapping(value="/placeList.do", method = RequestMethod.GET)
	public String placeList(PlaceVO placeVO, Model model) {
		//카테고리에 해당하는 장소 리스트
		List<PlaceVO> list = placeService.categoryPlace(placeVO);
		
			for(PlaceVO place: list) {
				int pidx = place.getPidx();
				//사진을 pidx 값으로 찾기 때문에 설정
				placeVO.setPidx(pidx);
				//사진도 list에 담기 
				ImageVO imageOne = placeService.selectImageOne(place);
				String file = imageOne.getOriginFileName();
				place.setPlaceImg(file);
			}
		
		model.addAttribute("list", list);
		
		//헤더 카테고리 나타내기 
		model.addAttribute("category", placeVO);
		
		return"place/placeList";
	}
	
	


	@RequestMapping(value="/filter_search.do", method = RequestMethod.GET)
	public String filter_search(PlaceVO placeVO, Model model) {
		System.out.println("CntPeople: "+placeVO.getCntPeople() );
		
		
		List<PlaceVO> list = placeService.filter_search(placeVO);
		System.out.println("검색 결과 : " + list);
		
		for(PlaceVO place: list) {
			int pidx = place.getPidx();
			placeVO.setPidx(pidx);
			ImageVO imageOne = placeService.selectImageOne(place);
			String file = imageOne.getOriginFileName();
			place.setPlaceImg(file);
		}
	
		model.addAttribute("list", list);
		
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
		
		
		System.out.println("pidx"+bookVO.getPidx());
		System.out.println("UseTime: "+bookVO.getUseTime());
		System.out.println("cntpeople : "+ bookVO.getCntPeople());
		System.out.println("option1: "+ bookVO.getOption1());
		
		int result = bookService.insertBook(bookVO);
		return result;
		
	}










}
