package three.people.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.service.MyPageService;

@RequestMapping(value = "/myPage")
@Controller
public class MyPageController {

	@Autowired
	MyPageService mypageService;
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo() {
		
		return "myPage/myInfo";
	}
}
