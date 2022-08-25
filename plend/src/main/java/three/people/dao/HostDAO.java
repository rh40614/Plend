package three.people.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.people.vo.BlockVO;
import three.people.vo.BookVO;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.InquiryVO;
import three.people.vo.NoticeVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.ReviewVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;


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
	public int placeModify(PlaceVO placeVO) {
		return sqlSession.update(namespace+".placeModify", placeVO);
	}
	//장소 상세 보기 
	public PlaceVO placeView(PlaceVO placeVO) {
		return sqlSession.selectOne(namespace+".placeView", placeVO);
	}
	//장소사진삭제
	public int deletePlaceImg(PlaceVO placeVO) {
		return sqlSession.delete(namespace+".deletePlaceImg", placeVO);
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
	public List<InquiryVO> selectInquiry(HashMap<String, Integer> page) {
		List<InquiryVO> result = sqlSession.selectList(namespace+".selectInquiry", page);
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
	public InquiryVO selectReplyOne(InquiryVO inquiryVO) {
		InquiryVO result =sqlSession.selectOne(namespace+".selectReplyOne", inquiryVO);
		return result;
	}
	public int updateAnswerYN(InquiryVO inquiryVO) {
		int result =sqlSession.update(namespace+".updateAnswerYN",inquiryVO);
		return result;
	}
	public List<QnaVO> selectQna(HashMap<String, Integer> page) {
		List<QnaVO> result = sqlSession.selectList(namespace+".selectQna", page);
		return result;
	}
	public List<QnaVO> qnaList(HashMap<String, Integer> page) {
		List<QnaVO> result = sqlSession.selectList(namespace+".qnaList", page);
		return result;
	}
	public int cntQidx(UserVO userVO) {
		int result = sqlSession.selectOne(namespace+".cntQidx", userVO);
		return result;
	}
	
	//공지사항
	public List<NoticeVO> selectNoticeAll (SearchVO searchVO){
		List<NoticeVO> result = sqlSession.selectList(namespace+".selectNoticeAll", searchVO);
		return result;
	}
	public int cntNotice (SearchVO searchVO){
		int result = sqlSession.selectOne(namespace+".cntNotice", searchVO);
		return result;
	}
	public NoticeVO prevNextNidx (NoticeVO noticeVO){
		NoticeVO result = sqlSession.selectOne(namespace+".prevNextNidx", noticeVO);
		return result;
	}
	public NoticeVO prevNextTitle (NoticeVO noticeVO){
		NoticeVO result = sqlSession.selectOne(namespace+".prevNextTitle", noticeVO);
		return result;
	}
	public NoticeVO noticeOne (NoticeVO noticeVO){
		NoticeVO result = sqlSession.selectOne(namespace+".noticeOne", noticeVO);
		return result;
	}
	public int deleteNotice(NoticeVO noticeVO) {
		int result = sqlSession.update(namespace+".deleteNotice", noticeVO);
		return result;
	}
	
	// 개발자페이지
	public List<InquiryVO> developerInquiry(SearchVO searchvo){
		return sqlSession.selectList(namespace+".developerInquiry", searchvo);
	}
	public int countInquiry(SearchVO searchvo) {
		return sqlSession.selectOne(namespace+".countInquiry", searchvo);
	}
	public int replyModify(InquiryVO inquiryVO) {
		return sqlSession.update(namespace+".replyModify", inquiryVO);
	}
	
	// 유저블랙리스트
	public int insertBlockUser(BlockVO blockVO) {
		return sqlSession.insert(namespace+".insertBlockUser", blockVO);
   }
	
	
	//예약 승인,예약 거절
	public int approval(BookVO bookVO) {
		return sqlSession.update(namespace+".approval", bookVO);
	}
	public int insertReject(BookVO bookVO) {
		return sqlSession.insert(namespace+".insertReject", bookVO);
	}
	public int reject(BookVO bookVO) {
		return sqlSession.update(namespace+".reject", bookVO);
	}
	
	
	
	
	
}
