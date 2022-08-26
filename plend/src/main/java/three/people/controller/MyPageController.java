package three.people.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.BookService;
import three.people.service.ImageServiceImpl;
import three.people.service.MyPageService;
import three.people.service.ReviewService;
import three.people.vo.BookVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@RequestMapping(value = "/myPage")
@Controller
@Configuration
@EnableWebSecurity
public class MyPageController {

	@Autowired
	MyPageService mypageService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	BookService bookService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	ImageServiceImpl imageService; 
	
	
	//김하진 마이페이지(sns 로그인과 일반 로그인 분기 )
	@RequestMapping(value = "myPageCheck.do", method = RequestMethod.GET)
	public String myPageCheck(Model model,int uidx,HttpServletRequest request, HttpSession session) {
		
		/*
		 * sns 로그인은 비밀번호를 받아오지 않으므로 
		 * user_type을 확인한다. 
		 * 확인 후 비밀번호 확인 없이 내 정보 페이지로 이동시킨다.
		 */
		
		UserVO vo = mypageService.userInfo(uidx);
		model.addAttribute("vo", vo);
		
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
		
		if(login.getUser_type() == null) {
			return "myPage/myPageCheck";
		} else if (login.getUser_type().equals("naver") || login.getUser_type().equals("kakao")) {
			return "myPage/myInfo";
		} else {
			return "myPage/myPageCheck";
		}
		
	}
	
	//김하진 마이페이지 들어올 시 비밀번호 한번 더 입력
	@RequestMapping(value = "myPageCheck.do", method = RequestMethod.POST)
	public String myPageCheck(String password, UserVO vo, int uidx, HttpServletResponse response) throws IOException {
		
		//비밀번호 복호화 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		UserVO pwd = mypageService.myPageCheck(vo);
		
		//화면에 받아온 비밀번호화 DB에 저장된 비밀번호를 matches() 함수에 넣어 맞으면 페이지 이동
		if(encoder.matches(password, pwd.getPassword())) {
			
			pw.append("<script>location.href = 'myInfo.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		} else {
			
			pw.append("<script>alert('비밀번호가 일치하지 않습니다.');location.href = 'myPageCheck.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		}
		
		return "myPage/myInfo";
	}
	
	//김하진 내 정보
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(Model model, int uidx) {
		
		UserVO vo = mypageService.userInfo(uidx);
		model.addAttribute("vo", vo);
		
		return "myPage/myInfo";
	}
	
	//김하진 내 정보 수정
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.POST)
	public String myInfo(int uidx,UserVO vo, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		//화면에서 받아온 비밀번호를 암호화 하여 DB에 저장
		String encodedPassword = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPassword);
		int result = mypageService.userModify(vo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		if(result <= 0) { 
			//등록이 제대로 이루어지지 않음
			pw.append("<script>alert('수정이 정상적으로 등록되지 못했습니다. 다시 작성해주세요.');location.href = 'myInfo.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		} else {
			//등록이 제대로 이루어짐
			pw.append("<script>alert('수정이 완료되었습니다.');location.href = 'myInfo.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		}
		
		
		
		return "myPage/myInfo";
	}
	
	//김하진 예약 현황
	@RequestMapping(value = "/bookStatus.do", method = RequestMethod.GET)
	public String bookstatus(UserVO vo, Model model, SearchVO sv, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
		
		//페이징 처리
		if(sv.getNowPage() == 0 && sv.getCntPerPage() == 0) {
			sv.setNowPage(1);
			sv.setCntPerPage(2);
		} else if (sv.getCntPerPage() == 0) {
			sv.setCntPerPage(2);
		} else if (sv.getNowPage() == 0) {
			sv.setNowPage(1);
		}
		
		
		int total = mypageService.bookTotal(login);
		sv.calPaging(total);
		model.addAttribute("pagenation", sv);
		
		//mapper와 uidx와 페이지의 시작과 끝을 넣기 위해 hashMap을 이용
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		int uidx = login.getUidx();
		int start = sv.getStart();
		int end = sv.getCntPerPage();  
		param.put("uidx", uidx);
		param.put("start", start);
		param.put("end", end);
		
		List<BookVO> list = mypageService.BookList(login);
		model.addAttribute("list", list);
		model.addAttribute("list2", mypageService.BookedList(param));
		
		return "myPage/bookStatus";
	}
	
	//김하진 세부 예약 정보
	@RequestMapping(value = "/bookDetail.do", method = RequestMethod.GET)
	public String bookDetail(int bidx,BookVO vo, Model model) {
		
		BookVO bv = mypageService.bookOne(vo);
		model.addAttribute("bv", bv);
		
		return "myPage/bookDetail";
	}
	
	//김하진 예약 취소
	@RequestMapping(value = "/bookDel.do", method = RequestMethod.GET)
	public String bookDel(int bidx, BookVO vo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
		//session에서 uidx를 받아옴
		int uidx = login.getUidx();
		int result = mypageService.cancelBook(bidx);	
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		if(result <= 0) { 
			//등록이 제대로 이루어지지 않음
			pw.append("<script>alert('예약 취소에 실패 하였습니다. 다시 시도해주세요.');location.href = 'bookDetail.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		} else {
			//등록이 제대로 이루어짐
			pw.append("<script>alert('예약 취소가 완료되었습니다.');location.href = 'bookStatus.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		}
		
		return "myPage/bookStatus";
	}
	
	//김하진 회원탈퇴
	@RequestMapping(value = "/withdraw.do", method = RequestMethod.GET)
	public String withdraw() {
		
		return "myPage/withdraw";
	}
	
	//김하진 ajax 회원탈퇴
	@RequestMapping(value = "/withdraw.do", method = RequestMethod.POST, produces="application/json;charset=utf8")
	@ResponseBody
	public int withdraw(@RequestParam String password,@RequestParam int uidx , HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		/*
		 * 화면에서 받아온 비밀번호를 DB에 있는 비밀번호화 일치한지 검증
		 * 검증이 완료되면 정말 탈퇴 할 것인지 한번 더 물어본다. 
		 */
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO encPwd = mypageService.inquirePwd(uidx);
		//String sessionPwd = login.getPassword();
		
		
		if(encoder.matches(password, encPwd.getPassword())) {
			
			return mypageService.checkUser(uidx);
		} else {
			return 0;
		}
	}
	
	//김하진 ajax 회원탈퇴2
	@RequestMapping(value = "/withdraw2.do", method = RequestMethod.POST, produces="application/json;charset=utf8")
	@ResponseBody
	public int withdraw2(@RequestParam int uidx, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		/*
		 * 검증이 완료되고 거기서 한번 더 확인을 누르면
		 * session에 저장된 uidx를 가져와서 delyn을 Y로 변경하고 
		 * 회원 탈퇴를 마무리한다.
		 */
		
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
		int sessionUidx = login.getUidx();
		
		if (sessionUidx == uidx) {
			int result = mypageService.userWithdraw(uidx);
			session.invalidate();
			return result;
		} else {
			return 0;
		}
	}
	
	//김하진 찜 목록
	@RequestMapping(value = "/heartList.do", method = RequestMethod.GET)
	public String heartList(Model model,SearchVO sv,HttpSession session, HttpServletRequest request) {
		/*
		 * uidx를 매개변수로 받아올 경우 페이징에서 uidx가 null이 들어갈 수 있다.
		 * 그러므로 session에 담겨 있는 uidx를 가져와 HashMap에 담아주면 오류가 나지 않는다.
		 */
		//페이징
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
		int uidx = login.getUidx();
		if(sv.getNowPage() == 0 && sv.getCntPerPage() == 0) {
			sv.setNowPage(1);
			sv.setCntPerPage(8);
		} else if (sv.getCntPerPage() == 0) {
			sv.setCntPerPage(8);
		} else if (sv.getNowPage() == 0) {
			sv.setNowPage(1);
		}
		
		int total = mypageService.likeListTotal(uidx);
		sv.calPaging(total);
		model.addAttribute("pagenation", sv); 
		
		
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		int start = sv.getStart();
		int end = sv.getCntPerPage();
		param.put("uidx", uidx);
		param.put("start", start);
		param.put("end", end);
		
		List<PlaceVO> placeList = mypageService.selectPlace(param);
		for(int i=0; i<placeList.size();i++) {
			/*
			 * 기존에 있던 vo자리에 값을 넣는 것이므로 향상된 for문을 사용하지 않고 일반 for문을 사용한다.
			 * 향상된 for문을 사용하게 되면 java.util.concurrentmodificationexception 오류가 발생한다.
			 */
			PlaceVO vo = placeList.get(i);
			ImageVO image = mypageService.selectImg(vo);
			String file = image.getRealFileName();
			vo.setPlaceImg(file);
			placeList.set(i,vo);
			
		}
		model.addAttribute("list", placeList);
		
		return "myPage/heartList";
	}
	// 08.02 김영민: 리뷰등록
	@Transactional
	@RequestMapping(value="/addReview.do", method=RequestMethod.POST)
	public String addReview(ReviewVO reviewVO, HttpServletRequest request) throws IllegalStateException, IOException {
		int result = reviewService.insertReview(reviewVO);
		System.out.println("rvidx: "+reviewVO.getRvidx());
		if(result ==1) {
			System.out.println("리뷰 등록 성공");
			imageService.saveReviewImage(reviewVO, request);
		}
		return "myPage/bookStatus";
	}
	
	// 08.03 김영민: 내가 작성한 리뷰 리스트
	@RequestMapping(value="/myReviewList.do", method=RequestMethod.GET)
	public String myReviewList(UserVO uservo, SearchVO searchVO ,Model model) {
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(10);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(10);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		int total = reviewService.countMyReview(uservo);
		System.out.println("total: "+total);
		searchVO.calPaging(total);
		
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("SearchVO", searchVO);
		hashMap.put("UserVO", uservo);
		
		model.addAttribute("pagenation",searchVO);
		model.addAttribute("myReviewList", reviewService.myReview(hashMap));
		
		return "myPage/myReviewList";
	}
	
	
	//2022.08.11 김연희 : 예약취소 
	//아직 화면에 안붙임
	@RequestMapping(value="/bookCancel")
	public String bookCancel(BookVO bookVO) {
		
		bookService.bookCancel(bookVO);
		
		return "redirect:/myPage/bookStatus.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}