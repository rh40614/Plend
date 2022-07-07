package three.people.service;

import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;

public interface SnsService {

	public SnsVO getAccessToken(SnsVO snsVO);
	public SnsProfileVO getUserProfile(SnsProfileVO profileVO);
}
