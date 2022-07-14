package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<UserVO> userList(SearchVO searchvo){
		return sqlSession.selectList("three.people.mapper.adminMapper.userList", searchvo);
	}
}
