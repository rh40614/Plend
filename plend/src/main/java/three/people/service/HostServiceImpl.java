package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.HostDAO;
import three.people.vo.PlaceVO;



@Service
public class HostServiceImpl implements HostService {
	
	@Autowired
	HostDAO hostDAO;

	@Override
	public int insertPlace(PlaceVO placeVO) {
		int result = hostDAO.insertPlace(placeVO); 
		return result;
	}
	
	
}
