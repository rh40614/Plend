package three.people.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.HostDAO;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.InquiryVO;
import three.people.vo.NoticeVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;




@Service
public class HostServiceImpl implements HostService {
	
	@Autowired
	HostDAO hostDAO;


	@Override
	public int insertPlace(PlaceVO placeVO) {
		//System.out.println("service에서"+placeVO.getAvailTime());
		int result = hostDAO.insertPlace(placeVO); 
		return result;
	}


	@Override
	public int insertPlaceImg(ImageVO imageVO) {
		int result = hostDAO.insertPlaceImg(imageVO);
		return result;
	}


	@Override
	public List<EventVO> eventList(EventVO eventVO) {
		List<EventVO> result = hostDAO.eventList(eventVO);
		return result;
	}

	@Override
	public EventVO eventOne(EventVO eventVO) {
		EventVO result = hostDAO.eventOne(eventVO);
		return result;
	}

	//사진 리스트
	@Override
	public List<ImageVO> eventImageList(EventVO eventVO) {
		List<ImageVO> result = hostDAO.eventImageList(eventVO);
		return result;
	}
	//사진 하나
	@Override
	public ImageVO eventImage(EventVO eventVO) {
		ImageVO result = hostDAO.eventImage(eventVO);
		return result;
	}

	//운영자 문의
	@Override
	public int insertInquiry_dev(InquiryVO inquiryVO) {
		int result = hostDAO.insertInquiry_dev(inquiryVO);
		return result;
	}


	@Override
	public List<InquiryVO> selectInquiry(HashMap<String, Integer> page) {
		List<InquiryVO> result= hostDAO.selectInquiry(page);
		return result;
	}


	@Override
	public InquiryVO selectInquiryOne(InquiryVO inquiryVO) {
		InquiryVO result = hostDAO.selectInquiryOne(inquiryVO);
		return result;
	}


	@Override
	public int cntIqidx(InquiryVO inquiryVO) {
		int result = hostDAO.cntIqidx(inquiryVO);
		return result;
	}


	@Override
	public int inquiryEdit_dev(InquiryVO inquiryVO) {
		int result = hostDAO.inquiryEdit_dev(inquiryVO);
		return result;
	}


	@Override
	public int reply(InquiryVO inquiryVO) {
		int result = hostDAO.reply(inquiryVO);
		return result;
	}


	@Override
	public InquiryVO selectReplyOne(InquiryVO inquiryVO) {
		InquiryVO result = hostDAO.selectReplyOne(inquiryVO);
		return result;
	}


	@Override
	public int updateAnswerYN(InquiryVO inquiryVO) {
		int result = hostDAO.updateAnswerYN(inquiryVO);
		return result;
	}


	@Override
	public List<QnaVO> selectQna(HashMap<String, Integer> page) {
		List<QnaVO> result = hostDAO.selectQna(page);
		return result;
	}


	@Override
	public int cntQidx(UserVO userVO) {
	 int result = hostDAO.cntQidx(userVO);
		return result;
	}


	@Override
	public List<QnaVO> qnaList(HashMap<String, Integer> page) {
		List<QnaVO> result = hostDAO.qnaList(page);
		return result;
	}


	@Override
	public List<NoticeVO> selectNoticeAll(SearchVO searchVO) {
		List<NoticeVO> result = hostDAO.selectNoticeAll(searchVO);
		return result;
	}


	@Override
	public int cntNotice(SearchVO searchVO) {
		int result = hostDAO.cntNotice(searchVO);
		return result;
	}


	@Override
	public NoticeVO prevNextNidx(NoticeVO noticeVO) {
		NoticeVO result = hostDAO.prevNextNidx(noticeVO);
		return result;
	}


	@Override
	public NoticeVO prevNextTitle(NoticeVO noticeVO) {
		NoticeVO result = hostDAO.prevNextTitle(noticeVO);
		return result;
	}


	@Override
	public NoticeVO noticeOne(NoticeVO noticeVO) {
		NoticeVO result = hostDAO.noticeOne(noticeVO);
		return result;
	}


	@Override
	public int deleteNotice(NoticeVO noticeVO) {
		int result = hostDAO.deleteNotice(noticeVO);
		return result;
	}


	@Override
	public List<InquiryVO> developerInquiry(SearchVO searchvo) {
		return hostDAO.developerInquiry(searchvo);
	}


	@Override
	public int countInquiry(SearchVO searchvo) {
		return hostDAO.countInquiry(searchvo);
	}


	@Override
	public int replyModify(InquiryVO inquiryVO) {
		return hostDAO.replyModify(inquiryVO);
	}
	
	
	
}
