package three.people.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/host")
@Controller
public class HostController {

	@RequestMapping(value = "/insertPlace.do")
	public String insertplace() {
		
		
		
		
		
		return "host/managePlace.do";
	}
	
}
