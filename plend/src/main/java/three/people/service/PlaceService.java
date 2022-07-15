package three.people.service;

import java.util.List;

import three.people.vo.PlaceVO;

public interface PlaceService {
	
	public List<PlaceVO> selectPlaceAll(PlaceVO placeVO);

}
