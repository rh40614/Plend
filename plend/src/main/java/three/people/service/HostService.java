package three.people.service;

import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;


public interface HostService {

	public int insertPlace(PlaceVO placeVO);
	public int insertPlaceImg(ImageVO imageVO);
	
}
