package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.BookVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public UserVO userInfo(int uidx) {
		
		return sqlSession.selectOne("three.people.mapper.mypageMapper.userInfo", uidx);
	}
	
	public int userModify(UserVO vo) {
		
		int result = sqlSession.update("three.people.mapper.mypageMapper.userModify", vo);
		
		return result;
	}
	
	public List<HashMap<String, Integer>> bookedList(HashMap<String, Integer> param) {
		
		return sqlSession.selectList("three.people.mapper.mypageMapper.bookedList", param);
	}
	
	public List<BookVO> bookList(UserVO vo) {
		
		return sqlSession.selectList("three.people.mapper.mypageMapper.bookList", vo);
	}
	
	public BookVO bookOne(UserVO vo) {
		
		return sqlSession.selectOne("three.people.mapper.mypageMapper.bookOne", vo);
	}

	public int bookTotal(UserVO vo) {
		
		return sqlSession.selectOne("three.people.mapper.mypageMapper.bookTotal", vo);
	}
	
	public int cancelBook(int bidx) {
		int result = sqlSession.update("three.people.mapper.mypageMapper.cancelBook", bidx);
		return result;
	}
	
	public int userWithdraw(int uidx) {
		
		int result = sqlSession.update("three.people.mapper.mypageMapper.userWithdraw", uidx);
		
		return result;
	}
	
	public int checkUser(int uidx) {
		return sqlSession.selectOne("three.people.mapper.mypageMapper.checkUser", uidx);
	}
	
	public UserVO inquirePwd(int uidx) {
		return sqlSession.selectOne("three.people.mapper.mypageMapper.inquirePwd", uidx);
	}
	
	





} 
