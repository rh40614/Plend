package three.people.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.service.ReviewService;
import three.people.vo.ReviewVO;

@RequestMapping(value="/review")
@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String detail(ReviewVO reviewVO, Model model) {
		
		model.addAttribute("imgs", reviewService.reviewImg(reviewVO));
		model.addAttribute("review", reviewService.reviewOne(reviewVO));
		
		return "review/detail";
	}
}
