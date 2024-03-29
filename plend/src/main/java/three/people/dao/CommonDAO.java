package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Repository
public class CommonDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int insertUser(UserVO vo) {
		int result = sqlSession.insert("three.people.mapper.commonMapper.insertUser", vo);
		
		return result;
	}
	
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.login", vo);
	}
	
	public UserVO searchId(UserVO vo) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.selectId", vo);
	}
	
	public int idCheck(String id) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.idCheck", id);
	}
	
	public int nickNameCheck(String nickName) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.nickNameCheck", nickName);
	}
	
	public int totalCountUser(SearchVO searchvo) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.totalCountUser", searchvo);
	}
	
	public UserVO selectID(UserVO vo) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.selectID", vo);
	}
	
	public int selectPwd (UserVO vo) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.selectPwd", vo);
	}
	
	public int tempPwd(UserVO vo) {
		return sqlSession.update("three.people.mapper.commonMapper.tempPwd", vo);
	}
	public UserVO userInfoByUidx(int uidx){
		return  sqlSession.selectOne("three.people.mapper.commonMapper.userInfoByUidx", uidx);
	}
	public UserVO snsIdCheck(UserVO userVO) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.snsIdCheck", userVO);
	}
	public int insertSnsUser(UserVO userVO) {
		return sqlSession.insert("three.people.mapper.commonMapper.insertSnsUser", userVO);
	}
	public UserVO selectSnsUser(UserVO userVO) {
		return sqlSession.selectOne("three.people.mapper.commonMapper.selectSnsUser", userVO);
	}
}
