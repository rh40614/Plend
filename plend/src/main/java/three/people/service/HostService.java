package three.people.service;

import java.util.HashMap;
import java.util.List;

import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.InquiryVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;


public interface HostService {
	//장소
	public int insertPlace(PlaceVO placeVO);
	public int insertPlaceImg(ImageVO imageVO);
	//이벤트
	public List<EventVO> eventList(EventVO eventVO);
	public EventVO eventOne(EventVO eventVO);
	
	public List<ImageVO> eventImageList(EventVO eventVO);
	public ImageVO eventImage(EventVO eventVO);
	
	//운영자 문의
	public int insertInquiry_dev(InquiryVO inquiryVO);
	public List<HashMap<String, Integer>> selectInquiry(HashMap<String, Integer> page);
	public InquiryVO selectInquiryOne(InquiryVO inquiryVO);
	public int cntIqidx(InquiryVO inquiryVO);
	public int inquiryEdit_dev(InquiryVO inquiryVO);
}
