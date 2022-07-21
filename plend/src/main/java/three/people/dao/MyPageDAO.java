package three.people.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
