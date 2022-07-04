package three.people.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.UserVO;

@Repository
public class CommonDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int insertUser(UserVO vo) {
		int result = sqlSession.insert("three.people.mapper.commonMapper.insertUser", vo);
		
		return result;
	}
}
