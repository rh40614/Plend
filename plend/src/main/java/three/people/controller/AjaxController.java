package three.people.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import three.people.service.AdminService;
import three.people.service.HostService;
import three.people.vo.BlockVO;
import three.people.vo.BookVO;
import three.people.vo.ReportVO;
import three.people.vo.SearchVO;

@RequestMapping(value="/ajax")
@Controller
public class AjaxController {

	@Autowired
	AdminService adminService;
	@Autowired
	HostService hostService;
	
	// 리뷰 블라인드처리, 신고내역 버튼 회색처리
	@ResponseBody
	@RequestMapping(value="/reviewBlind.do", method=RequestMethod.GET, produces="application/json; utf-8")
	public int blind(ReportVO reportVO) {
		int result = adminService.reviewBlind(reportVO);
		return result;
	}
	
	// 업체가 등록한 블랙리스트 불러오기
	@RequestMapping(value="/callEnterBlockList.do", method=RequestMethod.GET)
	public String callEnterBlockList(BlockVO blockVO, SearchVO searchVO, Model model) {
		if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		searchVO.setCntPerPage(5);
		searchVO.calPaging(adminService.countBlockUser(blockVO));
		
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("blockVO", blockVO);
		hashMap.put("searchVO", searchVO);
		
		List<BlockVO> blockList = adminService.blockUser(hashMap);
		
		model.addAttribute("uidx", blockVO.getUidx());
		model.addAttribute("blockList", blockList);
		model.addAttribute("pagination2", searchVO);
		return "developer/enterBlockList";
	}
	
	//08.10 김연희 : 호스트 센터 에약 승인 
	@ResponseBody
	@RequestMapping(value="approval.do", method= RequestMethod.GET)
	public int approval(BookVO bookVO) {
		int result = hostService.approval(bookVO);
		if(result == 1) {
			System.out.println("수정완");
		}else {
			System.out.println("수정 실패 ");
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
