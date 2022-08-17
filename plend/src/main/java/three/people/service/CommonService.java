package three.people.service;

import java.util.List;

import three.people.vo.SearchVO;
import three.people.vo.UserVO;

public interface CommonService {
	
	int totalCountUser(SearchVO searchvo);
	UserVO userInfoByUidx(int uidx);
	UserVO snsIdCheck(UserVO userVO);
	int insertSnsUser(UserVO userVO);
}
