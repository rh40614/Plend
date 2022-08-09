package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.EventVO;
import three.people.vo.ImageVO;
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
// 07.16 김영민: 업체 장소 총 갯수
	public int totalPlace(SearchVO searchvo) {
		return sqlSession.selectOne("three.people.mapper.adminMapper.totalPlace", searchvo);
	}
// 07.18 김영민: 업체장소 승인여부 변경
	public int approvalYN(PlaceVO placevo) {
		return sqlSession.update("three.people.mapper.adminMapper.approvalYN", placevo);
	}
// 07.18 김영민: 이벤트 등록
	public int insertEvent(EventVO eventvo) {
		return sqlSession.insert("three.people.mapper.adminMapper.insertEvent", eventvo);
	}
// 07.18 김영민: 이벤트 이미지 등록
	public int eventImg(ImageVO imagevo) {
		return sqlSession.insert("three.people.mapper.adminMapper.eventImg", imagevo);
	}
// 07.25 김영민: 장소 eventyn Y로 설정
	public int placeEventUpdate(EventVO eventvo) {
		return sqlSession.update("three.people.mapper.adminMapper.placeEventUpdate", eventvo);
	}
// 07.18 김영민: 이벤트 리스트 불러오기/ 이벤트 게시글 총 갯수
	public List<EventVO> eventList(SearchVO searchvo){
		return sqlSession.selectList("three.people.mapper.adminMapper.eventList", searchvo);
	}
	public int totalEvent() {
		return sqlSession.selectOne("three.people.mapper.adminMapper.totalEvent");
	}
	// 07.19 김영민: 한 이벤트 정보 불러오기
	public EventVO eventOne(EventVO eventvo) {
		return sqlSession.selectOne("three.people.mapper.adminMapper.eventOne", eventvo);
	}
	// 07.19 김영민: 이벤트 수정하기 / 이미지 수정 / 이미지 유무
	public int updateEvent(EventVO eventvo) {
		return sqlSession.update("three.people.mapper.adminMapper.updateEvent", eventvo);
	}
	public int updateImg(ImageVO imagevo) {
		return sqlSession.update("three.people.mapper.adminMapper.updateImg", imagevo);
	}
	public int checkImg(ImageVO imagevo) {
		return sqlSession.selectOne("three.people.mapper.adminMapper.checkImg", imagevo);
	}
	// 07.19 김영민: 이벤트 삭제
	public int deleteEvent(EventVO eventvo) {
		return sqlSession.delete("three.people.mapper.adminMapper.deleteEvent", eventvo);
	}
// 07.25 김영민: 장소 eventyn N으로 설정
	public int placeEventDone(EventVO eventvo) {
		return sqlSession.update("three.people.mapper.adminMapper.placeEventDone", eventvo);
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
