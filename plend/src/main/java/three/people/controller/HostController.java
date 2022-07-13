package three.people.controller;


import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import three.people.vo.PlaceVO;

import three.people.service.MainService;

@RequestMapping(value = "/host")
@Controller
public class HostController {

	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.GET )
	public String insertPlace() {  
		System.out.println("장소등록GET");
		
		return "host/insertPlace";
	}
	
	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.POST )
	public String insertPlace(PlaceVO placeVO, MultipartFile file, HttpServletRequest request) {
		System.out.println("장소등록POST");
		
		
		
		
		return "redirect:/host/managePlace.do";
	}

	
	
	@RequestMapping(value="/managePlace.do", method = RequestMethod.GET)
	public String managePlace() {
		System.out.println("장소관리 페이지 ");
		
		return "host/managePlace";
	}
	
	
	
	
	
}
