package three.people.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import three.people.service.HostService;
import three.people.vo.InquiryVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@RequestMapping(value="/inquiry_dev")
@Controller
public class InquiryController {
// 2022.07.22 김연희 HostController에서 분리
	@Autowired
	HostService hostService;
	
	
	

	@RequestMapping(value="/inquiry_FAQ.do", method= RequestMethod.GET)
	public String inquiry_FAQ() {
		return "host/inquiry_dev/inquiry_FAQ";
	}
	
	
	@RequestMapping(value="/inquiry_dev.do", method= RequestMethod.GET)
	public String inquiry_dev(InquiryVO inquiryVO, Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
		
	
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		inquiryVO.setUidx(login.getUidx()); 
		
		//페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(5);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(5);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		//토탈 갯수
		int total = hostService.cntIqidx(inquiryVO);
		searchVO.calPaging(total);
		
		//페이지 갯수가지고가기
		HashMap<String, Integer> page = new HashMap<>();
		
		int start = searchVO.getStart();
		int cntPerPage = searchVO.getCntPerPage();
		int uidx = login.getUidx();
		
		page.put("start", start);
		page.put("cntPerPage", cntPerPage);
		page.put("uidx", uidx );
		
		//이전 문의 내역 불러오기
		List<InquiryVO> list = hostService.selectInquiry(page);
		
		model.addAttribute("pagination", searchVO);
		model.addAttribute("list",list);
		
		
		return "host/inquiry_dev/inquiry_dev";
	}
	
	
	@RequestMapping(value="/inquiry_dev.do", method= RequestMethod.POST)
	public String inquiry_dev(InquiryVO inquiryVO, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("운영자에게 문의등록");
		System.out.println("category: "+inquiryVO.getCategory());
		
		//세션 형성해서 login정보 가지고 오기
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		//세션에있는 회원의 uidx vo에 담기 
		inquiryVO.setUidx(login.getUidx()); 
		
		//문의 등록
		int result = hostService.insertInquiry_dev(inquiryVO);
		//문의 사진등록
		
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		
			if(result == 1) { 
				System.out.println("운영자에게 문의 등록 성공");
				pw.append("<script>alert('문의가 정상적으로 등록이 되었습니다.');location.href = 'inquiry_dev.do'</script>");
				pw.flush();
				
			} else {
				System.out.println("운영자에게 문의 등록 실패");
				pw.append("<script>alert('문의가 등록되지않았습니다. 다시 시도해주시길 바랍니다.');location.href = 'inquiry_dev.do'</script>");
				pw.flush();
				
			}
		
		
		return "host/inquiry_dev/inquiryView_dev";
	
	}
	
	
	
	@RequestMapping(value="/inquiryView_dev.do", method= RequestMethod.GET)
	public String inquiryView_dev(InquiryVO inquiryVO, Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
		
		//로그인 정보 
//		session = request.getSession();
//		UserVO login = (UserVO)session.getAttribute("login");
//		inquiryVO.setUidx(login.getUidx()); 
		
		
		//페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(5);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(5);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		//토탈 갯수
		int total = hostService.cntIqidx(inquiryVO);
		searchVO.calPaging(total);
		
		//페이지 갯수가지고가기
		HashMap<String, Integer> page = new HashMap<>();
		
		int start = searchVO.getStart();
		int cntPerPage = searchVO.getCntPerPage();
//		int uidx = login.getUidx();
		
		page.put("start", start);
		page.put("cntPerPage", cntPerPage);
//		page.put("uidx", uidx );
		page.put("uidx", inquiryVO.getUidx());
		
		
		
		//이전 문의 내역 불러오기(리스트)
		List<InquiryVO> list = hostService.selectInquiry(page);
		System.out.println("list: "+list);
		//문의 내역 (단건)
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		System.out.println("inquiry_View: "+inquiry);

		//답변이 달린글이 있다면 답변 가지고 오기 
			 if(inquiry.getAnswerYN().equals("Y")) {
				 
				 InquiryVO answer = hostService.selectReplyOne(inquiry);
				 System.out.println("answer: "+answer.getIqidx());
				 model.addAttribute("answer",answer);
			 }
		
		model.addAttribute("list",list);
		model.addAttribute("inquiry",inquiry);
		model.addAttribute("pagination", searchVO);
		

		
		return "host/inquiry_dev/inquiryView_dev";
	}
	
	
	
	//수정화면 부분 JSP
	@RequestMapping(value="/inquiryEdit_dev.do", method=RequestMethod.GET)
	public String inquiryEdit_dev(InquiryVO inquiryVO, Model model, HttpServletRequest request, HttpSession session) {
		
		//수정하려고하는 사람 udix
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		inquiryVO.setUidx(login.getUidx()); 
		
		//문의 내역 (단건)
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		
		model.addAttribute("inquiry",inquiry);

		return "host/inquiry_dev/inquiryEdit_dev";
	}
	
	
	//수정저장
	//url 요청 결과로 return값을 줄때는 응답데이터 이므로 responseBody. ajax가 요청하면서 넘긴 파라미터는(데이터는) RequestBody
	@RequestMapping(value="/inquiryEdit_dev.do", method=RequestMethod.POST)
	public String inquiryEdit(InquiryVO inquiryVO, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("iqidx: "+ inquiryVO.getIqidx());
		System.out.println("content: "+ inquiryVO.getContent());
		
		//세션 형성해서 login정보 가지고 오기
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		inquiryVO.setUidx(login.getUidx()); 
		
		System.out.println("iqidx 등록할때: "+inquiryVO.getIqidx());
		
		//문의수정
		int result = hostService.inquiryEdit_dev(inquiryVO);
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		
		model.addAttribute("inquiry",inquiry);
		System.out.println("result: "+result);
		
		return "host/inquiry_dev/inquiryView";

	}
	
	
	
	//수정 완료 후 이동
	@RequestMapping(value="/inquiryView.do", method=RequestMethod.GET)
	public String inquiryView(InquiryVO inquiryVO, Model model, HttpServletRequest request, HttpSession session) {
		
		System.out.println("바뀌는 화면 : "+inquiryVO.getIqidx());
		//수정하려고하는 사람 udix
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		inquiryVO.setUidx(login.getUidx()); 
		
		//문의 내역 (단건)
		//완료 후 단건 출력
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		
		model.addAttribute("inquiry", inquiry);
		
		return "host/inquiry_dev/inquiryView";

	}
	
	
	

	//문의 사항 답변 작성 JSP 칸 열기
	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	public String reply(InquiryVO inquiryVO, HttpSession session, HttpServletRequest request, Model model) {
		
		//혹시나해서 첨부 //답변을 작성하려는 사람의 uidx
//		session = request.getSession();
//		UserVO login = (UserVO)session.getAttribute("login");
//		inquiryVO.setUidx(login.getUidx()); 
		
		System.out.println("답변 작성칸");
		//답변을 달 문의 사항에 대한 정보 
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		model.addAttribute("inquiry",inquiry);
		model.addAttribute("reply", hostService.selectReplyOne(inquiryVO));
		return "host/inquiry_dev/reply";
	
	}
	
	
	
	//답변 저장
	@Transactional
	@RequestMapping(value="/reply.do", method=RequestMethod.POST)
	public String reply(@RequestBody String reply, InquiryVO inquiryVO, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("답변 저장하기");
		
		//답변을 작성하려는 사람의 uidx
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		inquiryVO.setUidx(login.getUidx()); 
		
		
		int result1= hostService.updateAnswerYN(inquiryVO);
		//답변 달기//reply데이터에 원글의 iqidx 포함되어있음. reply의 데이터가 inquiryVO로 들어감
		int result2= hostService.reply(inquiryVO);
			
			if(result2 == 1 && result1 == 1) {
			System.out.println("답변 저장");
			//저장 이후 내용 출력 
			System.out.println("답변의 iqidx: "+ inquiryVO.getIqidx());
			InquiryVO answer = hostService.selectReplyOne(inquiryVO);
			
			model.addAttribute("answer",answer);
			
			}else {
				System.out.println("답변 달기 실패");
				
			}
			
		
	
		return "host/inquiry_dev/replyAnswer";
	
	}
	
	//답변 수정
	@Transactional
	@RequestMapping(value="/replyModify.do", method=RequestMethod.POST)
	@ResponseBody
	public int replyModify(@RequestBody String reply, InquiryVO inquiryVO, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("답변 저장하기");
		
		//답변을 작성하려는 사람의 uidx
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		inquiryVO.setUidx(login.getUidx()); 
		
		System.out.println("iqidx: "+inquiryVO.getIqidx());
		
		
		model.addAttribute("answer", hostService.replyModify(inquiryVO));
		return 1;
		
	}
	
	// 문의 답변 달기 전 상세보기
	@RequestMapping(value="/inquiryViewOne.do", method=RequestMethod.GET)
	public String inquiryViewOne(InquiryVO inquiryVO, Model model) {
		//문의 내역 (단건)
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		
		model.addAttribute("inquiry", inquiry);
		
		return "host/inquiry_dev/inquiryView";

	}
	
	
	@RequestMapping(value="/inquiryPaging.do")
	public String inquiryPaging(InquiryVO inquiryVO, Model model, SearchVO searchVO, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		inquiryVO.setUidx(login.getUidx()); 
		
		//페이징
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(5);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(5);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		//토탈 갯수
		int total = hostService.cntIqidx(inquiryVO);
		searchVO.calPaging(total);
		
		//페이지 갯수가지고가기
		HashMap<String, Integer> page = new HashMap<>();
		
		int start = searchVO.getStart();
		int cntPerPage = searchVO.getCntPerPage();
		int uidx = login.getUidx();
		
		page.put("start", start);
		page.put("cntPerPage", cntPerPage);
		page.put("uidx", uidx );
		
		//이전 문의 내역 불러오기
		List<InquiryVO> list = hostService.selectInquiry(page);
		
		model.addAttribute("pagination", searchVO);
		model.addAttribute("list",list);
		
		
		return "host/ajax/inquiry_dev";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
