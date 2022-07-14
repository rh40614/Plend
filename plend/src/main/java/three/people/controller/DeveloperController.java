package three.people.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.service.AdminService;
import three.people.vo.UserVO;

@RequestMapping(value="/developer")
@Controller
public class DeveloperController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/userList.do", method = RequestMethod.GET)
	public String userList(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		model.addAttribute("userList", adminService.userList());
		
		return "developer/userList";
	}
	
	@RequestMapping(value="/userModify.do", method=RequestMethod.GET)
	public String userModify() {
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
