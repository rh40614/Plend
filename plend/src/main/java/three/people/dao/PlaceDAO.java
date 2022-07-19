package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;


@Repository
public class PlaceDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace="three.people.mapper.placeMapper";
	
	public List<PlaceVO> selectPlaceAll(SearchVO searchVO) {
		List<PlaceVO> result = sqlSession.selectList(namespace+".selectPlaceAll", searchVO);
		return result;
	}
	
	public int cntPlace(PlaceVO pidx) {
		int result = sqlSession.selectOne(namespace+".cntPlace", pidx);
		return result;
		
	}
	
	
	
}
