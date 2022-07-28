package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.PlaceDAO;
import three.people.vo.BookVO;
import three.people.vo.HeartVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;

@Service
public class PlaceServiceIml implements PlaceService{

	@Autowired
	PlaceDAO placeDAO;
	
	@Override
	public List<PlaceVO> selectPlaceAll(HashMap<String, Integer> page) {
		List<PlaceVO> result = placeDAO.selectPlaceAll(page);
		System.out.println("result"+result);
		return result;
	}

	@Override
	public int cntPlace(PlaceVO placeVO) {
		int result = placeDAO.cntPlace(placeVO);
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

	@Override
	public List<ImageVO> selectImage(PlaceVO placevo) {
		return placeDAO.selectImage(placevo);
	}

	@Override
	public List<PlaceVO> categoryPlace(PlaceVO placeVO) {
		return placeDAO.categoryPlace(placeVO);
	}

	@Override
	public ImageVO selectImageOne(PlaceVO placeVO) {
		return placeDAO.selectImageOne(placeVO);
	}

	@Override
	public List<PlaceVO> selectPlace() {
		return placeDAO.selectPlace();
	public int likeAdd(HeartVO heartvo) {
		return placeDAO.likeAdd(heartvo);
	}

	@Override
	public int likeDelete(HeartVO heartvo) {
		return placeDAO.likeDelete(heartvo);
	}

	@Override
	public List<HeartVO> selectHeart(HeartVO heartvo) {
		return placeDAO.selectHeart(heartvo);
	}

}
