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
import org.springframework.web.multipart.MultipartFile;

import three.people.service.PlaceService;
import three.people.service.ReviewService;
import three.people.vo.ImageVO;
import three.people.vo.ReviewVO;
import three.people.vo.UserVO;

@RequestMapping(value="/review")
@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	@Autowired
	PlaceService placeService;
	
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
			//사진이 저장될 경로
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/reviewImg");
					
			System.out.println(path);
			File dir = new File(path);
			if(!dir.exists()) {	//위치가 존재하는지 확인
				 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
			}
			if(reviewVO.getDeleteImg() != null) {
				String[] imgs = reviewVO.getDeleteImg().split("/");
				for(String img : imgs) {
					ImageVO imageVO = new ImageVO();
					imageVO.setRvidx(reviewVO.getRvidx());
					imageVO.setOriginFileName(img);
					
					reviewService.reviewImgModify(imageVO);
				}
			}
			for(MultipartFile files : reviewVO.getReviewImgs()) {
				if(!files.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
					//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
					files.transferTo(new File(path, files.getOriginalFilename()));	//error는 throw	
					
					//originName(사용자가 저장한 이름) 가지고 오기
					String originFileName = files.getOriginalFilename();
					
					//확장자 추출(이후 호출 할때 확장자가 두번 붙어버림) 
					String extention = originFileName.substring(originFileName.lastIndexOf("."));
					//확장자를 제거한 파일 이름
					String origin = originFileName.replace(extention, "");
					
					Date now =new Date();
					SimpleDateFormat simple = new SimpleDateFormat("SSS");
					String distinct = simple.format(now);
					
					//서버에 저장될 이름(사진이름SSS.확장자)
					String realFileName = origin + distinct+ extention ;
					System.out.println("realFileName: "+realFileName);
					
					ImageVO imageVO = new ImageVO();
					
					imageVO.setRvidx(reviewVO.getRvidx());
					imageVO.setPath(path);
					imageVO.setOriginFileName(originFileName);
					imageVO.setRealFileName(realFileName);
					
					reviewService.insertReviewImg(imageVO);
				}
			}
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
	
	
	
	
	
}
