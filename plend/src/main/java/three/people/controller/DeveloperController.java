package three.people.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.AdminService;
import three.people.service.CommonService;
import three.people.service.HostService;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.InquiryVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

// 07.13 김영민 페이지 이동 제작
// 07.27 김하진 비밀번호 수정시 암호화
@RequestMapping(value="/developer")
@Controller
@Configuration
@EnableWebSecurity
public class DeveloperController {

	@Autowired
	AdminService adminService;
	@Autowired
	CommonService commonService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	HostService hostService;
	
	// 회원 리스트로 이동
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

		searchvo.setRole(2);
		int total = commonService.totalCountUser(searchvo);
		searchvo.calPaging(total);

		model.addAttribute("pagenation", searchvo);
		model.addAttribute("userList", adminService.userList(searchvo));

		return "developer/userList";
	}

	//회원 수정 페이지로 이동
	@RequestMapping(value="/userModify.do", method=RequestMethod.GET)
	public String userModify(UserVO uservo, Model model) {
		model.addAttribute("user", adminService.userOne(uservo));
		return "developer/userModify";
	}

	//회원 수정 로직 실행
	@RequestMapping(value="/userModify.do", method=RequestMethod.POST)
	public String userModify(UserVO uservo) {
		String encodedPassword = passwordEncoder.encode(uservo.getPassword());
		uservo.setPassword(encodedPassword);
		int result = adminService.userInfo(uservo);
		if(result == 1) {
			return "redirect:/developer/userList.do";
		}else {
			return "redirect:/developer/userModify.do?uidx=" + uservo.getUidx();
		}
	}

	@RequestMapping(value="/event.do", method=RequestMethod.GET)
	public String event(SearchVO searchvo, Model model ) {
		if(searchvo.getNowPage() == 0) {
			searchvo.setNowPage(1);
		}
		searchvo.setCntPerPage(5);
		searchvo.calPaging(adminService.totalEvent());

		model.addAttribute("pagenation", searchvo);
		model.addAttribute("eventList", adminService.eventList(searchvo));
		return "developer/event";
	}

//	 이벤트 등록
	@Transactional
	@RequestMapping(value="/event.do", method=RequestMethod.POST)
	public String event(EventVO eventvo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		// 이벤트 등록 후 이벤트 인덱스를 받아와 이미지를 등록함
		// 이벤트 틍록 후 장소에도 eventyn값 변경
		int result = adminService.insertEvent(eventvo);
		if(result == 1) {
			if(eventvo.getStartEnd().equals("start")) {
				adminService.placeEventUpdate(eventvo);
			}
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/event");
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			MultipartFile file = eventvo.getEventImg();
			if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(path, file.getOriginalFilename()));
				String originFileName = file.getOriginalFilename();

				//2022.07.21  김연희 : 사진 호출을 위해 사진 저장 이름 변경(사진이름SSS.확장자)
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

				ImageVO imagevo = new ImageVO();
				imagevo.setEidx(eventvo.getEidx());
				imagevo.setPath(path);
				imagevo.setOriginFileName(originFileName);
				imagevo.setRealFileName(realFileName);

				adminService.eventImg(imagevo);
			}

		}else {
			System.out.println("failed");
		}
		return "redirect:/developer/event.do";
	}

	// 이벤트 수정 ajax요청에 대한 응답
	@RequestMapping(value="/modifyEvent.do", method=RequestMethod.GET)
	public String modifyEvent(EventVO eventvo, Model model) {
		model.addAttribute("eventvo", adminService.eventOne(eventvo));
		return "developer/eventModify";
	}
	// 실제 이벤트 수정
	@Transactional
	@RequestMapping(value="/modifyEvent.do", method=RequestMethod.POST)
	public String modifyEvent(EventVO eventvo, HttpServletRequest request) throws IllegalStateException, IOException {
		int result = adminService.updateEvent(eventvo);
		if(result == 1) {
			if(eventvo.getStartEnd().equals("start")) {
				adminService.placeEventUpdate(eventvo);
			}else {
				adminService.placeEventDone(eventvo);
			}
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/event");
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			MultipartFile file = eventvo.getEventImg();
			if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(path, file.getOriginalFilename()));
				String originFileName = file.getOriginalFilename();

				Date now = new Date();
				SimpleDateFormat simple = new SimpleDateFormat("SSS");
				String distinct = simple.format(now);

				String realFileName = originFileName + distinct;

				ImageVO imagevo = new ImageVO();
				imagevo.setEidx(eventvo.getEidx());
				imagevo.setPath(path);
				imagevo.setOriginFileName(originFileName);
				imagevo.setRealFileName(realFileName);

				int rs = adminService.updateImg(imagevo);
			}

		}else {
			System.out.println("failed");
		}
		return "redirect:/developer/event.do";
	}
	// 이벤트 삭제
	@Transactional
	@RequestMapping(value="/deleteEvent.do")
	public String deleteEvent(EventVO eventvo) {
		adminService.deleteEvent(eventvo);
		adminService.placeEventDone(eventvo);
		return "redirect:/developer/event.do";
	}
	//업체 리스트 페이지로 이동
	@RequestMapping(value="enterList.do", method=RequestMethod.GET)
	public String enterList(SearchVO searchvo, Model model) {
		if(searchvo.getNowPage() == 0 && searchvo.getCntPerPage() == 0) {
			searchvo.setNowPage(1);
			searchvo.setCntPerPage(10);
		}else if(searchvo.getCntPerPage() == 0) {
			searchvo.setCntPerPage(10);
		}else if(searchvo.getNowPage() == 0) {
			searchvo.setNowPage(1);
		}

		searchvo.setRole(3);
		int total = commonService.totalCountUser(searchvo);
		searchvo.calPaging(total);
		model.addAttribute("pagenation", searchvo);
		model.addAttribute("enterList", adminService.userList(searchvo));

		return "developer/enterList";
	}

	//업체 수정페이지로 이동
	//해당 업체 데이터도 넘겨주기
	@RequestMapping(value="enterModify.do", method=RequestMethod.GET)
	public String enterModify(UserVO uservo, Model model) {
		model.addAttribute("enter", adminService.userOne(uservo));
		model.addAttribute("placeList", adminService.enterPlace(uservo));
		return "developer/enterModify";
	}
	//업체정보 수정하기
	@RequestMapping(value="enterModify.do", method=RequestMethod.POST)
	public String enterModify(UserVO uservo) {
		adminService.userInfo(uservo);
		return "redirect:/developer/enterList.do";
	}
	//업체 삭제
	@RequestMapping(value="enterDelete.do", method=RequestMethod.GET)
	public String deleteEnter(UserVO uservo) {
		adminService.deleteEnter(uservo);
		return "redirect:/developer/enterList.do";
	}


	//업체 장소 등록 승인 페이지
	@RequestMapping(value="enterConfirm.do", method=RequestMethod.GET)
	public String enterConfirm(SearchVO searchvo, Model model) {
		if(searchvo.getNowPage() == 0 && searchvo.getCntPerPage() == 0) {
			searchvo.setNowPage(1);
			searchvo.setCntPerPage(10);
		}else if(searchvo.getCntPerPage() == 0) {
			searchvo.setCntPerPage(10);
		}else if(searchvo.getNowPage() == 0) {
			searchvo.setNowPage(1);
		}

		int total = adminService.totalPlace(searchvo);
		searchvo.calPaging(total);
		model.addAttribute("pagenation", searchvo);
		model.addAttribute("placeList", adminService.apPlace(searchvo));
		return "developer/enterConfirm";
	}

	@RequestMapping(value="confirm.do", method=RequestMethod.GET)
	public String confirm(PlaceVO placevo) {
		adminService.approvalYN(placevo);
		return "redirect:/developer/enterConfirm.do";
	}

	@RequestMapping(value="reportList.do", method=RequestMethod.GET)
	public String reportList() {
		return "developer/reportList";
	}

	@RequestMapping(value="enterBlock.do", method=RequestMethod.GET)
	public String enterBlock() {
		return "developer/enterBlock";
	}
	
	// 07.28 김영민: 개발자 페이지에서 호스트의 문의 내역보기
	@RequestMapping(value="inquiryList.do", method=RequestMethod.GET)
	public String inquiryList(SearchVO searchVO, Model model) {
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(10);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(10);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		searchVO.calPaging(hostService.countInquiry(searchVO));
		
		model.addAttribute("pagination", searchVO);
		model.addAttribute("list", hostService.developerInquiry(searchVO));
		
		return "developer/inquiryList";
	}
	
	// 07.28 김영민: 호스트 문의내역 답변달기
	@RequestMapping(value="replyInquiry.do", method=RequestMethod.GET)
	public String replyInquiry(InquiryVO inquiryVO, Model model) {
		InquiryVO inquiry = hostService.selectInquiryOne(inquiryVO);
		model.addAttribute("inquiry",inquiry);
		model.addAttribute("reply", hostService.selectReplyOne(inquiryVO));
		
		return "host/inquiry_dev/reply";
	}

}
