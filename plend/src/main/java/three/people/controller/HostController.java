package three.people.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.HostService;
import three.people.service.PlaceService;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.UserVO;



@RequestMapping(value = "/host")
@Controller
public class HostController {

	@Autowired
	HostService hostService;
	
	@Autowired
	PlaceService placeService;
	
	
	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.GET )
	public String insertPlace() {  
		System.out.println("장소등록GET");
		
		return "host/insertPlace";
	}
	

	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.POST )
	public void insertPlace(PlaceVO placeVO, HttpServletRequest request, HttpServletResponse response ,HttpSession session) throws IllegalStateException, IOException {
		
		System.out.println("장소등록POST");
		
		//세션 형성해서 login정보 가지고 오기
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		//세션에있는 회원의 uidx placeVo에 담기 (UserVo 상속 중)
		placeVO.setUidx(login.getUidx()); 
		
//		System.out.println("장소등록을 하는 사람: "+ placeVO.getUidx());
//		System.out.println("주소: "+ placeVO.getAddress());
//		System.out.println("장소설명: "+ placeVO.getPlaceDetail());
//		System.out.println("금액: "+ placeVO.getPrice());
//		System.out.println("getCategory: "+ placeVO.getCategory());
//		System.out.println("getGuide: "+ placeVO.getGuide());
//		System.out.println("getIntervalTime: "+ placeVO.getIntervalTime());
//		System.out.println("getOption1: "+ placeVO.getOption1());
//		System.out.println("getOption2: "+ placeVO.getOption2());
//		System.out.println("getPlaceName: "+ placeVO.getPlaceName());

		System.out.println("tag: "+placeVO.getTag());
		
		String availTimeValue= "";
		
		for(String time:placeVO.getAvailTime()) {
			if(time.equals("24hours")) {
				System.out.println("24시간 운영");
				placeVO.setAvailTimeValue(time);
			
			}else {
				availTimeValue += time;
				//System.out.println("availTimeValue: "+availTimeValue);
				placeVO.setAvailTimeValue(availTimeValue);
			}
		}
		

		//장소 등록
		int result = hostService.insertPlace(placeVO);
		
	
		//화면응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		
		if(result ==1) {
			System.out.println("장소 등록 성공");
			
			
			System.out.println("pidx: "+placeVO.getPidx());
			
			//사진이 저장될 경로
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/placeImg");
					
			System.out.println(path);
			File dir = new File(path);
			if(!dir.exists()) {	//위치가 존재하는지 확인
				 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
			}
					
			for(MultipartFile files : placeVO.getPlaceImgs()) {
						
				if(!files.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
					//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
					files.transferTo(new File(path, files.getOriginalFilename()));	//error는 throw	
					
					//originName(사용자가 저장한 이름) 가지고 오기
					String originFileName = files.getOriginalFilename();
					
					// 파일 이름 구분자로 사용하기 위해 현재 시각의 밀리 초반환 
					Date now =new Date();
					SimpleDateFormat simple = new SimpleDateFormat("SSS");
					String distinct = simple.format(now);
					
					//서버에 저장될 이름
					String realFileName = originFileName + distinct;
					//파일이름 꺼내서 이름값으로 insert
					
					
					ImageVO imageVO = new ImageVO();
					
					imageVO.setPidx(placeVO.getPidx());
					imageVO.setPath(path);
					imageVO.setOriginFileName(originFileName);
					imageVO.setRealFileName(realFileName);
					
					 int result_img = hostService.insertPlaceImg(imageVO);
					 
					 	if(result_img == 1) {
					 		System.out.println("이미지 등록 성공");
						 
					 	}else {
					 		System.out.println("이미지 등록 실패");
					 	}
						
					}else {
					System.out.println("업로드할 파일이 존재하지 않습니다.");
					}
					
				//response를 이용해서 script를 띄우면 redirect가 먹지않기 때문에 script를 이용해서 화면을 이동시켜주어야한다. 
				pw.append("<script>alert('정상적으로 등록되었습니다.');location.href='"+request.getContextPath()+"/host/managePlace.do';</script>");
				
				}
			
			
		}else {
			System.out.println("장소등록 실패");
			
			pw.append("<script>alert('장소등록에 실패하였습니다. 다시 한번 시도해주시길 바랍니다. ');location.href='/insertPlace.do';</script>");
		}
		
		
	
		
	}

	

	
	
	@RequestMapping(value="/managePlace.do", method = RequestMethod.GET)
	public String managePlace(PlaceVO placeVO, Model model) {
		System.out.println("장소관리 페이지 ");
		
		List<PlaceVO> list_p = placeService.selectPlaceAll(placeVO);
		
		
			for(PlaceVO place: list_p) {
				if(place.getPlaceDetail().length() > 35) {
					String pd =place.getPlaceDetail().substring(0, 35);
					place.setPlaceDetail(pd);
				}
			}
		
		model.addAttribute("list_p", list_p);
		
		return "host/managePlace";
	}
	
	
	
	@RequestMapping(value="/inquiry_user.do", method= RequestMethod.GET)
	public String userInquiry() {
		System.out.println("이용자 문의 사항 관리 페이지");
		return "host/inquiry_user";
	}
	
	
	@RequestMapping(value="/promotionList.do", method= RequestMethod.GET)
	public String promotionList() {
		return "host/promotionList";
	}
	
	
	@RequestMapping(value="/promotionView.do", method= RequestMethod.GET)
	public String promotionView() {
		return "host/promotionView";
	}
	
	
	@RequestMapping(value="/notice_dev.do", method= RequestMethod.GET)
	public String notice_dev() {
		return "host/notice_dev";
	}
	
	
	@RequestMapping(value="/noticeView.do", method= RequestMethod.GET)
	public String noticeView() {
		return "host/noticeView";
	}
	
	@RequestMapping(value="/inquiry_FAQ.do", method= RequestMethod.GET)
	public String inquiry_FAQ() {
		return "host/inquiry_FAQ";
	}
	
	
	
	
}
