package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.MyPageDAO;
import three.people.vo.BookVO;
import three.people.vo.HeartVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Service
public class MyPageServiceImple implements MyPageService{
	
	@Autowired
	MyPageDAO mypageDao;

	@Override
	public UserVO userInfo(int uidx) {
		
		return mypageDao.userInfo(uidx);
	}

	@Override
	public int userModify(UserVO vo) {
		
		int result = mypageDao.userModify(vo);
		
		return result;
	}

	@Override
	public List<HashMap<String, Integer>> BookedList(HashMap<String, Integer> param) {
		
		return mypageDao.bookedList(param);
	}

	@Override
	public BookVO bookOne(UserVO vo) {
		
		return mypageDao.bookOne(vo);
	}

	@Override
	public int bookTotal(UserVO vo) {
		
		return mypageDao.bookTotal(vo);
	}

	@Override
	public List<BookVO> BookList(UserVO vo) {
		
		return mypageDao.bookList(vo);
	}

	@Override
	public int cancelBook(int bidx) {
		
		int result = mypageDao.cancelBook(bidx);
		
		return result;
	}

	@Override
	public int userWithdraw(int uidx) {
		int result = mypageDao.userWithdraw(uidx);
		return result;
	}

	@Override
	public int checkUser(int uidx) {
		
		return mypageDao.checkUser(uidx);
	}

	@Override
	public UserVO inquirePwd(int uidx) {
		
		return mypageDao.inquirePwd(uidx);
	}

	@Override
	public List<PlaceVO> selectPlace(HashMap<String, Integer> param) {
		List<PlaceVO> result =  mypageDao.selectPlace(param);
		//장소 이름 자르기
				for(PlaceVO place: result) {
					//단일 공백 정규식 : \\s
					String[] ad = place.getAddress().split("\\s");
					String twoFromStart = ad[0] +" " +ad[1];
					//System.out.println("twoFromStart: "+twoFromStart);
					
					place.setAddress(twoFromStart);
				}
		return result;
	}

	@Override
	public ImageVO selectImg(PlaceVO vo) {
		
		return mypageDao.selectImg(vo);
	}

	@Override
	public int likeListTotal(int uidx) {
		
		return mypageDao.likeListTotal(uidx);
	}

	@Override
	public int likeAdd(HeartVO heartvo) {
		
		return mypageDao.likeAdd(heartvo);
	}

	@Override
	public int likeDelete(HeartVO heartvo) {
		
		return mypageDao.likeDelete(heartvo);
	}

	@Override
	public List<HeartVO> selectHeart(HeartVO heartvo) {
		
		return mypageDao.selectHeart(heartvo);
	}

	@Override
	public int avgRevew(PlaceVO placeVO) {
		
		return mypageDao.avgRevew(placeVO);
	}

	
}
