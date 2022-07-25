package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.PlaceDAO;
import three.people.vo.BookVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;

@Service
public class PlaceServiceIml implements PlaceService{

	@Autowired
	PlaceDAO placeDAO;
	
	@Override
	public List<PlaceVO> selectPlaceAll(SearchVO searchVO) {
		List<PlaceVO> result = placeDAO.selectPlaceAll(searchVO);
		System.out.println("result"+result);
		return result;
	}

	@Override
	public int cntPlace(PlaceVO pidx) {
		int result = placeDAO.cntPlace(pidx);
		return result;
	}

	@Override
	public PlaceVO placeOne(PlaceVO placevo) {
		return placeDAO.placeOne(placevo);
	}

	@Override
	public int insertQnA(QnaVO qnavo) {
		return placeDAO.insertQnA(qnavo);
	}

	@Override
	public List<QnaVO> selectQnA(PlaceVO placevo) {
		return placeDAO.selectQnA(placevo);
	}

	@Override
	public int qnaModify(QnaVO qnavo) {
		return placeDAO.qnaModify(qnavo);
	}

	@Override
	public int deleteQnA(QnaVO qnavo) {
		return placeDAO.deleteQnA(qnavo);
	}

	@Override
	public int insertBook(BookVO bookvo) {
		return placeDAO.insertBook(bookvo);
	}

}
