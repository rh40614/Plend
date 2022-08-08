package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.MyPageDAO;
import three.people.vo.BookVO;
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

	

	
}
