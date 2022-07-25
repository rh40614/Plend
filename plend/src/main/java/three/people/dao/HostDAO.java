package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.InquiryVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;


@Repository
public class HostDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace="three.people.mapper.hostMapper";
	
	//장소
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
	//이벤트 사진 리스트 
	public List<ImageVO> eventImageList(EventVO eventVO) {
		List<ImageVO> result = sqlSession.selectList(namespace+".eventImage", eventVO);
		return result;
	}	
	//사진 하나 
	public ImageVO eventImage(EventVO eventVO) {
		ImageVO result = sqlSession.selectOne(namespace+".eventImage", eventVO);
		return result;
	}
	//이벤트 하나
	public EventVO eventOne(EventVO eventVO) {
		EventVO result= sqlSession.selectOne(namespace+".eventOne", eventVO);
		return result;
	}
	public int insertInquiry_dev(InquiryVO inquiryVO) {
		int result = sqlSession.insert(namespace+".insertInquiry_dev", inquiryVO);
		return result;
	} 
	
	//운영자 문의
	public List<HashMap<String, Integer>> selectInquiry(HashMap<String, Integer> page) {
		List<HashMap<String, Integer>> result = sqlSession.selectList(namespace+".selectInquiry", page);
		return result;
	} 
	public InquiryVO selectInquiryOne(InquiryVO inquiryVO) {
		InquiryVO result = sqlSession.selectOne(namespace+".selectInquiryOne", inquiryVO);
		return result;
	} 
	public int cntIqidx(InquiryVO inquiryVO) {
		int result = sqlSession.selectOne(namespace+".cntIqidx", inquiryVO);
		return result;
	}
	public int inquiryEdit_dev(InquiryVO inquiryVO) {
		int result = sqlSession.update(namespace+".inquiryEdit_dev", inquiryVO);
		return result;
	}
	public int reply(InquiryVO inquiryVO) {
		int result =sqlSession.insert(namespace+".reply", inquiryVO);
		return result;
	}

	
}
