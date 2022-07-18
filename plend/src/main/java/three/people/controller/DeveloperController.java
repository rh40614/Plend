package three.people.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.service.AdminService;
import three.people.service.CommonService;
import three.people.vo.EventVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

// 07.13 김영민 페이지 이동 제작
@RequestMapping(value="/developer")
@Controller
public class DeveloperController {

	@Autowired
	AdminService adminService;
	@Autowired
	CommonService commonService;
	
	// 회원 리스트로 이동
	@RequestMapping(value="/userList.do", method = RequestMethod.GET)
	public String userList(SearchVO searchvo,Model model) {
		if(searchvo.getNowPage() == 0 && searchvo.getCntPerPage() == 0) {
			searchvo.setNowPage(1);
			searchvo.setCntPerPage(10);
		}else if(searchvo.getCntPerPage() == 0) {
			searchvo.setCntPerPage(10);
		}else if(searchvo.getNowPage() == 0) {
			searchvo.setNowPage(1);
		}
		
		searchvo.setRole(2);
		int total = commonService.totalCountUser(searchvo);
		searchvo.calPaging(total);
		
		model.addAttribute("pagenation", searchvo);
		model.addAttribute("userList", adminService.userList(searchvo));
		
		return "developer/userList";
	}
	
	//회원 수정 페이지로 이동
	@RequestMapping(value="/userModify.do", method=RequestMethod.GET)
	public String userModify(UserVO uservo, Model model) {
		model.addAttribute("user", adminService.userOne(uservo));
		return "developer/userModify";
	}
	
	//회원 수정 로직 실행
	@RequestMapping(value="/userModify.do", method=RequestMethod.POST)
	public String userModify(UserVO uservo) {
		int result = adminService.userInfo(uservo);
		if(result == 1) {
			return "redirect:/developer/userList.do";
		}else {
			return "redirect:/developer/userModify.do?uidx=" + uservo.getUidx();
		}
	}
	
	@RequestMapping(value="/event.do", method=RequestMethod.GET)
	public String event() {
		return "developer/event";
	}
	
	// 이벤트 등록
	@RequestMapping(value="/event.do", method=RequestMethod.POST)
	public String event(EventVO eventvo) {
		System.out.println("category: "+eventvo.getCategory());
		System.out.println("conditions: "+eventvo.getConditions());
		System.out.println("content: "+eventvo.getContent());
		System.out.println("edate: "+eventvo.getEdate());
		System.out.println("eventimg: "+eventvo.getEventImg());
		System.out.println("semititle: "+eventvo.getSemiTitle());
		System.out.println("startEnd: "+eventvo.getStartEnd());
		System.out.println("title: "+eventvo.getTitle());
		return "redirect:/developer/event.do";
	}
	@RequestMapping(value="reportList.do", method=RequestMethod.GET)
	public String reportList() {
		return "developer/reportList";
	}
	
	//업체 리스트 페이지로 이동
	@RequestMapping(value="enterList.do", method=RequestMethod.GET)
	public String enterList(SearchVO searchvo, Model model) {
		if(searchvo.getNowPage() == 0 && searchvo.getCntPerPage() == 0) {
			searchvo.setNowPage(1);
			searchvo.setCntPerPage(10);
		}else if(searchvo.getCntPerPage() == 0) {
			searchvo.setCntPerPage(10);
		}else if(searchvo.getNowPage() == 0) {
			searchvo.setNowPage(1);
		}
		
		searchvo.setRole(3);
		int total = commonService.totalCountUser(searchvo);
		searchvo.calPaging(total);
		model.addAttribute("pagenation", searchvo);
		model.addAttribute("enterList", adminService.userList(searchvo));
		
		return "developer/enterList";
	}
	
	//업체 수정페이지로 이동
	//해당 업체 데이터도 넘겨주기
	@RequestMapping(value="enterModify.do", method=RequestMethod.GET)
	public String enterModify(UserVO uservo, Model model) {
		model.addAttribute("enter", adminService.userOne(uservo));
		model.addAttribute("placeList", adminService.enterPlace(uservo));
		return "developer/enterModify";
	}
	//업체정보 수정하기
	@RequestMapping(value="enterModify.do", method=RequestMethod.POST)
	public String enterModify(UserVO uservo) {
		adminService.userInfo(uservo);
		return "redirect:/developer/enterList.do";
	}
	
	@RequestMapping(value="enterDelete.do", method=RequestMethod.GET)
	public String deleteEnter(UserVO uservo) {
		adminService.deleteEnter(uservo);
		return "redirect:/developer/enterList.do";
	}
	
	
	//업체 장소 등록 승인 페이지
	@RequestMapping(value="enterConfirm.do", method=RequestMethod.GET)
	public String enterConfirm(SearchVO searchvo, Model model) {
		if(searchvo.getNowPage() == 0 && searchvo.getCntPerPage() == 0) {
			searchvo.setNowPage(1);
			searchvo.setCntPerPage(10);
		}else if(searchvo.getCntPerPage() == 0) {
			searchvo.setCntPerPage(10);
		}else if(searchvo.getNowPage() == 0) {
			searchvo.setNowPage(1);
		}
		
		int total = adminService.totalPlace(searchvo);
		searchvo.calPaging(total);
		model.addAttribute("pagenation", searchvo);
		model.addAttribute("placeList", adminService.apPlace(searchvo));
		return "developer/enterConfirm";
	}
	
	@RequestMapping(value="confirm.do", method=RequestMethod.GET)
	public String confirm(PlaceVO placevo) {
		adminService.approvalYN(placevo);
		return "redirect:/developer/enterConfirm.do";
	}
	
	@RequestMapping(value="enterBlock.do", method=RequestMethod.GET)
	public String enterBlock() {
		return "developer/enterBlock";
	}
	
}
