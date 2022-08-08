package three.people.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.PlaceService;
import three.people.service.ReviewService;
import three.people.vo.ImageVO;
import three.people.vo.ReviewVO;

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
		System.out.println("length: "+reviewVO.getReviewImgs().length);
		System.out.println("reviewImg: "+reviewVO.getReviewImgs().toString());
		if(result == 1 && reviewVO.getReviewImgs().length > 1 ) {
			//사진이 저장될 경로
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/reviewImg");
					
			System.out.println(path);
			File dir = new File(path);
			if(!dir.exists()) {	//위치가 존재하는지 확인
				 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
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
					
					if(reviewService.reviewImg(reviewVO).size() > 0) {
						reviewService.reviewImgModify(imageVO);
					}else {
						reviewService.insertReviewImg(imageVO);
					}
				}
			}
		}
		
		return "redirect:/review/detail.do?rvidx="+reviewVO.getRvidx();
	}
	
	
	
	
	
	
	
}
