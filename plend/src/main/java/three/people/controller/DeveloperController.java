package three.people.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.service.AdminService;
import three.people.service.CommonService;
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
		
		int total = commonService.totalCountUser(2);
		searchvo.calPaging(total);
		
		model.addAttribute("pagenation", searchvo);
		model.addAttribute("userList", adminService.userList(searchvo));
		
		return "developer/userList";
	}
	
	@RequestMapping(value="/userModify.do", method=RequestMethod.GET)
	public String userModify(UserVO uservo, Model model) {
		model.addAttribute("user", adminService.userOne(uservo));
		return "developer/userModify";
	}
	
	@RequestMapping(value="/event.do", method=RequestMethod.GET)
	public String event() {
		return "developer/event";
	}
	
	@RequestMapping(value="reportList.do", method=RequestMethod.GET)
	public String reportList() {
		return "developer/reportList";
	}
	
	@RequestMapping(value="enterList.do", method=RequestMethod.GET)
	public String enterList() {
		return "developer/enterList";
	}
	
	@RequestMapping(value="enterModify.do", method=RequestMethod.GET)
	public String enterModify() {
		return "developer/enterModify";
	}
	
	@RequestMapping(value="enterConfirm.do", method=RequestMethod.GET)
	public String enterConfirm() {
		return "developer/enterConfirm";
	}
	
	@RequestMapping(value="enterBlock.do", method=RequestMethod.GET)
	public String enterBlock() {
		return "developer/enterBlock";
	}
	
}
