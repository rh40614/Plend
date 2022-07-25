package three.people.service;

import java.util.List;

import three.people.vo.BookVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;

public interface PlaceService {
	
	public List<PlaceVO> selectPlaceAll(SearchVO searchVO);
	public int cntPlace(PlaceVO pidx);
	public PlaceVO placeOne(PlaceVO placevo);
	public int insertQnA(QnaVO qnavo);
	public List<QnaVO> selectQnA(PlaceVO placevo);
	public int qnaModify(QnaVO qnavo);
	public int deleteQnA(QnaVO qnavo);
	public int insertBook(BookVO bookvo);
}
