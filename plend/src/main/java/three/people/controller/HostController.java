package three.people.controller;


import java.io.File;
import java.io.IOException;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.HostService;
import three.people.vo.PlaceVO;



@RequestMapping(value = "/host")
@Controller
public class HostController {

	@Autowired
	HostService hostService;
	
	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.GET )
	public String insertPlace() {  
		System.out.println("장소등록GET");
		
		return "host/insertPlace";
	}
	
	
	@RequestMapping(value = "/insertPlace.do", method = RequestMethod.POST )
	public String insertPlace(PlaceVO placeVO, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println("장소등록POST");
		
		
		//사진이 저장될 경로
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/placeImg");
		
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) {	//위치가 존재하는지 확인
			 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
		 }
		
		if(!file.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
			file.transferTo(new File(path,file.getOriginalFilename()));		//error는 throw	//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
		}else {
			System.out.println("업로드할 파일이 존재하지 않습니다.");
		}
		
		
		hostService.insertPlace(placeVO);
		
		
		return "redirect:/host/managePlace.do";
	}

	
	
	@RequestMapping(value="/managePlace.do", method = RequestMethod.GET)
	public String managePlace() {
		System.out.println("장소관리 페이지 ");
		
		return "host/managePlace";
	}
	
	
	
	
	
}
