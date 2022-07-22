package three.people.service;

import three.people.vo.UserVO;

public interface MyPageService {
	
	public UserVO userInfo(int uidx);
	public int userModify(UserVO vo);
}
