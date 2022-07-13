package three.people.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.PlaceVO;

@Repository
public class HostDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	String namespace="three.people.mapper.hostMapper";
	
	public int insertPlace(PlaceVO placeVO) {
		int result = sqlSession.insert(namespace+".insertPlace");
		return result;
	}
	
	
}
