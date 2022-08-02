package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.BookVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

public interface MyPageService {
	
	public UserVO userInfo(int uidx);
	public int userModify(UserVO vo);
	public List<HashMap<String, Integer>> BookedList(HashMap<String, Integer> param);
	public List<BookVO> BookList(UserVO vo);
	public BookVO bookOne(UserVO vo);
	public int bookTotal(UserVO vo);
	public int cancelBook(int bidx);
	public int userWithdraw(int uidx);
	public int checkUser(int uidx);
	public UserVO inquirePwd(int uidx);
	public int insertReview(ReviewVO reviewVO);
}
