package three.people.service;

import java.util.List;

import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.InquiryVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;


public interface HostService {

	public int insertPlace(PlaceVO placeVO);
	public int insertPlaceImg(ImageVO imageVO);
	public List<EventVO> eventList(EventVO eventVO);
	public EventVO eventOne(EventVO eventVO);
	
	public List<ImageVO> eventImageList(EventVO eventVO);
	public ImageVO eventImage(EventVO eventVO);
	public int insertInquiry_dev(InquiryVO inquiryVO);
}
