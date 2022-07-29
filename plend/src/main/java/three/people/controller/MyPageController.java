package three.people.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import three.people.service.MyPageService;
import three.people.vo.BookVO;
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
			pw.append("<script>alert('수정이 정상적으로 등록되지 못했습니다. 다시 작성해주세요.');location.href = 'bookDetail.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		} else {
			//등록이 제대로 이루어짐
			pw.append("<script>alert('수정이 완료되었습니다.');location.href = 'bookStatus.do?uidx="+uidx+"'</script>");
			
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
	public String heartList() {
		return "myPage/heartList";
	}
}
