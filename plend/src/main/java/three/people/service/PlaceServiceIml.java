package three.people.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.people.dao.PlaceDAO;
import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;

@Service
public class PlaceServiceIml implements PlaceService{

	@Autowired
	PlaceDAO placeDAO;
	
	@Override
	public List<PlaceVO> selectPlaceAll(SearchVO searchVO) {
		List<PlaceVO> result = placeDAO.selectPlaceAll(searchVO);
		System.out.println("result"+result);
		return result;
	}

	@Override
	public int cntPlace(PlaceVO pidx) {
		int result = placeDAO.cntPlace(pidx);
		return result;
	}

}
