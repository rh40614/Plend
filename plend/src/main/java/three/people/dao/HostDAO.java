package three.people.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;


@Repository
public class HostDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace="three.people.mapper.hostMapper";
	
	public int insertPlace(PlaceVO placeVO) {
		int result = sqlSession.insert(namespace+".insertPlace", placeVO);
		return result;
	}
	
	
	public int insertPlaceImg(ImageVO imageVO) {
		int result = sqlSession.insert(namespace+".insertPlaceImg", imageVO);
		return result;
	}
	
	//이벤트 리스트
	public List<EventVO> eventList(EventVO eventVO) {
		List<EventVO> result= sqlSession.selectList(namespace+".eventList", eventVO);
		return result;
	}
	
//	//이벤트 이미지 리스트 
//	public List<ImageVO> eventImageList(EventVO eventVO) {
//		List<ImageVO> result = sqlSession.selectList(namespace+".eventImage", eventVO);
//		return result;
//		
//	}
	//이벤트 하나
	public EventVO eventOne(EventVO eventVO) {
		EventVO result= sqlSession.selectOne(namespace+".eventOne", eventVO);
		return result;
	}
	
	//사진 하나 
	public ImageVO eventImage(EventVO eventVO) {
		ImageVO result = sqlSession.selectOne(namespace+".eventImage", eventVO);
		return result;
		
	}
	
	
}
