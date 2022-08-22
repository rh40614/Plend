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
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(Model model, int uidx) {
		
		UserVO vo = mypageService.userInfo(uidx);
		model.addAttribute("vo", vo);
		
		return "myPage/myInfo";
	}
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.POST)
	public String myInfo(int uidx,UserVO vo, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
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
	
	@RequestMapping(value = "/bookStatus.do", method = RequestMethod.GET)
	public String bookstatus(UserVO vo, Model model, SearchVO sv, HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");

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
		
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		int uidx = login.getUidx();
		int start = sv.getStart();
		int end = sv.getCntPerPage();  
		param.put("uidx", uidx);
		param.put("start", start);
		param.put("end", end);
		
		List<BookVO> list = mypageService.BookList(vo);
		model.addAttribute("list", list);
		model.addAttribute("list2", mypageService.BookedList(param));
		
		return "myPage/bookStatus";
	}
	
	@RequestMapping(value = "/bookDetail.do", method = RequestMethod.GET)
	public String bookDetail(int bidx,BookVO vo, Model model) {
		
		BookVO bv = mypageService.bookOne(vo);
		model.addAttribute("bv", bv);
		
		return "myPage/bookDetail";
	}
	
	@RequestMapping(value = "/bookDel.do", method = RequestMethod.GET)
	public String bookDel(int bidx, BookVO vo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
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
	
	@RequestMapping(value = "/withdraw.do", method = RequestMethod.GET)
	public String withdraw() {
		
		return "myPage/withdraw";
	}
	@RequestMapping(value = "/withdraw.do", method = RequestMethod.POST, produces="application/json;charset=utf8")
	@ResponseBody
	public int withdraw(@RequestParam String password,@RequestParam int uidx , HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {

		System.out.println("password = " + password);
		System.out.println("uidx = " + uidx);
		session = request.getSession();
		UserVO login = new UserVO();
		login = (UserVO)session.getAttribute("login");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO encPwd = mypageService.inquirePwd(uidx);
		//String sessionPwd = login.getPassword();
		
		System.out.println("encPwd.getPassword() =" +encPwd.getPassword());
		if(encoder.matches(password, encPwd.getPassword())) {
			
			return mypageService.checkUser(uidx);
		} else {
			return 0;
		}
	}
	@RequestMapping(value = "/withdraw2.do", method = RequestMethod.POST, produces="application/json;charset=utf8")
	@ResponseBody
	public int withdraw2(@RequestParam int uidx, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		System.out.println("uidx2 =" + uidx);
		
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
	
	@RequestMapping(value = "/heartList.do", method = RequestMethod.GET)
	public String heartList(Model model,SearchVO sv,HttpSession session, HttpServletRequest request) {
		/*
		 * uidx를 매개변수로 받아올 경우 페이징에서 uidx가 null이 들어갈 수 있다.
		 * 그르므로 session에 담겨 있는 uidx를 가져와 HashMap에 담아주면 오류가 나지 않는다.
		 */
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
		System.out.println("페이징 시작 = "+sv.getStartPage());
		System.out.println("페이징 마지막 = "+sv.getEndPage());
		System.out.println("총 찜 갯수 = "+total);
		model.addAttribute("pagenation", sv); 
		
		
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		int start = sv.getStart();
		int end = sv.getCntPerPage();
		param.put("uidx", uidx);
		param.put("start", start);
		param.put("end", end);
		
		System.out.println("찜 목록 uidx = " + uidx);
		List<PlaceVO> placeList = mypageService.selectPlace(param);
		for(int i=0; i<placeList.size();i++) {
			/*
			 * 기존에 있던 vo자리에 값을 넣는 것이므로 향상된 for문을 사용하지 않고 일반 for문을 사용한다.
			 * 향상된 for문을 사용하게 되면 java.util.concurrentmodificationexception 오류가 발생한다.
			 */
			PlaceVO vo = placeList.get(i);
			ImageVO image = mypageService.selectImg(vo);
			String file = image.getOriginFileName();
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
			
			//사진이 저장될 경로
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/reviewImg");
					
			System.out.println(path);
			File dir = new File(path);
			if(!dir.exists()) {	//위치가 존재하는지 확인
				 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
			}
					
			for(MultipartFile files : reviewVO.getReviewImgs()) {
						
				if(!files.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
					//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
					files.transferTo(new File(path, files.getOriginalFilename()));	//error는 throw	
					
					//originName(사용자가 저장한 이름) 가지고 오기
					String originFileName = files.getOriginalFilename();
					
					//확장자 추출(이후 호출 할때 확장자가 두번 붙어버림) 
					String extention = originFileName.substring(originFileName.lastIndexOf("."));
					//확장자를 제거한 파일 이름
					String origin = originFileName.replace(extention, "");
					
					Date now =new Date();
					SimpleDateFormat simple = new SimpleDateFormat("SSS");
					String distinct = simple.format(now);
					
					//서버에 저장될 이름(사진이름SSS.확장자)
					String realFileName = origin + distinct+ extention ;
					System.out.println("realFileName: "+realFileName);
					
					ImageVO imageVO = new ImageVO();
					
					imageVO.setRvidx(reviewVO.getRvidx());
					imageVO.setPath(path);
					imageVO.setOriginFileName(originFileName);
					imageVO.setRealFileName(realFileName);
					
					reviewService.insertReviewImg(imageVO);
				}
			}
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
