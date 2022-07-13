package three.people.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import three.people.service.MainService;
import three.people.vo.NoticeVO;
import three.people.vo.UserVO;

@RequestMapping(value = "/main")
@Controller
public class MainController {
	
	@Autowired
	MainService mainService;

	
	@RequestMapping(value = "notice.do")
	public String notice(Model model, NoticeVO vo) {
		List<NoticeVO> list = mainService.noticeAll(vo);
		model.addAttribute("list", list);
		return "main/notice";
	}
	
	@RequestMapping(value = "noticeReg.do", method = RequestMethod.GET)
	public String noticeReg() {
		
		return "main/noticeReg";
	}
	
	@RequestMapping(value = "noticeReg.do", method = RequestMethod.POST)
	public String noticeReg(NoticeVO vo,HttpServletRequest request, HttpSession session, HttpServletResponse response, MultipartFile file) throws IllegalStateException,IOException {
		
		session = request.getSession();
		
		UserVO login = (UserVO) session.getAttribute("login");
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		File dir = new File(path);
		vo.setUidx(login.getUidx());
		int result = mainService.insertNotice(vo);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path,file.getOriginalFilename())); 
		if(result <= 0) {
			//등록이 제대로 이루어지지 않음
			pw.append("<script>alert('작성이 정상적으로 등록되지 못했습니다. 다시 작성해주세요.');location.href = 'main/notice.do'</script>");
			
			pw.flush();
			
		} else {
			//등록이 제대로 이루어짐
			pw.append("<script>alert('작성이 정상적으로 등록이 되었습니다.');location.href = 'main/notice.do'</script>"); //반환된 bidx가 vo에 담겨 있다.
			
			pw.flush();
		}
		}
		return "main/notice";
		
	}
}
