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
	
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(PlaceVO placevo, Model model) {
		model.addAttribute("placeOne", placeService.placeOne(placevo));
		model.addAttribute("QnaList", placeService.selectQnA(placevo));
		return "place/placeDetail";
	}
	
	@RequestMapping(value="/question.do", method=RequestMethod.POST)
	public String qna(QnaVO qnavo) {
		placeService.insertQnA(qnavo);
		return "redirect:/place/view.do?pidx="+qnavo.getPidx();
	}
	
}
