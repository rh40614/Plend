package three.people.service;

import java.util.List;

import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;

public interface PlaceService {
	
	public List<PlaceVO> selectPlaceAll(SearchVO searchVO);
	public int cntPlace(PlaceVO pidx);

}
