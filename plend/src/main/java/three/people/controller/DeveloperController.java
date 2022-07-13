package three.people.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/developer")
@Controller
public class DeveloperController {

	@RequestMapping(value="/userList.do", method = RequestMethod.GET)
	public String userList() {
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
