package three.people.service;

import java.io.IOException;

import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;

public interface SnsService {

	public SnsVO getAccessToken(SnsVO snsVO);
	public SnsProfileVO getUserProfile(SnsVO snsVO) throws IOException;
	public void snsUnlink(SnsProfileVO snsProfileVO) throws IOException;
	public int userCheck(SnsProfileVO snsProfileVO) throws IOException;
	
}
