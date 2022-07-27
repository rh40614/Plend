package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.BookVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;

public interface PlaceService {
	
	public List<PlaceVO> selectPlaceAll(HashMap<String, Integer> page);
	public int cntPlace(PlaceVO placeVO);
	public PlaceVO placeOne(PlaceVO placevo);
	public int insertQnA(QnaVO qnavo);
	public List<QnaVO> selectQnA(PlaceVO placevo);
	public int qnaModify(QnaVO qnavo);
	public int deleteQnA(QnaVO qnavo);
	public int insertBook(BookVO bookvo);
	public List<ImageVO> selectImage(PlaceVO placevo);
	public List<PlaceVO> categoryPlace(PlaceVO placeVO);
	public ImageVO selectImageOne(PlaceVO placeVO);
	public List<PlaceVO> selectPlace();
}
