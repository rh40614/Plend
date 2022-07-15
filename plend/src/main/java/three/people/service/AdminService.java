package three.people.service;

import java.util.List;

import three.people.vo.PlaceVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

public interface AdminService {
		
	List<UserVO> userList(SearchVO searchvo);
	UserVO userOne(UserVO uservo);
	int userInfo(UserVO uservo);
	int deleteEnter(UserVO uservo);
	List<PlaceVO> enterPlace(UserVO uservo);
	List<PlaceVO> apPlace(SearchVO searchvo);
}
