package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession sqlSession;
	
//	07.14 김영민 유저 총인원/ 개별인원 검색 DAO
	public List<UserVO> userList(SearchVO searchvo){
		return sqlSession.selectList("three.people.mapper.adminMapper.userList", searchvo);
	}
	
	public UserVO userOne(UserVO uservo) {
		return sqlSession.selectOne("three.people.mapper.adminMapper.userOne", uservo);
	}
//	07.15 김영민: 유저 정보수정
	public int userInfo(UserVO uservo) {
		return sqlSession.update("three.people.mapper.adminMapper.userInfo", uservo);
	}
//	07.15 김영민: 업체 삭제
	public int deleteEnter(UserVO uservo) {
		return sqlSession.update("three.people.mapper.adminMapper.enterDelete", uservo);
	}
// 07.15 김영민: 한 업체의 장소	
	public List<PlaceVO> enterPlace(UserVO uservo){
		return sqlSession.selectList("three.people.mapper.adminMapper.enterPlace", uservo);
	}
// 07.15 김영민: 승인여부 업체 리스트
	public List<PlaceVO> apPlace(SearchVO searchvo){
		return sqlSession.selectList("three.people.mapper.adminMapper.approvalPlace", searchvo);
	}
}
