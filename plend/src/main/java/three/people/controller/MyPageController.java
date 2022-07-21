package three.people.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.service.MyPageService;
import three.people.vo.UserVO;

@RequestMapping(value = "/myPage")
@Controller
public class MyPageController {

	@Autowired
	MyPageService mypageService;
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(Model model, int uidx) {
		
		UserVO vo = mypageService.userInfo(uidx);
		model.addAttribute("vo", vo);
		
		return "myPage/myInfo";
	}
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.POST)
	public String myInfo(int uidx,UserVO vo, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		int result = mypageService.userModify(vo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		if(result <= 0) { 
			//등록이 제대로 이루어지지 않음
			pw.append("<script>alert('수정이 정상적으로 등록되지 못했습니다. 다시 작성해주세요.');location.href = 'myInfo.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		} else {
			//등록이 제대로 이루어짐
			pw.append("<script>alert('수정이 완료되었습니다.');location.href = 'myInfo.do?uidx="+uidx+"'</script>");
			
			pw.flush();
		}
		
		
		
		return "myPage/myInfo";
	}
	
	@RequestMapping(value = "/bookStatus.do", method = RequestMethod.GET)
	public String bookstatus() {
		
		return "myPage/bookStatus";
	}
	
}
