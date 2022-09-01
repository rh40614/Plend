package three.people.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import three.people.vo.BlockVO;
import three.people.vo.BookVO;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.IncomeVO;
import three.people.vo.InquiryVO;
import three.people.vo.NoticeVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;


public interface HostService {
	//장소
	public int insertPlace(PlaceVO placeVO);
	public int insertPlaceImg(ImageVO imageVO);
	public int placeModify(PlaceVO placeVO);
	public PlaceVO placeView(PlaceVO placeVO);
	//사진삭제
	public int deletePlaceImg(PlaceVO placeVO);
	
	//이벤트
	public List<EventVO> eventList(EventVO eventVO);
	public EventVO eventOne(EventVO eventVO);
	public List<ImageVO> eventImageList(EventVO eventVO);
	public ImageVO eventImage(EventVO eventVO);
	
	//운영자 문의
	public int insertInquiry_dev(InquiryVO inquiryVO);
	public List<InquiryVO> selectInquiry(HashMap<String, Integer> page);
	public InquiryVO selectInquiryOne(InquiryVO inquiryVO);
	public int cntIqidx(InquiryVO inquiryVO);
	public int inquiryEdit_dev(InquiryVO inquiryVO);
	public int reply(InquiryVO inquiryVO);
	public InquiryVO selectReplyOne(InquiryVO inquiryVO);
	public int updateAnswerYN(InquiryVO inquiryVO);
	public List<QnaVO> selectQna(HashMap<String, Integer> page);
	public List<QnaVO> qnaList(HashMap<String, Integer> page);
	public int cntQidx(UserVO userVO);
	
	//공지사항
	public List<NoticeVO> selectNoticeAll (SearchVO searchVO);
	public int cntNotice (SearchVO searchVO);
	public NoticeVO prevNextNidx (NoticeVO noticeVO);
	public NoticeVO prevNextTitle (NoticeVO noticeVO);
	public NoticeVO noticeOne (NoticeVO noticeVO);
	public int deleteNotice(NoticeVO noticeVO);

	//개발자페이지
	public List<InquiryVO> developerInquiry(SearchVO searchvo);
	public int countInquiry(SearchVO searchvo);
	public int replyModify(InquiryVO inquiryVO);
	
	// 유저 블랙 리스트
	public int insertBlockUser(BlockVO blockVO);
	
	//예약
	public int approval(BookVO bookVO);
	public int insertReject(BookVO bookVO);
	public int reject(BookVO bookVO);
	public int insertIncome(IncomeVO incomeVO);
	
}
