package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.BookVO;
import three.people.vo.EventVO;
import three.people.vo.HeartVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

public interface PlaceService {
	
	public List<PlaceVO> selectPlaceAll(HashMap<String, Object> page);
	public int cntPlace(PlaceVO placeVO);
	public PlaceVO placeOne(PlaceVO placevo);
	public int insertQnA(QnaVO qnavo);
	public List<QnaVO> selectQnA(PlaceVO placevo);
	public int qnaModify(QnaVO qnavo);
	public int deleteQnA(QnaVO qnavo);
	public List<ImageVO> selectImage(PlaceVO placevo);
	public List<PlaceVO> categoryPlace(PlaceVO placeVO);
	public ImageVO selectImageOne(PlaceVO placeVO);
	public List<PlaceVO> selectPlace(UserVO userVO);
	//하트
	public int likeAdd(HeartVO heartvo);
	public int likeDelete(HeartVO heartvo);
	public List<HeartVO> selectHeart(HeartVO heartvo);
	public int countHeart(PlaceVO placeVO);

	public List<PlaceVO> eventPlace(UserVO userVO);
	//07.28 김연희: 리스트 내의 객체를 랜덤으로 9개 가지고 오는 메서드
	public int[] RandomPlace(List<PlaceVO> methodList);
	//검색
	public List<PlaceVO> filter_search(PlaceVO placeVO);
	public int deletePlace(PlaceVO placeVO);
	
	public List<PlaceVO> searchPlace(HashMap<String, Object> search);
	public List<PlaceVO> hashList(String[] tag);

}
