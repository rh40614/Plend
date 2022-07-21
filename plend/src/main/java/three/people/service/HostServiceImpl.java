package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.HostDAO;
import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.InquiryVO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;




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


	@Override
	public int insertInquiry_dev(InquiryVO inquiryVO) {
		int result = hostDAO.insertInquiry_dev(inquiryVO);
		return result;
	}
	
}
