package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.PlaceDAO;
import three.people.vo.PlaceVO;

@Service
public class PlaceServiceIml implements PlaceService{

	@Autowired
	PlaceDAO placeDAO;
	
	@Override
	public List<PlaceVO> selectPlaceAll(PlaceVO placeVO) {
		List<PlaceVO> result = placeDAO.selectPlaceAll(placeVO);
		return result;
	}

}
