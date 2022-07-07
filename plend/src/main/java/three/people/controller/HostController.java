package three.people.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/host")
@Controller
public class HostController {

	@RequestMapping(value = "/host.do")
	public String host() {
		
		return "host/host";
	}
	
	@RequestMapping(value = "/host2.do")
	public String host2() {
		
		return "host/host2";
	}
	
	@RequestMapping(value = "/host3.do")
	public String host3() {
		
		return "host/host3";
	}
}
