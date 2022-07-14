package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.HostDAO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;




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
	
	
}
