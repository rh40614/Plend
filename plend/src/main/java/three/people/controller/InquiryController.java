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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		//inquiryVO.setUidx(login.getUidx()); 
		
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
		List<HashMap<String, Integer>> list = hostService.selectInquiry(page);
		
		model.addAttribute("pagination", searchVO);
		model.addAttribute("list",list);
		
		
		return "host/inquiry_dev/inquiry_dev";
	}
	
	@RequestMapping(value="/inquiry_dev.do", method= RequestMethod.POST)
	public String inquiry_dev(InquiryVO inquiryVO, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("운영자에게 문의등록");
		
		//세션 형성해서 login정보 가지고 오기
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		//세션에있는 회원의 uidx vo에 담기 
		inquiryVO.setUidx(login.getUidx()); 
		
		//문의 등록
		int result = hostService.insertInquiry_dev(inquiryVO);
		
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
		
		
		
		//이전 문의 내역 불러오기(리스트)
		List<HashMap<String, Integer>> list = hostService.selectInquiry(page);
		
		//문의 내역 (단건)
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		System.out.println("inquiry_View: "+inquiry);

		
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
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		
		model.addAttribute("inquiry",inquiry);

		return "host/inquiry_dev/inquiryView";
	}
	
}
