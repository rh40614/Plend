package three.people.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.util.StringUtils;

import three.people.service.MainService;
import three.people.vo.FaqVO;
import three.people.vo.NoticeVO;
import three.people.vo.PagingVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@RequestMapping(value = "/main")
@Controller
public class MainController {
	
	@Autowired
	MainService mainService;

	//김하진 공지사항
	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public String notice(Model model, NoticeVO vo, SearchVO sv) {
		//페이징 처리 
		//한번에 10개씩 보여줌
		if(sv.getNowPage() == 0 && sv.getCntPerPage() == 0) {
			sv.setNowPage(1);
			sv.setCntPerPage(10);
		} else if (sv.getCntPerPage() == 0) {
			sv.setCntPerPage(10);
		} else if (sv.getNowPage() == 0) {
			sv.setNowPage(1);
		}
		
		int total = mainService.noticeTotal(sv);
		sv.calPaging(total);
		model.addAttribute("pagenation", sv);
		
		
	//	List<NoticeVO> list = mainService.noticeAll(vo);
		model.addAttribute("list", mainService.noticeAll(sv));
		return "main/notice";
	}
	
	@RequestMapping(value = "noticeReg.do", method = RequestMethod.GET)
	public String noticeReg() {
		
		return "main/noticeReg";
	}
	//김하진 공지사항 등록
	@RequestMapping(value = "noticeReg.do", method = RequestMethod.POST)
	public String noticeReg(NoticeVO vo,HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IllegalStateException,IOException {
		
		session = request.getSession();
			//파일 업로드시 파일명에 날짜 시간 넣기
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time = dateFormat.format(cal.getTime());
		
		UserVO login = (UserVO) session.getAttribute("login");
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		//파일 업로드
		File dir = new File(path);
		vo.setUidx(login.getUidx());
		vo.setFileName(vo.getFile().getOriginalFilename());
		int result = mainService.insertNotice(vo);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//업로드할 파일이 있을 때
		if(!vo.getFile().getOriginalFilename().isEmpty()) {
			vo.getFile().transferTo(new File(path,time+"+"+vo.getFile().getOriginalFilename())); 
		if(result <= 0) {
			//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�吏� �븡�쓬
			pw.append("<script>alert('작성하신 글이 등록에 실패하였습니다.');location.href = 'notice.do'</script>");
			
			pw.flush();
			
		} else {
			//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�
			pw.append("<script>alert('작성하신 글이 정상적으로 등록되었습니다.');location.href = 'notice.do'</script>"); //諛섑솚�맂 bidx媛� vo�뿉 �떞寃� �엳�떎.
			
			pw.flush();
			}
		
		} else //업로드할 파일이 없을 때{
			if(result <= 0) {
				//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�吏� �븡�쓬
				pw.append("<script>alert('작성하신 글이 등록에 실패하였습니다.');location.href = 'notice.do'</script>");
				
				pw.flush();
				
			} else {
				//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�
				pw.append("<script>alert('작성하신 글이 정상적으로 등록되었습니다.');location.href = 'notice.do'</script>"); //諛섑솚�맂 bidx媛� vo�뿉 �떞寃� �엳�떎.
				
				pw.flush();
				}
		
	
		return "main/notice";
	}
	
	//김하진 세부 공지사항 + 조회수 쿠키에 저장
	@RequestMapping(value = "/noticeView.do", method = RequestMethod.GET)
	public String noticeView(int nidx, Model model, HttpServletRequest request, HttpServletResponse response) {
	
	     // 저장된 쿠키 불러오기
	     Cookie cookies[] = request.getCookies();
	     Map mapCookie = new HashMap();
	    if(request.getCookies() != null){
	      for (int i = 0; i < cookies.length; i++) {
	        Cookie obj = cookies[i];
	        mapCookie.put(obj.getName(),obj.getValue());
	      }
	    }
	    
	    // 저장된 쿠키중에 hit 만 불러오기
	     String cookie_read_count = (String) mapCookie.get("hit");
	     // 저장될 새로운 쿠키값 생성
	     String new_cookie_read_count = "|" + nidx;
	     
	  // 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
	     if ( StringUtils.indexOfIgnoreCase(cookie_read_count, new_cookie_read_count) == -1 ) {
	          // 없을 경우 쿠키 생성
	          Cookie cookie = new Cookie("hit", cookie_read_count + new_cookie_read_count);
	          cookie.setMaxAge(24*60*60); // 24번*60번*60초=24시간 - 쿠키가 24시간동안만 존재
	          response.addCookie(cookie);

	          // 조회수 업데이트
	          this.mainService.hitPlus(nidx);
	     }
		NoticeVO vo = mainService.noticeOne(nidx);
		model.addAttribute("vo", vo);
		
		//이전글,다음글 제목 가져옴
		NoticeVO vo2 = mainService.prevNextTitle(nidx);
		model.addAttribute("vo2", vo2);

		//이전글,다음글 nidx 가져옴
		NoticeVO vo3 = mainService.prevNextNidx(nidx);
		model.addAttribute("vo3", vo3);
		
		return "main/noticeView";
	}
	//김하진 공지사항 삭제
	@RequestMapping(value = "/noticeDel.do")
	public String noticeDel(int nidx) {

		mainService.noticeDelete(nidx);
		return "redirect:/main/notice.do";
	}
	//김하진 공지사항 수정
	@RequestMapping(value = "/noticeModify.do", method = RequestMethod.GET)
	public String noticeModify(Model model, int nidx) {
		
		NoticeVO vo = mainService.noticeOne(nidx);
		model.addAttribute("vo", vo);
		
		return "main/noticeModify";
	}
	//김하진 공지사항 수정
	@RequestMapping(value = "noticeModify.do", method = RequestMethod.POST)
	public String noticeModify(NoticeVO vo,HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		session = request.getSession();
		//파일 업로드시 파일명에 날짜 시간 넣기
	
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time = dateFormat.format(cal.getTime());
		
		UserVO login = (UserVO) session.getAttribute("login");
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		//파일 업로드
		File dir = new File(path);
		vo.setUidx(login.getUidx());
		vo.setFileName(vo.getFile().getOriginalFilename());
		
		int result = mainService.noticeModify(vo);
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(!vo.getFile().getOriginalFilename().isEmpty()) {
			vo.getFile().transferTo(new File(path,time+"+"+vo.getFile().getOriginalFilename())); 
		if(result <= 0) {
			//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�吏� �븡�쓬
			pw.append("<script>alert('수정에 실패하였습니다.');location.href = 'notice.do'</script>");
			
			pw.flush();
			
		} else {
			//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�
			pw.append("<script>alert('수정에 성공하였습니다.');location.href = 'notice.do'</script>"); //諛섑솚�맂 bidx媛� vo�뿉 �떞寃� �엳�떎.
			
			pw.flush();
			}
		}else {
			if(result <= 0) {
				//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�吏� �븡�쓬
				pw.append("<script>alert('작성하신 글이 등록에 실패하였습니다.');location.href = 'notice.do'</script>");
				
				pw.flush();
				
			} else {
				//�벑濡앹씠 �젣��濡� �씠猷⑥뼱吏�
				pw.append("<script>alert('작성하신 글이 정상적으로 등록되었습니다.');location.href = 'notice.do'</script>"); //諛섑솚�맂 bidx媛� vo�뿉 �떞寃� �엳�떎.
				
				pw.flush();
				}
		}
		return "main/notice";
	
	}
	
	//김하진 FAQ
	@RequestMapping(value = "/faq.do")
	public String faq(Model model, FaqVO vo ,SearchVO sv) {
		
		//FAQ 카테고리와 검색어 구현
		HashMap<String, String> param = new HashMap<String,String>();
		String category = vo.getCategory();
		String searchValue = sv.getSearchValue();
		param.put("category", category);
		param.put("searchValue",searchValue);
		
		List<FaqVO> list = mainService.faqAll(param);
		
		model.addAttribute("list", list);
		return "main/faq";
	}
	
	@RequestMapping(value = "/faqList.do")
	public String faqList(Model model, FaqVO vo,SearchVO sv) {
		
		HashMap<String, String> param = new HashMap<String,String>();
		String category = vo.getCategory();
		String searchValue = sv.getSearchValue();
		param.put("category", category);
		param.put("searchValue",searchValue);
		
		List<FaqVO> list = mainService.faqAll(param);
		
		model.addAttribute("list", list);
		
		return "main/faqList";
	}
	//김하진 공지사항 등록
	@RequestMapping(value = "/faqReg.do", method = RequestMethod.GET)
	public String faqReg() {
		
		return "main/faqReg";
	}
	//김하진 공지사항 등록
	@RequestMapping(value = "/faqReg.do", method = RequestMethod.POST)
	public void faqReg(FaqVO vo, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		vo.setUidx(login.getUidx());
		
		int result = mainService.insertFaq(vo);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		
		if(result <= 0) { 
			//등록이 제대로 이루어지지 않음
			pw.append("<script>alert('작성이 정상적으로 등록되지 못했습니다. 다시 작성해주세요.');location.href = 'faqReg.do'</script>");
			
			pw.flush();
		} else {
			//등록이 제대로 이루어짐
			pw.append("<script>alert('작성이 정상적으로 등록이 되었습니다.');location.href = 'faq.do'</script>");
			
			pw.flush();
		}
	}
	//김하진 공지사항 수정
	@RequestMapping(value = "/faqModify.do", method = RequestMethod.GET)
	public String faqModify(Model model, int fidx) {
		
		FaqVO vo = mainService.faqOne(fidx);
		model.addAttribute("vo", vo);
		
		return "main/faqModify";
	}
	//김하진 공지사항 수정
	@RequestMapping(value = "/faqModify.do", method = RequestMethod.POST)
	public String faqModify(FaqVO vo,HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		session = request.getSession();
		
		int result = mainService.faqModify(vo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		if(result <= 0) { 
			//등록이 제대로 이루어지지 않음
			pw.append("<script>alert('작성이 정상적으로 등록되지 못했습니다. 다시 작성해주세요.');location.href = 'faq.do'</script>");
			
			pw.flush();
		} else {
			//등록이 제대로 이루어짐
			pw.append("<script>alert('수정이 완료되었습니다.');location.href = 'faq.do'</script>");
			
			pw.flush();
		}
		
		return "main/faq";
	}
	
}
