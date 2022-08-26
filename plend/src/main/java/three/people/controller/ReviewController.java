package three.people.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.ImageServiceImpl;
import three.people.service.PlaceService;
import three.people.service.ReviewService;
import three.people.vo.ImageVO;
import three.people.vo.ReportVO;
import three.people.vo.ReviewVO;
import three.people.vo.UserVO;

@RequestMapping(value="/review")
@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	@Autowired
	PlaceService placeService;
	@Autowired
	ImageServiceImpl imageService; 
	
	//리뷰 상세보기 페이지
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String detail(ReviewVO reviewVO, Model model) {
		
		reviewVO = reviewService.reviewOne(reviewVO);
		
		model.addAttribute("imgs", reviewService.reviewImg(reviewVO));
		model.addAttribute("review", reviewVO);
		model.addAttribute("placeOne", placeService.placeOne(reviewVO));
		
		return "review/detail";
	}
	
	// 리뷰수정
	@Transactional
	@RequestMapping(value="/reviewModify.do", method=RequestMethod.POST)
	public String reviewModify(ReviewVO reviewVO, HttpServletRequest request) throws IllegalStateException, IOException {
		int result = reviewService.reviewModify(reviewVO);
		if(result == 1) {
			imageService.editReviewImage(reviewVO, request);
		}
		
		return "redirect:/review/detail.do?rvidx="+reviewVO.getRvidx();
	}
	
	//리뷰삭제
	@RequestMapping(value="/reviewDelete.do", method=RequestMethod.GET)
	public String reviewDelete(ReviewVO reviewVO, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		reviewService.reviewDelete(reviewVO);
		
		return "redirect:/myPage/myReviewList.do?uidx="+login.getUidx();
	}
	
	// 08.09 김영민: 리뷰신고
	@ResponseBody
	@RequestMapping(value="/reportUser.do", method=RequestMethod.POST)
	public int reportUser(ReportVO reportVO, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		reportVO.setReporter_uidx(login.getUidx());
		
		int result = reviewService.insertReviewReport(reportVO);
		
		return result;
	}

	
	
	
}
