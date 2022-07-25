package three.people.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import three.people.service.PlaceService;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;

@RequestMapping(value="/place")
@Controller
public final class PlaceController {
	
	@Autowired
	PlaceService placeService;
	
	// 한 장소의 상세보기 페이지
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(PlaceVO placevo, Model model) {
		model.addAttribute("placeOne", placeService.placeOne(placevo));
		model.addAttribute("QnaList", placeService.selectQnA(placevo));
		return "place/placeDetail";
	}
	
	// qna 질문하기 버튼
	@RequestMapping(value="/question.do", method=RequestMethod.POST)
	public String qna(QnaVO qnavo) {
		placeService.insertQnA(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
	
	// qna 답변하기 등록 눌럿을 때 들어오는 매핑
	@RequestMapping(value="/answer.do", method=RequestMethod.POST)
	public String answer(QnaVO qnavo) {
		// qna 답변이라 depth 1 셋팅
		qnavo.setDepth(1);
		
		placeService.insertQnA(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
	// qna 질문 수정하기
	@RequestMapping(value="/questionModify.do", method=RequestMethod.POST)
	public String questionModify(QnaVO qnavo) {
		placeService.qnaModify(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
	//qna 질문 삭제하기
	@RequestMapping(value="/deleteQna.do", method=RequestMethod.GET)
	public String deleteQna(QnaVO qnavo) {
		placeService.deleteQnA(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
















}
