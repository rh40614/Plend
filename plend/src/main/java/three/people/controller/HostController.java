package three.people.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.BookService;
import three.people.service.CommonService;
import three.people.service.HostService;
import three.people.service.ImageServiceImpl;
import three.people.service.MainService;
import three.people.service.PlaceService;
import three.people.service.ReviewService;
import three.people.service.SearchService;
import three.people.vo.BlockVO;
import three.people.vo.BookVO;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.IncomeVO;
import three.people.vo.NoticeVO;
import three.people.vo.PagingVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;



@RequestMapping(value = "/host")
@Controller
public class HostController {

	@Autowired
	HostService hostService;
	@Autowired
	PlaceService placeService;
	@Autowired
	MainService mainService;
	@Autowired
	BookService bookService;
	@Autowired
	CommonService commonService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	ImageServiceImpl imageService;
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.GET )
	public String insertPlace() {  
		return "host/insertPlace";
	}
	
	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.POST )
	public void insertPlace(PlaceVO placeVO, HttpServletRequest request, HttpServletResponse response ,HttpSession session) throws IllegalStateException, IOException {
		
		System.out.println("장소등록POST");
		
		//세션 형성해서 login정보 가지고 오기
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		//세션에있는 회원의 uidx placeVo에 담기 (UserVo 상속 중)
		placeVO.setUidx(login.getUidx()); 
		
		System.out.println("tag: "+placeVO.getTag());
		String availTimeValue= "";
		
		for(String time:placeVO.getAvailTime()) {
			if(time.equals("24hours")) {
				System.out.println("24시간 운영");
				placeVO.setAvailTimeValue(time);
			}else {
				availTimeValue += time;
				//System.out.println("availTimeValue: "+availTimeValue);
				placeVO.setAvailTimeValue(availTimeValue);
			}
		}
		
		//장소 등록
		int result = hostService.insertPlace(placeVO);
		//화면응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
			if(result ==1) {
				//사진 저장
				imageService.savePlaceImage(request, placeVO);
				//response를 이용해서 script를 띄우면 redirect가 먹지않기 때문에 script를 이용해서 화면을 이동시켜주어야한다. 
				pw.append("<script>alert('정상적으로 등록되었습니다.');location.href='"+request.getContextPath()+"/host/managePlace.do';</script>");
				
			}else {
				System.out.println("장소등록 실패");
				pw.append("<script>alert('장소등록에 실패하였습니다. 다시 한번 시도해주시길 바랍니다. ');location.href='/insertPlace.do';</script>");
			}
	}
	
	//managePlace 화면만 로딩
	@RequestMapping(value="/managePlace.do", method = RequestMethod.GET)
	public String managePlace(HttpSession session, HttpServletRequest request) {
	
		//로그인 정보
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		//임시로 로그인 페이지 연결
		if(login == null) {
			return "redirect:/common/signIn.do";
		}
				
		return "host/managePlace";
	}
	
	//1.managePlace내부 장소 리스트 ajax
	@RequestMapping(value="/placeList.do", method = RequestMethod.GET)
	public String placeList(PlaceVO placeVO, Model model, SearchVO searchVO, HttpSession session, HttpServletRequest request) {
		System.out.println("장소 리스트 페이징 ");

		//로그인 정보
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		//해쉬맵에 넣어줄 로그인 정보 
		int uidx = login.getUidx();
		
		//페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(5);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(5);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		//cnt할때 uidx가져갈 수 있도록 넣기
		placeVO.setUidx(uidx);
		
		//토탈 갯수
		int total = placeService.cntPlace(placeVO);
		searchVO.calPaging(total);
		//System.out.println("total: "+total);
		
		//파라미터 전달
		HashMap<String, Object> page = new HashMap<String, Object>();
		
		int start = searchVO.getStart();
		int cntPerPage = searchVO.getCntPerPage(); 
		
		page.put("placeVO", placeVO);
		page.put("start", start);
		page.put("cntPerPage", cntPerPage);
		
		List<PlaceVO> list_p = placeService.selectPlaceAll(page);
		String p ="</p>";
		/*
		 * //장소 소개 35자 이상 자르기 for(PlaceVO place: list_p) {
		 * if(place.getPlaceDetail().length() > 35) { String pd
		 * =place.getPlaceDetail().substring(0, 35); place.setPlaceDetail(pd+"......");
		 * } }
		 */
	
		//화면단으로 옮기기
		model.addAttribute("list_p", list_p);
		model.addAttribute("pagination", searchVO);
		
		return "host/ajax/placeList";
	}


	//2.managePlace내부 예약 리스트 ajax
	@RequestMapping(value="/bookList.do", method = RequestMethod.GET)
	public String bookList(PlaceVO placeVO, Model model, SearchVO searchVO, HttpSession session, HttpServletRequest request) {

		//로그인 정보
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		//해쉬맵에 넣어줄 로그인 정보 
		int uidx = login.getUidx();
		
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(5);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(5);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		int total = bookService.cntBook(uidx);
		searchVO.calPaging(total);
		
		HashMap<String, Integer> page = new HashMap<String, Integer>();
		int start = searchVO.getStart();
		int cntPerPage = searchVO.getCntPerPage(); 
		page.put("uidx", uidx);
		page.put("start", start);
		page.put("cntPerPage", cntPerPage);
		
		List<BookVO> list_b = bookService.selectBookByHost(page);
		
		for(BookVO b: list_b) {
			//예약자 정보
			int uidx2 =b.getUidx();
			UserVO bookUser = commonService.userInfoByUidx(uidx2);
			b.setNickName(bookUser.getNickName());
		}
		
		model.addAttribute("list_b", list_b);
		model.addAttribute("pagination2", searchVO);
		
		return "host/ajax/bookList";
	}
	
	
	//3.managePlace내부 리뷰 리스트 ajax
	@RequestMapping(value="/reviewList.do", method = RequestMethod.GET)
	public String reviewList( Model model, SearchVO searchVO, HttpSession session, HttpServletRequest request) {
	
		//로그인 정보
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		int uidx = login.getUidx();
	
		//1.페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(5);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(5);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		int total = reviewService.cntReview(uidx);
		searchVO.calPaging(total);
		System.out.println("total: "+total );
		
		//2.리뷰 리스트
		HashMap<String, Integer> page = new HashMap<String, Integer>();
		int start = searchVO.getStart();
		int cntPerPage = searchVO.getCntPerPage(); 
		page.put("uidx", uidx);
		page.put("start", start);
		page.put("cntPerPage", cntPerPage);
		
		List<ReviewVO> list_r = reviewService.selectReviewByHost(page);
		
		for(ReviewVO r: list_r) {
			int uidx2 =r.getUidx();
			UserVO reviewUser = commonService.userInfoByUidx(uidx2);
			r.setNickName(reviewUser.getNickName());
		}
		System.out.println("searchVO: "+searchVO);
		
		model.addAttribute("list_r", list_r);
		model.addAttribute("pagination3", searchVO);
		
		return "host/ajax/reviewList";
		
	}
	
	
	
	
	@RequestMapping(value="/inquiry_user.do", method= RequestMethod.GET)
	public String userInquiry(HttpSession session, HttpServletRequest request, Model model, SearchVO searchVO) {
		System.out.println("이용자 문의 사항 관리 페이지");
		//로그인 정보
		session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		
		//페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(5);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(5);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		
		//파라미터 전달
		HashMap<String, Integer> page = new HashMap<String, Integer>();
		//cnt위한 param
		int uidx = login.getUidx();
		page.put("uidx", uidx);
		//cnt//토탈 갯수
		List<QnaVO> listForCnt = hostService.qnaList(page);
		int size = listForCnt.size();
		searchVO.calPaging(size);
		
		//page위한 parma
		int start = searchVO.getStart();
		int cntPerPage = searchVO.getCntPerPage(); 
		page.put("start", start);
		page.put("cntPerPage", cntPerPage);
		
		//page + 리스트
		List<QnaVO> list = hostService.selectQna(page);
		//페이지의 수를 limit 쿼리에서 size로 측정하게 되면 5개 가 총 갯수가 되어버림
		//총 갯수를가져오는 쿼리.size()
		
		
		//title따로 안받았음. content 40자까지가 제목
		for(QnaVO q : list) {
			String con = q.getContent();
			if(con.length() > 40) {
				String t =  con.substring(0,40);
				q.setTitle(t+"...");
			}else {
				q.setTitle(con);
			}
		}
		
		model.addAttribute("list", list);		
		model.addAttribute("pagination" , searchVO);

		
		return "host/inquiry_user";
	}
	

	
	
	@RequestMapping(value="/eventList.do", method= RequestMethod.GET)
	public String eventList(Model model, EventVO eventVO) {
		
		System.out.println("이벤트 리스트 페이지 ");
		
		//화면 로딩시 파라미터가 start인것들만 가지고 옴
		List<EventVO> list = hostService.eventList(eventVO);
		System.out.println(" eventList list: "+ list);
			for(EventVO event : list) {
				//사진 (0번 메인 1번 배너)
				eventVO.setEidx(event.getEidx());
				List<ImageVO> imageList = hostService.eventImageList(eventVO);
				event.setImage(imageList.get(0).getRealFileName());
				event.setBanner(imageList.get(1).getRealFileName());
				
				if(event.getSemiTitle().length() >19) {
					String semi = event.getSemiTitle().substring(0,19);
					event.setSemiTitle(semi);
				}
			}
		
		model.addAttribute("list",list);
		
		
		return "host/eventList";
	}
	
	
	//이벤트 리스트 
	@RequestMapping(value="/startList.do", method= RequestMethod.GET)
	public String startList(Model model, EventVO eventVO) {
		
		List<EventVO> list = hostService.eventList(eventVO);
		System.out.println("startlist: "+list);
		System.out.println("startlist: "+list.size());

		for(EventVO event : list) {
			
			if(event == null) {
				break;
			}else {
				eventVO.setEidx(event.getEidx());
				List<ImageVO> imageList = hostService.eventImageList(eventVO);
				event.setImage(imageList.get(0).getRealFileName());
				
				if(event.getSemiTitle().length() >19) {
					String semi = event.getSemiTitle().substring(0,19);
					event.setSemiTitle(semi);
				}
			}
			
		}
		
		
		model.addAttribute("list",list);
		
		return "host/ajax/startList";
	}
	
	
	@RequestMapping(value="/eventView.do", method= RequestMethod.GET)
	public String eventView(Model model, EventVO eventVO) {
		EventVO event = hostService.eventOne(eventVO);
		eventVO.setEidx(event.getEidx());
		List<ImageVO> image = hostService.eventImageList(eventVO);
		event.setImage(image.get(0).getRealFileName());
		event.setBanner(image.get(1).getRealFileName());
		
		model.addAttribute("e",event);
		return "host/eventView";
	}
	
	@RequestMapping(value="/notice_dev.do", method= RequestMethod.GET)
	public String notice_dev(Model model, SearchVO searchVO, NoticeVO noticeVO) {
		
		//페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(10);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(10);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		//리스트 몇개씩 나눠야할지 계산
		int total = hostService.cntNotice(searchVO);
		searchVO.calPaging(total);		
		System.out.println("total: "+total);
		
		System.out.println("검색 안할때 타입  : "+searchVO.getSearchType());
		System.out.println("검색 안할때 키워드 : "+searchVO.getSearchValue());
		
		//리스트
		List<NoticeVO> list = hostService.selectNoticeAll(searchVO);
		//일자 자르기 
		for(NoticeVO n: list) {
			String d = n.getDate().substring(0,10);
			n.setDate(d);
		}
		
		
		model.addAttribute("list",list);
		model.addAttribute("pagination", searchVO);
		

			return "host/notice_dev";

	}
	
	//RequestBody 는 body안에 있는 걸 찾는데 get은 헤더로 옴
	@RequestMapping(value="noticeSearch.do", method= RequestMethod.GET )
	public String notice_dev(Model model, SearchVO searchVO) {
		System.out.println("진입");
		//페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(10);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(10);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		//리스트 몇개씩 나눠야할지 계산
		int total = hostService.cntNotice(searchVO);
		searchVO.calPaging(total);		
		System.out.println("total: "+total);
		
		System.out.println("검색 타입 : "+searchVO.getSearchType());
		System.out.println("검색 키워드 : "+searchVO.getSearchValue());
		//리스트
		List<NoticeVO> list = hostService.selectNoticeAll(searchVO);
		//일자 자르기 
		for(NoticeVO n: list) {
			String d = n.getDate().substring(0,10);
			n.setDate(d);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("pagination", searchVO);
		
		
	return "host/ajax/noticeSearch";
	}
	
	
	@RequestMapping(value="/noticeView.do", method= RequestMethod.GET)
	public String noticeView(NoticeVO noticeVO, Model model, HttpServletRequest request, HttpServletResponse response, SearchVO searchVO) {
		System.out.println("공지");
		//조회수 중복방지
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
		   
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	        	//postView라는 이름의 쿠키가 있는지 검사 (oldCookie = postView fh 만들기 )
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }
	    
	    //index 값을 아이디로 사용
	    int id = noticeVO.getNidx(); 
	   
	    if (oldCookie != null) {
	    	//postView가 현재 게시글의 id를 가지고 있는지 검사. 없음면 if문 탑승
	    	//Ex)101과 10번의 경우 특문이 없으면 동일하게 인식할 수있으므로 특수문자 넣어주기 
	        if (!oldCookie.getValue().contains("[" + id + "]")) {
	           //조회수 올리기 
	        	mainService.hitPlus(id);
	        	
	            oldCookie.setValue(oldCookie.getValue() + "_[" + id + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24); //24시간 유지
	            response.addCookie(oldCookie);
	        }
	    //기존 쿠키가 없을 경우 
	    } else {
	    	//조회수 올리기 
	    	mainService.hitPlus(id);
	        Cookie newCookie = new Cookie("postView","[" + id + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		
		
		//공지 하나
		NoticeVO notice = hostService.noticeOne(noticeVO);
		notice.setRnum(noticeVO.getRnum());
		
		
		model.addAttribute("notice",notice);
		//이전글 다음글(nidx)
		model.addAttribute("PN",hostService.prevNextNidx(noticeVO));
		//이전글 다음글 (제목)
		model.addAttribute("PNT",hostService.prevNextTitle(noticeVO));
		//검색어 유지
		model.addAttribute("pagination",searchVO);
		
		return "host/noticeView";
	}
	

	@RequestMapping(value="/noticeDelete.do", method= RequestMethod.GET)
	public String noticeDelete(NoticeVO noticeVO) {
		System.out.println("nidx: "+noticeVO.getNidx());
		hostService.deleteNotice(noticeVO);
		//redirect:/ 경로에 띄어쓰기 있으면 안됨
		return "redirect:/host/notice_dev.do";
	}
	
	@RequestMapping(value = "/noticeModify.do", method = RequestMethod.GET)
	public String noticeModify(Model model, NoticeVO noticeVO) {
		
		NoticeVO notice = hostService.noticeOne(noticeVO);
		model.addAttribute("vo", notice);
		
		return "main/noticeModify";
	}
	
	@RequestMapping(value = "noticeModify.do", method = RequestMethod.POST)
	public void noticeModify(NoticeVO vo,HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		session = request.getSession();
		//파일 업로드시 파일명에 날짜 시간 넣기
	
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time = dateFormat.format(cal.getTime());
		
		UserVO login = (UserVO) session.getAttribute("login");
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		File dir = new File(path);
		vo.setUidx(login.getUidx());
		vo.setFileName(vo.getFile().getOriginalFilename());
		
		System.out.println("제목 :"+vo.getTitle());
		System.out.println("내용 :"+vo.getContent());
		System.out.println("파일 이름 :"+vo.getFileName());
		System.out.println("nidx : " +vo.getNidx());
		
		int result = mainService.noticeModify(vo);
		System.out.println("result = "+ result);
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(!vo.getFile().getOriginalFilename().isEmpty()) {
			vo.getFile().transferTo(new File(path,time+"+"+vo.getFile().getOriginalFilename())); 
		
			if(result <= 0) {
			pw.append("<script>alert('수정에 실패하였습니다.');location.href = 'noticeView.do?nidx="+vo.getNidx()+"'</script>");
			pw.flush();
			
			} else {
			pw.append("<script>alert('수정에 성공하였습니다.');location.href = 'noticeView.do?nidx="+vo.getNidx()+"'</script>"); 
			pw.flush();
			}
		
		}else {
			if(result <= 0) {
				pw.append("<script>alert('수정에 실패하였습니다.');location.href = 'noticeView.do?nidx="+vo.getNidx()+"'</script>");
				pw.flush();
				
			} else {
				pw.append("<script>alert('수정에 성공하였습니다.');location.href = 'noticeView.do?nidx="+vo.getNidx()+"'</script>"); 
				pw.flush();
				}
		}
	
	}
	
	//예약거절
	@RequestMapping(value="/reportReject.do", method=RequestMethod.GET)
	public String reportReject(BookVO bookVO) {
		/* hostService.insertReject(bookVO); */
		hostService.reject(bookVO);
		return "redirect:/host/managePlace.do";
	}


	
	//08.11 김영민: 장소등록 수정
	@RequestMapping(value="/placeModfy.do", method=RequestMethod.GET)
	public String placeModfy(PlaceVO placeVO, Model model) {
		placeVO = placeService.placeOne(placeVO);
		placeVO.setPlaceDetail(placeVO.getPlaceDetail().replace("'", "\""));
		placeVO.setGuide(placeVO.getGuide().replace("\"", "'"));
		model.addAttribute("place", placeVO );
		return "host/placeModify";
	}
	
	@RequestMapping(value="/placeModfy.do", method=RequestMethod.POST)
	public String placeModfy(PlaceVO placeVO, HttpServletRequest request) throws IllegalStateException, IOException {
		String availTimeValue= "";
		
		for(String time:placeVO.getAvailTime()) {
			if(time.equals("24hours")) {
				System.out.println("24시간 운영");
				placeVO.setAvailTimeValue(time);
			
			}else {
				availTimeValue += time;
				placeVO.setAvailTimeValue(availTimeValue);
			}
		}
		
		int result = hostService.placeModify(placeVO);
		if(result ==1) {
			imageService.editPlaceImage(request, placeVO);
		}
		return "redirect:/host/managePlace.do";
	}
	
	
	@RequestMapping(value="/deletePlace.do")
	public String deletePlace(PlaceVO placeVO) {
		placeService.deletePlace(placeVO);
		return "redirect:/host/managePlace.do";
	}
	
	//장소 상세보기
	@RequestMapping(value="/view.do")
	public String placeView(PlaceVO placeVO, Model model) {
		//08.18 김연희: 평균 별점 추가
		PlaceVO p = placeService.placeOne(placeVO);
		p.setCntHeart(placeService.countHeart(placeVO));
		int avgRate = reviewService.avgRevew(p);
		p.setAvgRate(avgRate);
		
		model.addAttribute("imageList", placeService.selectImage(placeVO));
		model.addAttribute("placeOne", p);
		
		return "host/placeView";
	}
	
	
	@RequestMapping(value="/income.do", method= RequestMethod.GET)
	public String income(SearchVO searchVO, HttpSession session, Model model) {
		searchService.setPageCntPerPage(searchVO, 10);
		UserVO login = (UserVO) session.getAttribute("login");
		int total = bookService.cntBook(login.getUidx());
		searchVO.calPaging(total);
		model.addAttribute("pagination", searchVO);
		
		HashMap<String,Integer> hashMap = new HashMap<String,Integer>();
		hashMap.put("uidx", login.getUidx());
		hashMap.put("cntPerPage", searchVO.getCntPerPage());
		hashMap.put("start", searchVO.getStart());
		List<BookVO> bookList = bookService.selectBookByHost(hashMap);
		model.addAttribute("bookList", bookList);	
		
		IncomeVO incomeVO = bookService.selectIncomeForOne(login);
		model.addAttribute("incomeVO", incomeVO);
		return "host/income";
	}
	
	@RequestMapping(value="/income.do", method= RequestMethod.POST)
	public String income(Model model) {
		
		return "host/income";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
