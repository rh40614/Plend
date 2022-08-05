package three.people.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.vo.ReviewVO;

@RequestMapping(value="/review")
@Controller
public class ReviewController {
	
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String detail(ReviewVO reviewVO) {
		
		return "review/detail";
	}
}
